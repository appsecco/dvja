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
            <i class='fa fa-list'></i> Available Products
            <span class='pull-right'>
                <a href='#' class='btn btn-primary' data-toggle="modal" data-target="#searchModal">Search Product</a>
                <a href='<s:url action="addEditProduct"/>' class='btn btn-primary'>Add Product</a>
            </span>
        </h2>

        <s:if test="searchQuery != null">
            <p class="bg-success">
                Listing products with <strong>search query: </strong> <%= request.getParameter("searchQuery") %>
                &nbsp; &nbsp;
                <small><a href="<s:url action="listProduct"/>">
                    <i class="fa fa-remove"></i> Clear
                </a></small>
            </p>
        </s:if>

        <table class='table'>
            <tr>
                <th>#</th>
                <th width='50%'>Name</th>
                <th>Code</th>
                <th>Tags</th>
                <th></th>
            </tr>
            <s:iterator value="products">
            <tr>
                <td><s:property value="id"/></td>
                <td><s:property value="name" escape="false"/></td>
                <td><s:property value="code"/></td>
                <td><s:property value="tags"/></td>
                <td>
                    <a href='<s:url action="addEditProduct"><s:param name="productId"><s:property value="id"/></s:param></s:url>'>Edit</a>
                </td>
            </tr>
            </s:iterator>
        </table>

        <div class="modal fade" tabindex="-1" role="dialog" id="searchModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Search Product</h4>
                    </div>
                    <div class="modal-body">
                        <s:form action="listProduct" method="post" theme="bootstrap">
                            <s:textfield
                                    label="Query"
                                    name="searchQuery"
                                    placeholder="Search by name"/>
                            <s:submit cssClass="btn btn-primary"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>

        </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
