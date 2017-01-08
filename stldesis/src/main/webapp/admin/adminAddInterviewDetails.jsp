<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Add Interview Details Step 1 | STL DESIS</title>
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
              <div class="title"> <h3>Add Interview Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="saveInterviewsForm" name="saveInterviewsForm" action="saveInterviews" method="POST" enctype="multipart/form-data" onsubmit="return false;">
                <div class="span6 mleft0">
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="title"/>"  placeholder="Title" class="span12"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Upload Images</h5>
                  <span class="span6 mleft0">
                  <input type="file" name="image1" id="image1"/>
                  <button type="button" class="close-image"><i class="fa fa-times"></i></button></span>
                  <span class="span6"><input type="file" name="image2" id="image2" />
                  <button type="button" class="close-image"><i class="fa fa-times"></i></button></span>
                  <span class="span6 mleft0"><input type="file" name="image3" id="image3" />
                  <button type="button" class="close-image"><i class="fa fa-times"></i></button></span>
                  <span class="span6"><input type="file" name="image4" id="image4"/>
                  <button type="button" class="close-image"><i class="fa fa-times"></i></button></span>
                 </div>           
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description" value="<s:property value="description"/>" >
                  <div id="editor">
                      <s:property value="description" escapeHtml="false"/>
                    </div>
                </div>     
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="saveInterviewsButton" name="saveInterviewsButton" >Save</button>
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