<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"><i class='fa fa-bug'></i> Damn Vulnerable Java Application</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class='nav navbar-nav'>

      </ul>
      <ul class='nav navbar-nav navbar-right'>
          <li>
              <a href="<s:url action="assessmentHome"/>">
                  <i class="fa fa-exchange"></i> Assessment Mode
              </a>
          </li>
          <li>
              <a href="/home.action">
                  <i class="fa fa-exchange"></i> Learning Mode
              </a>
          </li>
        <s:if test="authenticated">
            <li>
                <a href='/logout.action'>
                    <i class='fa fa-sign-out'></i> Logout
                </a>
            </li>
        </s:if>
      </ul>
    </div><!--/.navbar-collapse -->
  </div>
</nav>