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
            <div class='col-md-12'>
                <div class='page-header'>
                    <h2>Test System Connectivity</h2>
                </div>

                <div class='page-body'>
                    <s:form action="ping" method="post" theme="bootstrap">
                        <s:textfield
                            label="Address"
                            name="address"
                            placeholder="Enter public IP address"/>

                         <s:submit cssClass="btn btn-primary"/>
                    </s:form>
                </div>
            </div>
         </div>


            <div class='row'>
                <div class='col-md-12'>
                    <h2>Command Output</h2>
                    <hr/>
                    <pre><s:property value="commandOutput" /></pre>
                </div>
            </div>


    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
