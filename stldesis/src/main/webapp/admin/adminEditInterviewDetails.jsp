<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Interview Details Step 1 | STL DESIS</title>
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
              <div class="title"> <h3>Edit Interview Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="updateInterviewsForm" name="updateInterviewsForm" action="updateInterviews" method="POST" enctype="multipart/form-data" onsubmit="return false;">
                <div class="span6 mleft0">
                  <input type="hidden" name="id" id="id" value="<s:property value="interviews.id"/>" class="span12" />
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="interviews.title"/>" placeholder="Add Person Name" class="span12" />
                </div>
                <div class="span6">
                  <h5>Page URL</h5>
                  <input type="text" name="url" id="url" class="span12" value="<s:property value="interviews.url"/>" placeholder="Unique URL of the page" />
                </div>                
                <div class="span3 mleft0">
                  <h5>Image 1  </h5>
                  <s:if test="interviews.image1!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image1"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image1" id="image1" class="span12" value="" /> 
                  </div>
                <div class="span3">
                  <h5>Image 2 </h5>
                  <s:if test="interviews.image2!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image2"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image2" id="image2" class="span12" value="" /> </div>
                <div class="span3">
                  <h5>Image 3 </h5>
                  <s:if test="interviews.image3!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image3"/>" class="user-uploaded-image-edit"></s:if> 
                  <input type="file" name="image3" id="image2" class="span12" value="" /></div>
                <div class="span3">
                  <h5>Image 4 </h5>
                  <s:if test="interviews.image4!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image4"/>" class="user-uploaded-image-edit" ></s:if> 
                  <input type="file" name="image4" id="image4" class="span12" value="" /></div>         
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description" value="<s:property value="interviews.description"/>" >
                  <div id="editor">
                        <s:property value="interviews.description" escapeHtml="false"/>
                    </div>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  	<select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="interviews.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="interviews.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>     
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="updateInterviewsButton" name="updateInterviewsButton" >Update Details</button>
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