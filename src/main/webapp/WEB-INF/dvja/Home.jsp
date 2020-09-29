<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="common/Head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common/Navigation.jsp"></jsp:include>
    <div class='container' style='min-height: 450px'><div class='row'><div class='col-md-12'>

        <div class='row'>
            <div class='col-md-3'>
                <jsp:include page="common/Menu.jsp"></jsp:include>
            </div>
            <div class='col-md-9'>
                <h3>Welcome to <strong>Damn Vulnerable Java Application</strong></h3>
                <p>The <i>Damn Vulnerable Java Application</i> implements a set of intentionally vulnerable functions in Java for learning purpose.
                Start by selecting one of the vulnerability class from the left menu or select one of the link below: </p>

                <ul>
                    <li><a href='<s:url action="a1_injection"/>'>2017-A1: Injection</a></li>
                    <li><a href='<s:url action="a2_broken_auth"/>'>2017-A2: Broken Authentication</a></li>
                    <li><a href='<s:url action="a6_sensitive_data"/>'>2017-A3: Sensitive Data Exposure</a></li>
                    <li><a href='<s:url action="2017_a4_xxe"/>'>2017-A4: XML External Entity (XXE)</a></li>
                    <li><a href='<s:url action="a4_idor"/>'>2017-A5: Broken Access Control (Insufficient Authorization)</a></li>
                    <li><a href='<s:url action="a5_security_misconfiguration"/>'>2017-A6: Security Misconfiguration</a></li>
                    <li><a href='<s:url action="a3_xss"/>'>2017-A7: Cross-site Scripting</a></li>
                    <li><a href='<s:url action="2017_a7_insecure_deserialization"/>'>2017-A8: Insecure Deserialization</a></li>
                    <li><a href='<s:url action="a9_vuln_component"/>'>2017-A9: Using Components with Known Vulnerability</a></li>
                    <li><a href='<s:url action="2017_a10"/>'>2017-A10: Insufficient Logging and Monitoring</a></li>
                    <li>...</li>
                    <li><a href='<s:url action="a7_missing_access_control"/>'>2013-A7: Missing Function Level Access Control</a></li>
                    <li><a href='<s:url action="a8_csrf"/>'>2013-A8: Cross-site Request Forgery</a></li>
                    <li><a href='<s:url action="a10_redirect"/>'>2013-A10: Unvalidated Redirects and Forwards</a></li>
                </ul>

                <p>This version of DVJA is mapped to <a href="#">OWASP Top 10 2017</a></p>
            </div>
        </div>

    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
