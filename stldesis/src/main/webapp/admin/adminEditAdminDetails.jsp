<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Edit Admin Details | STL DESIS</title>
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
	  <div class="row-fluid ">
        <div class="span8 offset2">
          <div class="widget">
            <div class="widget-header">
              <div class="title"> Edit Admin Details</div>
            </div>
            <div class="widget-body">
              <form id="updateAdminForm" name="updateAdminForm" method="post" action="updateAdmin">
              	<input type="hidden" id="userId" name="userId" value="<s:property value="tuser.userId"/>" />
				<div class="span6 mleft0">
                  <h5>First Name</h5>
                  <input type="text" name="firstName" id="firstName" value="<s:property value="tuser.firstName"/>" class="span12" placeholder="Enter First Name" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span6">
                  <h5> Last Name</h5>
                  <input type="text" name="lastName" id="lastName" value="<s:property value="tuser.lastName"/>" class="span12" placeholder="Enter Last Name" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Login Name/Email</h5>
                  <input type="email" name="emailId" id="emailId" value="<s:property value="tuser.loginName"/>" class="span12" placeholder="Login Name / Email" onkeypress="return keyRestrict(event, 'emailchar');"/>
                </div>
                <div class="span6 mleft0">
                  <h5>Password</h5>
                  <input type="password" name="password" id="password" value="<s:property value="tuser.password"/>" class="span12" placeholder="Enter Password" />
                </div>
                <div class="span6">
                  <h5>Retype Password</h5>
                  <input type="password" name="retypePassword" id="retypePassword" value="" class="span12" placeholder="Repeat Password" />
                </div>                
                <div class="span12 mleft0">
                  <h5>Contact No</h5>
                  <input type="text" name="phone" id="phone" value="<s:property value="tuser.contactNo"/>" class="span12" placeholder="Enter Contact No" onkeypress="return keyRestrict(event, 'phone');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Address</h5>
                  <textarea rows="6" cols="" class="span12" id="address" name="address" ><s:property value="tuser.address"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  <select class="input-block-level" id="status" name="status">
	         	     	<option value="1" <s:if test="tuser.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="tuser.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>  
                </div>
                <div class="span12 mleft0">
                  <button type="button" class="btn btn-primary" id="updateAdminButton" name="updateAdminButton" >Update Details</button>
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