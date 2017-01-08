<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Forgot Password | STL DESIS</title>
<meta name="keywords" content="STL DESIS">
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
</head>
<body>
	<div class="container-fluid">
      <div class="row-fluid">
        <div class="span4 offset4">
          <div class="signin">
            <div class="signin-wrapper">
            <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/logo.png" alt="stldesis logo"></a>
            <form action="resetPassword" name="forgotpasswordform" id="forgotpasswordform" method="post" onsubmit="return false;">
              <div class="content">
			  	<input class="input input-block-level" placeholder="Email address" type="email" name="loginName" id="loginName" />
                <%@include file="captcha.jsp" %>
              </div>
              <div class="actions">
              	<input class="btn btn-info" name="send" type="submit" value="Continue" id="send"  onclick="validateCaptcha();"/>
                <div class="clearfix"></div>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
<%@include file="../includes/adminFooter.jsp"%>
</body>
</html>