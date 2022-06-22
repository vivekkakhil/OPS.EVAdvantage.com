<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MSSRPT.aspx.cs" Inherits="report_MSSRPT" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manual Social Service Verification</title>
    <link href="styles/styles.css" rel="stylesheet" type="text/css" />
    <link href="styles/fonts.css" rel="stylesheet" type="text/css" />
    <link href="styles/PrintStyles.css" media="print" rel="stylesheet" type="text/css" />
    <link href="styles/GridPager.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1
        {
            height: 31px;
        }
        .style1
        {
            width: 976px;
        }
        .style2
        {
            width: 195px;
        }
        .style3
        {
            width: 121px;
        }
        .style4
        {
            width: 139px;
        }
        .style5
        {
            height: 31px;
            width: 195px;
        }
        .style6
        {
            height: 31px;
            width: 121px;
        }
        .style7
        {
            height: 31px;
            width: 139px;
        }
        .grid table td
        {
            background: none;
            width: 140px;
            padding: 8px 10px;
            border: none;
            border-top: none;
            border-left: none;
            border-right: none;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrint">
        <div class="reportLogo">
            <img src="images/ev-advantage-report-logo.png" alt="" /></div>
        <!--Grid [Start]-->
        <div class="grid brd-5">
            <h1 class="mainHd">
                Manual Social Service Verification</h1>
            <!--Start-->
            <div class="sub-grid brd-5">
                <table>
                    <thead>
                        <tr>
                            <th class="tlabel">
                                Verification for :
                            </th>
                            <th>
                                <asp:Label runat="server" ID="lblVarificationFor"></asp:Label>
                            </th>
                            <th class="tlabel">
                                Verification Issued on:
                            </th>
                            <th>
                                <asp:Label runat="server" ID="lblVarificationIssDt"></asp:Label>
                            </th>
                            <th class="tlabel">
                                Reference Number:
                            </th>
                            <th>
                                <asp:Label runat="server" ID="lblRefrenceNo"></asp:Label>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tlabel" style="white-space: nowrap;">
                                Information Current as of:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblInformationCurrentasofDT"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employer:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmployer"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employer Address:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmployerAddress"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Employer Note :
                            </td>
                            <td colspan="5">
                                <asp:Label runat="server" ID="lblEmpNote"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--END-->
            <!--Start-->
            <div class="sub-grid brd-5">
                <table>
                    <thead>
                        <tr>
                            <th colspan="6">
                                Employee Information
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tlabel">
                                Federal ID #:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblFID"></asp:Label>
                            </td>
                            <td class="tlabel">
                                SUI/SUTA #:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblSui"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Social Security #:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblSSN"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Employee First Name:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblfname"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Middle:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblMiddle"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Last:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblLast"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Employee Title:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbltitle"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Date of Birth:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblDOB"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employment Status:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmpStatus"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Job Status:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblJobStatus"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employee Id: :
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmpID"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Location Code:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblLocationCode"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                State Code:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblStateCode"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Job Title:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblJobTitle"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Most Recent Hire Date:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblMostRHD"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Original Hire Date:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOrignalHireDate"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Original separation Date:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="LblOrignalSeprationDt"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Last Day Worked:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblLastDayworked"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Total Time With Employer:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblTotalTime"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Current Supervisor:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblCurrentSuperViisor"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employee Phone:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmpPhone"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Employee Address:
                            </td>
                            <td colspan="5">
                                <asp:Label runat="server" ID="lblEmployeddAddress"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Address 2:
                            </td>
                            <td colspan="5">
                                <asp:Label runat="server" ID="lblAddress2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                City:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblCity"></asp:Label>
                            </td>
                            <td class="tlabel">
                                State:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblState"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Zip:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblZip"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Insurance Available ::
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMIA"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Employee Eligible for Medical Coverage :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblEEMC"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Employee Enrolled for Medical Coverage :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblEEMC1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Reason for Ineligibility :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblRI"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Eligibility Date :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblED"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Coverage Start Date :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMCSD"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Coverage Termination Date :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMCTD"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Carrier Name :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCN"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Policy Number :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMPN"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Group Number :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMGN"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Carrier Phone Number :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCPN"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Carrier Address :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMCA"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Carrier City :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMCC"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Carrier State :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCS"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Carrier Zip Code :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMCZ"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Insurance Coverage Code :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMICC"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Annual Medical Insurance Cost to Employee :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblAMICE"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Dependent Coverage Available :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblDCA"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Number of Dependents Currently Covered for Medical :
                            </td>
                            <td class="style2">
                                <asp:Label ID="lblNDCCM" runat="server"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Covered Dependent #1 :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCD1"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Covered Dependent #2 :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMCD2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Covered Dependent #3 :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMCD3"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Covered Dependent #4 :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCD4"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Covered Dependent #5
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMCD5"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Covered Dependent #6 :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMCD6"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Covered Dependent #7 :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCD7"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Medical Covered Dependent #8 :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblMCD8"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Medical Covered Dependent #9 ::
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblMCD9"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Medical Covered Dependent #10 :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMCD10"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Dental Insurance Available :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblDIA"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Employee Eligible for Dental Coverage :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblEEDC"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Employee Enrolled for Dental Coverage :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblEEDC1"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Dental Policy Number :
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblDPN"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Dental Carrier Name :
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblDCN"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Dental Carrier Phone Number :
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblDCPN"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                &nbsp;
                            </td>
                            <td class="style4">
                                &nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--END-->
            <!--Start-->
            <div class="sub-grid brd-5">
                <table>
                    <thead>
                        <tr>
                            <th colspan="6">
                                Payroll Detail
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tlabel">
                                Pay Frequency:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblPayrFreq"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Rate Basis:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblRatebases"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employee Base Rate:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmployeebaseRate"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Most Recent Change in Rate:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblMostRecentChangeRate"></asp:Label>
                            </td>
                            <td class="tlabel">
                                <%-- Average Hrs. per Pay Period:--%>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblAvgHrsPerPay" Visible="false"></asp:Label>
                            </td>
                            <td class="tlabel">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--END-->
            <!--Start-->
            <div class="sub-grid brd-5">
                <table>
                    <thead>
                        <tr>
                            <th colspan="6">
                                Current Year to Date (YTD) Earnings and Prior Years Earnings
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tlabel" style="white-space: nowrap;">
                                Gross Earnings 2022 YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblGECunnrentYearYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Gross Earnings 2021:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblGEPreviousyear"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Gross Earnings 2020:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblGEPreviouseyear2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Base Pay YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblBasePayYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Base Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbpPasePayPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Base Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblbasePayrPrev2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Overtime Pay YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOvertimepayYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Overtime Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOverTimepayPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Overtime Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOverTimepayPrev2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Commission Pay YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblComissionPayYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Commission Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblcomissionPayPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Commission Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblComissionpayPrev2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Bonus Pay YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblBonusPayYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Bonus Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblBonuPayPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Bonus Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblBonuspayPrev2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Tips YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblTipsYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Tips:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblTipsPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Tips:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblTipsPrev2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Other Pay YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOtherPayYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Other Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOtherpayPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Other Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblOtherPayPrev2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Net Pay YTD:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblNetPayYTD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Net Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblNetPayPrev"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Net Pay:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblNetPayPrev2"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="sub-grid brd-5">
                <table style="width: 100% !important;">
                    <thead>
                        <tr>
                            <th colspan="6">
                                <asp:Label ID="Label21" runat="server" Style="font-size: small; font-weight: 700;"
                                    Text="Employee Payment History"></asp:Label>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <asp:GridView ID="gvPaymentHistoryData" runat="server" AutoGenerateColumns="False"
                                    Width="100%"  CellPadding="4" ForeColor="#333333" GridLines="None"
                                     EmptyDataText="There is no data to display.">
                                    
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="CheckDate" SortExpression="CheckDate" ItemStyle-HorizontalAlign="Center"
                                            ItemStyle-VerticalAlign="Middle">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCheckDatestring" runat="server" Text='<%# Eval("CheckDate","{0:d}") %>'>  </asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCheckDatestring" runat="server" Text='<%# Bind("CheckDate") %>'></asp:TextBox>
                                            </EditItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GrossWage" SortExpression="GrossWage" ItemStyle-HorizontalAlign="Center"
                                            ItemStyle-VerticalAlign="Middle">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGrossWagestring" runat="server" Text='<%# "$ "+string.Format("{0:0.00}", Eval("GrossWage").ToString()) %>'>  </asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtGrossWagestring" runat="server" Text='<%# Bind("GrossWage") %>'></asp:TextBox>
                                            </EditItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="BasePay" SortExpression="BasePay" ItemStyle-HorizontalAlign="Center"
                                            ItemStyle-VerticalAlign="Middle">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBasePaystring" runat="server" Text='<%# "$ "+string.Format("{0:0.00}", Eval("BasePay").ToString()) %>'>  </asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtBasePaystring" runat="server" Text='<%# Bind("BasePay") %>'></asp:TextBox>
                                            </EditItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                  <%-- <PagerStyle HorizontalAlign = "Right" CssClass = "GridPager" />--%>
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" 
                                        />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <%--<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  />--%>
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%--<h3>
                    <asp:Label ID="Label21" runat="server" Style="font-size: small; font-weight: 700;"
                        Text="Employee Payment History"></asp:Label></h3>--%>
            </div>
            <!--END-->
            <div class="rpdisclamer">
                <p style="font-size: 12px;">
                    <strong>Please Note:</strong> The information provided in this Verification of Employment
                    is current as the date provided above “Information Current as of:” The Employer
                    Provides EVAdvantage updated payroll information on a weekly, bi-weekly, semi-monthly,
                    or quarterly basis. EVAdvantage provides information as current as the information
                    that has been provided by the Employer. If you believe the VOE information to be
                    incorrect, or have additional questions please contact EV Advantage at <a href="mailto:verify@evadvantage.com">
                        verify@evadvantage.com</a> or call toll free 877-783-0240. You may also fax
                    your requests to 866-710-3846.</p>
            </div>
			
			            <div class="rpdisclamer">
                <p style="font-size: 12px;">
                   <strong></strong>Totals provided on this verification of employment may not match the amounts reported on an employee’s W2.  Pre tax deductions, reimbursements, retirements plans as well as other items may cause totals to be different than what is reported on this verification of employment and wage.  Should you have questions related to the totals provided, please contact us at 877-783-0240.</p>
            </div>
			
			            <div class="rpdisclamer">
                <p style="font-size: 12px;">
                   <strong></strong></strong> If the information you are requesting is outside the normal range of data that we release to third parties.  We provide information related to current year and two years prior employment and wage information.  Please contact us at 877-783-0240 for assistance.</p>
            </div>
        </div>
        <table width="100%">
            <tr>
                <td align="center">
                    <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click" Text="OK" Width="57px"
                        CssClass="text hidetable" />
                    &nbsp;<input name="b_print" type="button" onclick="printdiv('divPrint');" value=" Print "
                        class="text hidetable">
                </td>
            </tr>
        </table>
    </div>
    <!--Grid [END]-->
    </form>
    <script language="javascript">
        debugger;
        function printdiv(printpage) {
            var newstr = document.getElementById(printpage).innerHTML;
            document.body.innerHTML = newstr;
            window.print();
            return false;
        }
    </script>
</body>
</html>
