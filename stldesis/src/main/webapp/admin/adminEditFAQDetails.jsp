<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit FAQ Details | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor.js"></script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor/sample.js"></script>
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
              <div class="title"> <h3>Edit FAQ Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="updateFAQForm" name="updateFAQForm" method="post" action="updateFAQs">
              	<input type="hidden" name="id" id="id" value="<s:property value="faq.id"/>" class="span12" />
                <div class="span6 mleft0">
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="faq.title"/>" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div> 
               <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description" value="<s:property value="faq.description"/>" >
                  <div id="editor">
                        <s:property value="faq.description" escapeHtml="false"/>
                    </div>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  	<select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="faq.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="faq.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>  
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="updateFAQButton" name="updateFAQButton" >Update Details</button>
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
<script>initSample();</script>
</body>
</html>