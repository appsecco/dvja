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
            <div class='alert alert-success'>
                <strong>Success: </strong> Password reset request registered successfully.
            </div>

            <br/>
            <a href='<s:url action="login"/>' class='btn btn-primary'>Login</a>
        </div>
    </div>


</div></div></div>
<jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
