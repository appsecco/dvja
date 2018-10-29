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
        <div class="col-md-3">
            <div class='list-group'>
                <a href="#" class="list-group-item">
                    <i class="fa fa-angle-double-right"></i> User Management
                </a>
                <a href="<s:url action="listProduct"/>" class="list-group-item">
                    <i class="fa fa-angle-double-right"></i> Product Management
                </a>
                <a href="#" class="list-group-item">
                    <i class="fa fa-angle-double-right"></i> Order Management
                </a>
            </div>
        </div>

        <div class="col-md-9">

        </div>
    </div>

</div></div></div>
<jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
