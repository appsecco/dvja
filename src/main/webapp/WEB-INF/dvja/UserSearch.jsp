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
            <div class='col-md-6'>
                <h2>User Search</h2>

                <s:actionerror theme="bootstrap"/>
                <s:actionmessage theme="bootstrap"/>
                <s:fielderror theme="bootstrap"/>

                <s:form action="userSearch" method="post" theme="bootstrap">
                    <s:textfield label="Login" name="login" placeholder="Enter login to search"/>
                    <s:submit cssClass="btn btn-primary"/>
                </s:form>
            </div>
            <div class='col-md-6'>
                <h2>Search Result</h2>
                <s:if test="user">
                    <div class='alert alert-success'>
                        <strong>User found for query: </strong> <s:property value="login"/>
                    </div>
                    <table class='table'>
                        <tr>
                            <th>Id</th>
                            <td><s:property value="user.id"/></td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td><s:property value="user.name"/></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><s:property value="user.email"/></td>
                        </tr>
                    </table>
                </s:if>
                <s:else>
                    <div class='alert alert-danger'>
                        <strong>User not found for query: </strong> <s:property value="login"/>
                    </div>
                </s:else>
            </div>
        </div>
    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
