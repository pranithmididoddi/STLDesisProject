<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Update Event Details | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor.js"></script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor/sample.js"></script>
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
              <div class="title"> <h3>Edit Event Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="updateEventsForm" name="updateEventsForm" method="post" action="updateEvents">
                <div class="span6 mleft0">
                	<input type="hidden" name="id" id="id" value="<s:property value="event.id"/>" />
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="event.title"/>" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>
                <div class="span6">
                  <h5>Page URL</h5>
                  <input type="text" name="url" id="url" class="span12" value="<s:property value="event.url"/>" />
                </div>
                <div class="span6 mleft0">
                  <h5>Contact Person</h5>
                  <input type="text" name="name" id="name" value="<s:property value="event.name"/>" class="span12" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span6">
                  <h5>Email</h5>
                  <input type="email" name="emailId" id="emailId" class="span12" value="<s:property value="event.emailId"/>" onkeypress="return keyRestrict(event, 'emailchar');"/>
                </div>  
                <div class="span6 mleft0">
                  <h5>Phone</h5>
                  <input type="tel" name="phone" id="phone" value="<s:property value="event.phone"/>" class="span12" onkeypress="return keyRestrict(event, 'phone');"/>
                </div>
                <div class="clear"></div> 
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description">
                  <div id="editor">
                      <s:property value="event.description" escapeHtml="false"/>
                    </div>
                </div>
                <div class="span6 mleft0">
                  <h5>Event Starts on</h5>
                    <input type="text" id="dateFrom" name="dateFrom" class="input input-wide span12 datetime-picker" value="<s:date name="event.fromTime" format="MM-dd-yyyy HH:mm"/>" />
                </div>
                <div class="span6">
                  <h5>Event Ends on</h5>
                    <input type="text" id="dateTo" name="dateTo" class="input input-wide span12 datetime-picker" value="<s:date name="event.toTime" format="MM-dd-yyyy HH:mm"/>" />
                </div> 
                <div class="span12 mleft0">
                  <h5>Address</h5>
                  <textarea rows="6" cols="" class="span12" id="address" name="address" ><s:property value="event.address"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  	<select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="event.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="event.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="updateEventsButton" name="updateEventsButton" >Update Details</button>
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
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/jquery.datetimepicker.full.js"></script>
<script>$('.datetime-picker').datetimepicker({format : 'm-d-Y H:i'});</script>
<script>initSample();</script>
</body>
</html>