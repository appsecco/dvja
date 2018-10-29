# Cross-site Scripting

## Reflected XSS in Search Query

A Cross-site scripting vulnerability exists in the following URL:

```
http://dvja:8080/listProduct.action
```

The issue lies in the following vulnerable code in _ProductList.jsp_

```java
<p class="bg-success">
Listing products with <strong>search query: </strong> <%= request.getParameter("searchQuery") %>
[...]               
</p>
```

User supplied input is directly rendered as part of HTML response. This issue can be exploited to inject arbitrary scripting code to perform a Cross-site Scripting attack.

### Solution

Ensure user supplied or any other untrutsted data is not rendered as part of HTTP response without appropriate encoding. Struts2 taglib can be used to render an action parameter in JSP securely with appropriate encoding such as below:

```java
<s:property value="searchQuery"/>
```

## Stored XSS in Product Listing

Another XSS vulnerability exists in the same URL, however at a different code location in _ProductList.jsp_

```java
<tr>
   <td><s:property value="id"/></td>
   <td><s:property value="name" escape="false"/></td>
[..]
</tr>
```

The issue lies in insecure use of Struts2 taglib where output encoding is explicitly turned off. While this may be required in some cases, untrusted user supplied data should never be rendered without output encoding.

### Solution

Limit raw rendering to internal trusted data only. Do not disable output encoding for untrusted data coming from external sources.



