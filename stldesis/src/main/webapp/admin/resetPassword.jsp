<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Reset Password | STL DESIS</title>
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
            <form action="updatePassword" method="post" id="passwordresetform" name="passwordresetform" onsubmit="return false;">
              <div class="content">
			  	<input class="input input-block-level" placeholder="Login Name" type="email" name="loginName" id="loginName" />
			  	<input class="input input-block-level" placeholder="Security Code" type="text" name="securitycode" id="securitycode"/>
			  	<input class="input input-block-level" placeholder="Password" type="password" name="password" id="password" />
			  	<input class="input input-block-level" placeholder="Retype Password" type="password" name="retypePassword"  id="retypePassword"/>
              </div>
              <div class="actions">
                <input class="btn btn-info" type="submit" name="send" id="send" value="Login" onclick="resetPw();" >
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