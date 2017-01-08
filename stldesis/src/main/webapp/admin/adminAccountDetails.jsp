<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Account Details | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/jquery.datetimepicker.css"/>
</head>
<body>
<%@include file="../includes/adminHeader.jsp"%>
<div class="container-fluid">
  <div class="dashboard-wrapper">
  <%@include file="../includes/adminNavigation.jsp"%>
	<div class="main-container">
	  <div class="row-fluid">
        <div class="span6 offset3">
          <div class="widget">
            <div class="widget-body">
              <div class="page-header">
                <div class="pull-left">
                  <h2>Admin Details</h2>
                </div>                
                <div class="clearfix"></div>
              </div>
			  <div>
				<h5><span>Login Name / Email : </span> <s:property value="user.loginName"/></h5>
				<h5><span>First Name : </span> <s:property value="user.firstName"/></h5>
				<h5><span>Last Name : </span> <s:property value="user.lastName"/></h5>
				<h5><span>Contact Number : </span> <s:property value="user.contactNo"/></h5>
				<h5><span>Address : </span> <s:property value="user.address"/></h5>
			  </div>              
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