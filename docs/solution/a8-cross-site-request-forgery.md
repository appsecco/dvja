# Cross-site Request Forgery

## Add / Edit product

The application is vulnerable to a Cross-site in _Add or Edit Product_ feature. The application fails to implement anti-CSRF token to prevent forced browsing.

```
http://dvja:8080/addEditProduct.action
```

This issue can be exploited by an attacker to force an unintended action in the web application by hosting a page with automated form submission and enticing an user of the application to visit the page while logged in to the vulnerable application.

### Solution

TODO

Struts2 TokenSessionInterceptor

[https://stackoverflow.com/questions/22802225/how-to-implement-csr-forgery-prevention-code-on-struts2](https://stackoverflow.com/questions/22802225/how-to-implement-csr-forgery-prevention-code-on-struts2)

