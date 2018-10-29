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

    <h2>
        Add/Edit Product
        <span class='pull-right'>
            <a href='<s:url action="listProduct"/>' class='btn btn-primary'>List Products</a>
        </span>
    </h2>

    <s:actionerror theme="bootstrap"/>
    <s:actionmessage theme="bootstrap"/>
    <s:fielderror theme="bootstrap"/>

    <s:form action="addEditProduct" method="post" theme="bootstrap">
        <s:if test="product.id">
            <s:hidden name="product.id"/>
        </s:if>
        <s:textfield
            label="Product Name"
            name="product.name"
            placeholder="Enter product name"/>
        <s:textfield
            label="Product Code"
            name="product.code"
            placeholder="Enter product code"/>
        <s:textfield
            label="Product Tags"
            name="product.tags"
            placeholder="Enter product tags eg. Tag1,Tag2,Tag3"/>
        <s:textarea
            label="Product Description"
            name="product.description"/>

         <s:submit cssClass="btn btn-primary"/>
    </s:form>

    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
