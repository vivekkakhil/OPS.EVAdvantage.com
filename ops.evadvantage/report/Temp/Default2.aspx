<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
 <title>Employment and Salary Verification Report</title>
<link href="styles/styles.css" rel="stylesheet" type="text/css" />
<link href="styles/fonts.css" rel="stylesheet" type="text/css" />
</head>

<body>
 <form id="form2" runat="server">
   <div class="reportLogo"><img src="images/ev-advantage-report-logo.png" alt="" /></div>
<!--Grid [Start]-->
<div class="grid brd-5">

<h1 class="mainHd">Employment and Salary Verification Report</h1>
<asp:GridView ID="GridView1" runat="server" CssClass="sub-grid brd-5" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="test" HeaderText="Verification for :" SortExpression="test" ItemStyle-CssClass="tlabel" HeaderStyle-CssClass="tlabel" />
    </Columns>
<Columns>
        <asp:BoundField DataField="Naytee Aguilar" HeaderText="Naytee Aguilar" SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    </Columns>
 <Columns>
        <asp:BoundField DataField="Verification" HeaderText="Verification Issued on:" SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>
    <Columns>
        <asp:BoundField DataField="1-13-2014" HeaderText="1-13-2014" SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
     <Columns>
        <asp:BoundField DataField=" Reference Number:" HeaderText=" Reference Number: " SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>

    <Columns>
        <asp:BoundField DataField="123456" HeaderText="123456" SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
   
</asp:GridView>    
    <!--Start-->
    
    <!--END-->
    
    <!--Start-->
    <div class="sub-grid brd-5">
          <h1 class="mainHd">Employee Information</h1>
<%--<asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="280px" AutoGenerateRows="False" EnableModelValidation="True">
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                    
                        <asp:Label ID="Label1" runat="server" Text="Federal ID #: "></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text="Employee First Name: "></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>

            <HeaderStyle Wrap="False" />
          



        </asp:DetailsView>--%>

<div>
<asp:DataList ID="Mydatalist" runat ="Server"
              DataKeyField="EmpInfoId" DataSourceID="SqlDataSource1" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal" >
  <ItemTemplate >
      EmpInfoId:
      <asp:Label ID="EmpInfoIdLabel" runat="server" Text='<%# Eval("EmpInfoId") %>' />
      <br />
      CompanyId:
      <asp:Label ID="CompanyIdLabel" runat="server" Text='<%# Eval("CompanyId") %>' />
      <br />
      FederalId:
      <asp:Label ID="FederalIdLabel" runat="server" Text='<%# Eval("FederalId") %>' />
      <br />
      Bspace1:
      <asp:Label ID="Bspace1Label" runat="server" Text='<%# Eval("Bspace1") %>' />
      <br />
      SSN:
      <asp:Label ID="SSNLabel" runat="server" Text='<%# Eval("SSN") %>' />
      <br />
      FirstName:
      <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
      <br />
      MiddleName:
      <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' />
      <br />
      LastName:
      <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
      <br />
      EmpTitle:
      <asp:Label ID="EmpTitleLabel" runat="server" Text='<%# Eval("EmpTitle") %>' />
      <br />
      DateOfBirth:
      <asp:Label ID="DateOfBirthLabel" runat="server" Text='<%# Eval("DateOfBirth") %>' />
      <br />
      EmpStatus:
      <asp:Label ID="EmpStatusLabel" runat="server" Text='<%# Eval("EmpStatus") %>' />
      <br />
      JobStatus:
      <asp:Label ID="JobStatusLabel" runat="server" Text='<%# Eval("JobStatus") %>' />
      <br />
      LocationCode:
      <asp:Label ID="LocationCodeLabel" runat="server" Text='<%# Eval("LocationCode") %>' />
      <br />
      StateCode:
      <asp:Label ID="StateCodeLabel" runat="server" Text='<%# Eval("StateCode") %>' />
      <br />
      RecentHireDate:
      <asp:Label ID="RecentHireDateLabel" runat="server" Text='<%# Eval("RecentHireDate") %>' />
      <br />
      OriginalHireDate:
      <asp:Label ID="OriginalHireDateLabel" runat="server" Text='<%# Eval("OriginalHireDate") %>' />
      <br />
      OriginalSepDate:
      <asp:Label ID="OriginalSepDateLabel" runat="server" Text='<%# Eval("OriginalSepDate") %>' />
      <br />
      JobTitle:
      <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
      <br />
      SupervisorName:
      <asp:Label ID="SupervisorNameLabel" runat="server" Text='<%# Eval("SupervisorName") %>' />
      <br />
      EmployeeId:
      <asp:Label ID="EmployeeIdLabel" runat="server" Text='<%# Eval("EmployeeId") %>' />
      <br />
      EmpAdd1:
      <asp:Label ID="EmpAdd1Label" runat="server" Text='<%# Eval("EmpAdd1") %>' />
      <br />
      EmpAdd2:
      <asp:Label ID="EmpAdd2Label" runat="server" Text='<%# Eval("EmpAdd2") %>' />
      <br />
      EmpCity:
      <asp:Label ID="EmpCityLabel" runat="server" Text='<%# Eval("EmpCity") %>' />
      <br />
      EmpState:
      <asp:Label ID="EmpStateLabel" runat="server" Text='<%# Eval("EmpState") %>' />
      <br />
      EmpZipCode:
      <asp:Label ID="EmpZipCodeLabel" runat="server" Text='<%# Eval("EmpZipCode") %>' />
      <br />
      EmpPhoneNo:
      <asp:Label ID="EmpPhoneNoLabel" runat="server" Text='<%# Eval("EmpPhoneNo") %>' />
      <br />
      Separation:
      <asp:Label ID="SeparationLabel" runat="server" Text='<%# Eval("Separation") %>' />
      <br />
      SeparationCode:
      <asp:Label ID="SeparationCodeLabel" runat="server" Text='<%# Eval("SeparationCode") %>' />
      <br />
      LastDayWorkDt:
      <asp:Label ID="LastDayWorkDtLabel" runat="server" Text='<%# Eval("LastDayWorkDt") %>' />
      <br />
      BSpace2:
      <asp:Label ID="BSpace2Label" runat="server" Text='<%# Eval("BSpace2") %>' />
      <br />
      UploadDt:
      <asp:Label ID="UploadDtLabel" runat="server" Text='<%# Eval("UploadDt") %>' />
      <br />
      EmpPayrollDate:
      <asp:Label ID="EmpPayrollDateLabel" runat="server" Text='<%# Eval("EmpPayrollDate") %>' />
      <br />
      <br />
  </ItemTemplate>
</asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EVAConnectionString %>" SelectCommand="SELECT TOP (1) EmpInfoId, CompanyId, FederalId, Bspace1, SSN, FirstName, MiddleName, LastName, EmpTitle, DateOfBirth, EmpStatus, JobStatus, LocationCode, StateCode, RecentHireDate, OriginalHireDate, OriginalSepDate, JobTitle, SupervisorName, EmployeeId, EmpAdd1, EmpAdd2, EmpCity, EmpState, EmpZipCode, EmpPhoneNo, Separation, SeparationCode, LastDayWorkDt, BSpace2, UploadDt, EmpPayrollDate FROM EmployeeInfo"></asp:SqlDataSource>
</div>


        <%--<asp:GridView ID="GridView2" runat="server" CssClass="sub-grid brd-5" AutoGenerateColumns="False" EnableModelValidation="True" DataKeyNames="EmpInfoId" DataSourceID="empInfo">
    <Columns>
        <%--<asp:TemplateField SortExpression="test">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("test") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text="Federal ID #"></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="tlabel" />
            <ItemStyle CssClass="tlabel" />
        </asp:TemplateField>--%>
<%--<asp:BoundField DataField="EmpInfoId" SortExpression="EmpInfoId" HeaderText="EmpInfoId" InsertVisible="False" ReadOnly="True">
</asp:BoundField>
<asp:BoundField DataField="CompanyId" SortExpression="CompanyId" HeaderText="CompanyId">
</asp:BoundField>
<asp:BoundField DataField="FederalId" SortExpression="FederalId" HeaderText="FederalId">
</asp:BoundField>
<asp:BoundField DataField="Bspace1" SortExpression="Bspace1" HeaderText="Bspace1">
</asp:BoundField>
<asp:BoundField DataField="SSN" SortExpression="SSN" HeaderText="SSN">
</asp:BoundField>
        <asp:BoundField DataField="FirstName" SortExpression="FirstName" HeaderText="FirstName">
        </asp:BoundField>
        <asp:BoundField DataField="MiddleName" SortExpression="MiddleName" HeaderText="MiddleName">
        </asp:BoundField>
        <asp:BoundField DataField="LastName" SortExpression="LastName" HeaderText="LastName">
        </asp:BoundField>
        <asp:BoundField DataField="EmpTitle" SortExpression="EmpTitle" HeaderText="EmpTitle">
        </asp:BoundField>
        <asp:BoundField DataField="DateOfBirth" SortExpression="DateOfBirth" HeaderText="DateOfBirth">
        </asp:BoundField>
<asp:BoundField DataField="EmpStatus" SortExpression="EmpStatus" HeaderText="EmpStatus">
</asp:BoundField>
<asp:BoundField DataField="JobStatus" SortExpression="JobStatus" HeaderText="JobStatus">
</asp:BoundField>
<asp:BoundField DataField="LocationCode" SortExpression="LocationCode" HeaderText="LocationCode">
</asp:BoundField>
<asp:BoundField DataField="StateCode" SortExpression="StateCode" HeaderText="StateCode">
</asp:BoundField>
<asp:BoundField DataField="RecentHireDate" SortExpression="RecentHireDate" HeaderText="RecentHireDate">
</asp:BoundField>
        <asp:BoundField DataField="OriginalHireDate" HeaderText="OriginalHireDate" SortExpression="OriginalHireDate" />
        <asp:BoundField DataField="OriginalSepDate" HeaderText="OriginalSepDate" SortExpression="OriginalSepDate" />
        <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
        <asp:BoundField DataField="SupervisorName" HeaderText="SupervisorName" SortExpression="SupervisorName" />
        <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" SortExpression="EmployeeId" />
        <asp:BoundField DataField="EmpAdd1" HeaderText="EmpAdd1" SortExpression="EmpAdd1" />
        <asp:BoundField DataField="EmpAdd2" HeaderText="EmpAdd2" SortExpression="EmpAdd2" />
        <asp:BoundField DataField="EmpCity" HeaderText="EmpCity" SortExpression="EmpCity" />
        <asp:BoundField DataField="EmpState" HeaderText="EmpState" SortExpression="EmpState" />
        <asp:BoundField DataField="EmpZipCode" HeaderText="EmpZipCode" SortExpression="EmpZipCode" />
        <asp:BoundField DataField="EmpPhoneNo" HeaderText="EmpPhoneNo" SortExpression="EmpPhoneNo" />
        <asp:BoundField DataField="Separation" HeaderText="Separation" SortExpression="Separation" />
        <asp:BoundField DataField="SeparationCode" HeaderText="SeparationCode" SortExpression="SeparationCode" />
        <asp:BoundField DataField="LastDayWorkDt" HeaderText="LastDayWorkDt" SortExpression="LastDayWorkDt" />
        <asp:BoundField DataField="BSpace2" HeaderText="BSpace2" SortExpression="BSpace2" />
        <asp:BoundField DataField="UploadDt" HeaderText="UploadDt" SortExpression="UploadDt" />
        <asp:BoundField DataField="EmpPayrollDate" HeaderText="EmpPayrollDate" SortExpression="EmpPayrollDate" />
    </Columns>--%>
<%--<Columns>
        <asp:BoundField DataField="Naytee Aguilar"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    </Columns>--%>
<%-- <Columns>
        <asp:BoundField DataField="Verification"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>
    <Columns>
        <asp:BoundField DataField="1-13-2014"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
     <Columns>
        <asp:BoundField DataField=" Reference Number:"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>

    --%><%--<Columns>
        <asp:BoundField DataField="123456" SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>--%>
   
<%--</asp:GridView>--%>
        
    </div>
    <!--END-->
    
    <!--Start-->
    <div class="sub-grid brd-5">
       <h1 class="mainHd">Payroll Detail</h1>
        <asp:GridView ID="GridView3" runat="server" CssClass="sub-grid brd-5" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="test" HeaderText="" SortExpression="test" ItemStyle-CssClass="tlabel" HeaderStyle-CssClass="tlabel" />
    </Columns>
<Columns>
        <asp:BoundField DataField="Naytee Aguilar"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    </Columns>
 <Columns>
        <asp:BoundField DataField="Verification"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>
    <Columns>
        <asp:BoundField DataField="1-13-2014"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
     <Columns>
        <asp:BoundField DataField=" Reference Number:"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>

    <Columns>
        <asp:BoundField DataField="123456" SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
   
</asp:GridView>
         
    </div>
    <!--END-->
    
    <!--Start-->
    <div class="sub-grid brd-5">
        <h1 class="mainHd">Current Year to Date (YTD) Earnings and Prior Years Earnings</h1>
        <asp:GridView ID="GridView4" runat="server" CssClass="sub-grid brd-5" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="test" HeaderText="" SortExpression="test" ItemStyle-CssClass="tlabel" HeaderStyle-CssClass="tlabel" />
    </Columns>
<Columns>
        <asp:BoundField DataField="Naytee Aguilar"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    </Columns>
 <Columns>
        <asp:BoundField DataField="Verification"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>
    <Columns>
        <asp:BoundField DataField="1-13-2014"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
     <Columns>
        <asp:BoundField DataField=" Reference Number:"  SortExpression="Naytee Aguilar" ItemStyle-CssClass="tlabel" />
    
    </Columns>

    <Columns>
        <asp:BoundField DataField="123456" SortExpression="Naytee Aguilar" ItemStyle-CssClass="#" />
    
    </Columns>
   
</asp:GridView>
     
        
    </div>
    <!--END-->
    
    <div class="rpdisclamer">
    <p><strong>Please Note:</strong> The information provided in this Verification of Employment is current as the date provided above “Information Current as of:” The Employer Provides EVAdvantage updated payroll information on a weekly, bi-weekly, semi-monthly, or quarterly basis. EVAdvantage provides information as current as the information that has been provided by the Employer. If you believe the VOE information to be incorrect, or have additional questions please contact EV Advantage at <a href="mailto:verify@evadvantage.com">verify@evadvantage.com</a> or call toll free 877-783-0240. You may also fax your requests to 866-710-3846.</p>
    </div>
    
    
</div><!--Grid [END]-->

</form>
</body>

</html>
