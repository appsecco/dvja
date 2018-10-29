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
        <div class='col-md-6 col-md-offset-3'>
            <h2>Edit User (#<s:property value="user.id"/>)</h2>

            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>

            <s:form action="editUser" method="post" theme="bootstrap">
                <s:hidden name="userId" />
                <s:textfield
                    label="Email"
                    name="email"
                    placeholder="Enter your email"/>
                <s:password
                        label="Password"
                        name="password"
                        placeholder="Enter password"/>
                <s:password
                        label="Password Confirmation"
                        name="passwordConfirmation"
                        placeholder="Enter password confirmation"/>
                <s:submit cssClass="btn btn-primary"/>
            </s:form>
        </div>
    </div>

</div></div></div>
<jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
