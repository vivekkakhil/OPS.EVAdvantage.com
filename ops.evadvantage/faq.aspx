<%@ Page Language="C#" MasterPageFile="~/EVA.master"  AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" Title="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
        <div class="content"> <b>Frequently Asked Questions </b><br/><a name="top" id="top"></a>
    <br/>
    <ol>
      <li><a href="#faq1">What is EVAdvantage?</a></li>
      <li><a href="#faq2">Where does the data on the EVAdvantage database come from?</a></li>
      <li><a href="#faq3">How often is EVAdvantage database updated?</a></li>
      <li><a href="#faq3">What is a Verifier?</a></li>
      <li><a href="#faq4">What is an Employee?</a></li>
      <li><a href="#faq5">What is an Employer?</a></li>
      <li><a href="#faq6">What is a Record?</a></li>
      <%--<li><a href="#faq7">What is a Salary Key?</a></li>
      <li><a href="#faq8">Why do I need a Salary Key?</a></li>
      <li><a href="#faq9">How do I create a Salary Key?</a></li>--%>
      <li><a href="#faq7">What is a Salary Authorization Code?</a></li>
      <li><a href="#faq8">Why do I need a Salary Authorization Code?</a></li>
      <li><a href="#faq9">How do I create a Salary Authorization Code?</a></li>
      <li><a href="#faq10">What is a User Name and Password?</a></li>
      <%--<li><a href="#faq11">What is an Employer Code?</a></li>--%>
      <li><a href="#faq11">What is a Company Code?</a></li>
    </ol>
    <a name="faq1"></a><strong>1. What is EVAdvantage?</strong><br/>
    EVAdvantage is an online database provider that lenders, prospective employers, and Social Service providers can use to verify the employment and income information of thousands of people. The millions of records in the EVAdvantage database are provided to us by hundreds of employers nationwide and are updated on a regular basis. <br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq2"></a><strong>2. Where Does the Data on EVAdvantage Database Come From?</strong><br/>
    The data in the EVAdvantage database is provided to us by the employers who rely on EVAdvantage to handle employment and income verifications for them.<br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq3"></a><strong>3. How Often is EVAdvantage Database Updated?</strong><br/>
    In most cases, the data in the EVAdvantage database is updated every pay period.<br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq4"></a><strong>4. What is a Verifier?</strong><br/>
    A Verifier is a person or organization that is trying to verify a persons employment or income information. Verifiers include such organizations as:
    <ul>
      <li>Mortgage Companies</li>
      <%--<li>Pre-Employment Screeners</li>--%>
      <li>Other Lenders</li>
      <li>Prospective Employers</li>
      <li>Social Service Agencies</li>
    </ul>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq5"></a><strong>5. What is an Employee?</strong><br/>
    An Employee is a person who has worked for a participating employer and whose employment and income information is available on the EVAdvantage system.<br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq6"></a><strong>6.What is an Employer?</strong><br/>
    An Employer is an organization that uses EVAdvantage to provide secure and immediate access to employment and income information about its employees. <br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq7"></a><strong>7. What is a Record?</strong><br/>
    A record is a secure set of information that is stored in a database. In the case of the EVAdvantage database, each record describes a persons dates of employment with a specific employer. In some cases, this includes information about a persons current and previous employers. <br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq8"></a><strong>8. What is a Salary Authorization Code?</strong><br/>
    A Salary Authorization Code is a nine-digit code that allows a verifier to view employee's income information. A verifier does not need a salary key if
    they only need to view an employee's employment information. There are some things you should keep in mind when it comes to salary authorization code:
    <ul>
      <li>A verifier cannot create a salary authorization code. Instead, they must obtain a salary authorization code from the person whose employment and income information they are trying to verify.</li>
      <li>A salary authorization code only provides one-time access to a person's income data. If a verifier needs to verify an employee's income information for a second time (e.g. at a later date) then they will need a new salary authorization code.</li>
      <li>If a verifier is trying to view an employee's income information for the time they spent with different employers, then the verifier will need a salary authorization code for each of those employers.</li>
    </ul>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq9"></a><strong>9. Why do I need a Salary Authorization Code?</strong><br/>
    In order to protect the privacy of their employees, our employer clients have asked us to require that verifiers obtain a salary key in order to view a persons income information.<br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq10"></a><strong>10. How do I create a Salary Authorization Code?</strong><br/>
    For security and privacy reasons, a verifier cannot create a salary authorization code. Only the person whose information is being verified can create a salary authorization code. If you are a verifier and need to instruct your applicant how to create a salary authorization code, direct him/her to the Employees section of this website and have them create an account.<br/>
    Once the person has logged in, they can create a salary authorization code by going to the Employee section of EVAdvantage web site and login to the system. To do this, they must first enter the ID of the employer that they are trying to create the salary authorization code for and then enter their SSN and PIN . <br/>
    <br/>
    <strong><a href="#top">TOP</a></strong><br/>
    <br/>
    <a name="faq11"></a><strong>11. What is a User Name and Password?</strong><br/>
    <%--A PIN is a number (often between 4 and 8 digits in length) that an employee of a client of EVAdvantage needs to be able to login to the Employee section of EVAdvantage web site and create a salary key. <br/>--%>
    A user name and password is that an employee of a client of EVAdvantage needs to be able to login to the Employee section of EVAdvantage web site and create a salary authorization code. <br/>
    <br/>
    <strong><a href="#top">TOP</a></strong> <br/>
    <br/>
    <a name="faq12"></a><strong>12. What is a Company Code?</strong><br/>
    <%--An Employer Code (which is sometimes known as a Company Code) is a five-digit number that is used to identify a specific employer in the EVAdvantage database. <br/>--%>
    A Company Code is a five-digit number that is used to identify a specific employer in the EVAdvantage database. <br/>
    <br/>
    <strong><a href="#top">TOP</a></strong>
    <div class="clear"></div>
  </div> </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

