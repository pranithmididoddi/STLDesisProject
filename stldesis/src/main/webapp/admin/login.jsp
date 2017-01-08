<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Admin Login | STL DESIS</title>
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
            <form action="loginUser" id="loginForm" name="loginForm" method="post">
              <div class="content">
			  	<input class="input input-block-level" placeholder="Username" type="text" name="loginName" id="loginName">
                <input class="input input-block-level" placeholder="Password" type="password" name="password" id="password">
                <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>forgotPassword" >Forgot Password ?</a>
              </div>
              <div class="actions">
                <input class="btn btn-info" type="submit" name="submit" value="Login" onclick="adminLogin();">
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
