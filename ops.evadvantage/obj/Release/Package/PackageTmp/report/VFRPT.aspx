<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VFRPT.aspx.cs" Inherits="VFRPT" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employment and Salary Verification Report</title>
    <link href="styles/styles.css" media="all" rel="stylesheet" type="text/css" />
    <link href="styles/fonts.css" media="all" rel="stylesheet" type="text/css" />
    <link href="styles/PrintStyles.css" media="print" rel="stylesheet" type="text/css" />
    <%--    <link href="styles/styles.css" media="print" rel="stylesheet" type="text/css" />
    <link href="styles/fonts.css" media="print" rel="stylesheet" type="text/css" />--%>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrint">
        <div class="reportLogo">
            <img src="images/ev-advantage-report-logo.png" alt="" /></div>
        <!--Grid [Start]-->
        <div class="grid brd-5">
            <h1 class="mainHd">
                Employment and Salary Verification Report</h1>
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
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6" style="font-size: 12px;">
                                <asp:Label Visible="false" ID="lblSavageMsg" runat="server" Text="A good-faith effort shall be made to retrieve and provide previous DOT record information, for verification purposes, free of charge, per part 382 of the DOT code, within the 30 day required time period."></asp:Label>
                                <asp:Label Visible="false" ID="lblPDS" runat="server" Font-Italic="true" Text="This wage verification is applicable to all employees of Pacific Dental Services, Inc. (“PDS®”) and its Affiliated Entities.  The statement refers to totals from your employer(s), whether that is PDS or an Affiliated Entity. PDS’ human resources and payroll department provide support in the administration of employee policies to PDS and all Affiliated Entities."></asp:Label>
                                <asp:Label Visible="false" ID="lblCashcall" runat="server" Font-Italic="true" Text="Statement for gross earnings may include the following: base pay rate and tier adjustment or guarantee earnings rate."></asp:Label>
                            </td>
                        </tr>
                    </tfoot>
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
                    &nbsp;<input name="b_print" type="button" onclick="printdiv('divPrint');"  value=" Print "
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
