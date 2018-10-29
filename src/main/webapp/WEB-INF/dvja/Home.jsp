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
                    <li><a href='<s:url action="a1_injection"/>'>A1: Injection</a></li>
                    <li><a href='<s:url action="a2_broken_auth"/>'>A2: Broken Authentication and Session Management</a></li>
                    <li><a href='<s:url action="a3_xss"/>'>A3: Cross-site Scripting</a></li>
                    <li><a href='<s:url action="a4_idor"/>'>A4: Insecure Direct Object Reference</a></li>
                    <li><a href='<s:url action="a5_security_misconfiguration"/>'>A5: Security Misconfiguration</a></li>
                    <li><a href='<s:url action="a6_sensitive_data"/>'>A6: Sensitive Data Exposure</a></li>
                    <li><a href='<s:url action="a7_missing_access_control"/>'>A7: Missing Function Level Access Control</a></li>
                    <li><a href='<s:url action="a8_csrf"/>'>A8: Cross-site Request Forgery</a></li>
                    <li><a href='<s:url action="a9_vuln_component"/>'>A9: Using Components with Known Vulnerability</a></li>
                    <li><a href='<s:url action="a10_redirect"/>'>A10: Unvalidated Redirects and Forwards</a></li>
                </ul>
            </div>
        </div>

    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
