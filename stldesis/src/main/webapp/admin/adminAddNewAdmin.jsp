<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Add New Admin Details | STL DESIS</title>
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
	  <div class="row-fluid ">
        <div class="span8 offset2">
          <div class="widget">
            <div class="widget-header">
              <div class="title"> <span class="fs1"></span>Add New Admin Details</div>
            </div>
            <div class="widget-body">
              <form id="saveAdminForm" name="saveAdminForm" method="post" action="saveAdmin">
				<div class="span6 mleft0">
                  <h5>First Name</h5>
                  <input type="text" name="firstName" id="firstName" class="span12" placeholder="Enter First Name" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span6">
                  <h5> Last Name</h5>
                  <input type="text" name="lastName" id="lastName" class="span12" placeholder="Enter Last Name" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Login Name/Email</h5>
                  <input type="email" name="emailId" id="emailId" class="span12" placeholder="Login Name / Email" onkeypress="return keyRestrict(event, 'emailchar');"/>
                </div>
                <div class="span6 mleft0">
                  <h5>Password</h5>
                  <input type="password" name="password" id="password" class="span12" placeholder="Enter Password" />
                </div>
                <div class="span6">
                  <h5>Retype Password</h5>
                  <input type="password" name="retypePassword" id="retypePassword" class="span12" placeholder="Repeat Password" />
                </div>                
                <div class="span12 mleft0">
                  <h5>Contact No</h5>
                  <input type="text" name="phone" id="phone" class="span12" placeholder="Enter Contact No" onkeypress="return keyRestrict(event, 'phone');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Address</h5>
                  <textarea rows="6" cols="" class="span12" id="address" name="address" placeholder="Enter Address"></textarea>
                </div>
                <div class="span12 mleft0">
                  <button type="button" class="btn btn-primary" id="saveAdminButton" name="saveAdminButton" >Submit</button>
                </div>
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