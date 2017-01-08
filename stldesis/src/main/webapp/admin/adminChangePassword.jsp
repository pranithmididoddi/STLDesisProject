<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Change Password | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
</head>
<body>
<%@include file="../includes/adminHeader.jsp"%>
<div class="container-fluid">
  <div class="dashboard-wrapper">
  <%@include file="../includes/adminNavigation.jsp"%>
	<div class="main-container">
	  <div class="row-fluid">
        <div class="alert-block alert-info fade in">
          <button data-dismiss="alert" class="close" type="button"> <i class="fa fa-times-circle"></i> </button>
          <p> Please enter your Current and new password in the appropriate fields and hit Update button to change Password. </p>
        </div>
        <div class="span5 offset3 ">
          <div class="widget">
            <div class="widget-header">
              <div class="title"> Change Password</div>
            </div>
            <div class="widget-body">
              <form class="form-horizontal no-margin" method="post" action="updateChanegedPassword" id="changePasswordForm" name="changePasswordForm" onsubmit="return false;">
                <div class="control-group success">
                  <label class="control-label"> Current Password </label>
                  <div class="controls">
                    <input type="password" class="input input-block-level" name="currentPassword" id="currentPassword"  placeholder="Enter Current Password" />
                  </div>
                </div>
                <div class="control-group success">
                  <label class="control-label"> New Password </label>
                  <div class="controls">
                    <input type="password" class="input input-block-level"  name="password" id="password" placeholder="Enter New Password" />
                  </div>
                </div>
                <div class="control-group success">
                  <label class="control-label">Retype New Password </label>
                  <div class="controls">
                    <input type="password" class="input input-block-level"  name="retypeNewPassword" id="retypeNewPassword" placeholder="Retype New Password" />
                  </div>
                </div>
                <hr>
                <button type="button" class="btn btn-primary  pull-right" value="" id="changePasswordButton" name="changePasswordButton" onclick="changePasswd();">Update</button>
              </form>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../includes/adminFooter.jsp"%>
</body>
</html>