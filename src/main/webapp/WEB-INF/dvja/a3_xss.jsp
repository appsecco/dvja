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
                <h3><strong>A3: </strong>Cross-site Scripting</h3>

                <h4>Scenario</h4>
                <jsp:include page="a3_xss/scenario.jsp"></jsp:include>

                <h4>Overview</h4>
                <jsp:include page="a3_xss/description.jsp"></jsp:include>

                <h4>Reference</h4>
                <jsp:include page="a3_xss/reference.jsp"></jsp:include>
            </div>
         </div>


    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
