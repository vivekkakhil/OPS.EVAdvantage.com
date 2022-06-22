<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EMPRPT.aspx.cs" Inherits="VFRPT" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employment and Salary Verification Report</title>
    <link href="styles/styles.css" rel="stylesheet" type="text/css" />
    <link href="styles/fonts.css" rel="stylesheet" type="text/css" />
    <link href="styles/PrintStyles.css" media="print" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1
        {
            height: 31px;
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
                Employment&nbsp; Verification Report</h1>
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
            <%--<div class="sub-grid brd-5">
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
                                Last Name:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblLast"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Social Security Number:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblSSN"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employee Id:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEmpID"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Employment Status :
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblestatus"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel">
                                Job Status :
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblJobStatus"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Most Recent Hire Date:
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblMostRHD"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Previous Hire Date :
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblphdt"></asp:Label>
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
                                Job Title :
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblJobTitle"></asp:Label>
                            </td>
                            <td class="tlabel">
                                Separation Date :
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblsepdt"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="height: 31px">
                                Separation Reason :
                            </td>
                            <td class="auto-style1">
                                <asp:Label runat="server" ID="lblreason"></asp:Label>
                            </td>
                            <td class="tlabel" style="height: 31px">
                            </td>
                            <td class="auto-style1">
                            </td>
                            <td class="tlabel" style="height: 31px">
                                &nbsp;
                            </td>
                            <td class="auto-style1">
                                &nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>--%>
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
                                Social Security Number:
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
            <!--END-->
            <!--Start-->
            <!--END-->
            <div class="rpdisclamer">
                <p>
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
