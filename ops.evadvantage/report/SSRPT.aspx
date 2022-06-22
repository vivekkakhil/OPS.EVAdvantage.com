<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSRPT.aspx.cs" Inherits="SSRPT" %>

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
                Social Service Verification</h1>
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
            <!--Start-->
            <div class="sub-grid brd-5">
                <table class="style1">
                    <thead>
                        <tr>
                            <th colspan="6">
                                Employee Information
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Employee First Name:
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblfname"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                Middle:
                            </td>
                            <td class="style3">
                                <asp:Label runat="server" ID="lblMiddle"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 117px">
                                Last Name:
                            </td>
                            <td class="style4">
                                <asp:Label runat="server" ID="lblLast"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tlabel" style="width: 143px">
                                Social Security Number:
                            </td>
                            <td class="style2">
                                <asp:Label runat="server" ID="lblSSN"></asp:Label>
                            </td>
                            <td class="tlabel" style="width: 126px">
                                &nbsp;
                            </td>
                            <td class="style3">
                                &nbsp;
                            </td>
                            <td class="tlabel" style="width: 117px">
                                &nbsp;
                            </td>
                            <td class="style4">
                                &nbsp;
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
        <!--Grid [END]-->
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
