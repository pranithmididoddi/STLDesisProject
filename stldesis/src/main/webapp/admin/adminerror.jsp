<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Error | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/jquery.datetimepicker.css"/>
</head>
<body>
<header> <a href="/stldesis/adminHome" class="logo">stldesis Admin Panel</a></header>
<div class="container-fluid mtop20">
  <div class="dashboard-wrapper">
 <div class="main-container">
	  <div class="row-fluid">
        <div class="span12">
          <div class="widget-body admin-error">
            <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/admin-404-error.jpg" alt="admin-error" class="img-responsive" width="322" height="173"/>            
            <h3>Unfortunately, the page you are looking for could not found here. </h3>
            <h5>Please visit the <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminHome">Homepage.</a></h5>
            </div>
            <div class="clearfix"></div>
          </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../includes/adminFooter.jsp"%>
</body>
</html>