<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Offer Details Step 1 | STL DESIS</title>
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
              <div class="title"> <h3>Edit Offer Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="updateOffersForm" name="updateOffersForm" method="POST" action="updateOffers" enctype="multipart/form-data" onsubmit="return false;">
                <div class="span12">
                  <h5>Select Category</h5>
                  <input type="hidden" id="id" name="id" value="<s:property value="offers.id"/>">
                  <select class=" input-block-level" id="categoryId" name="categoryId">
                    <option value="0">Select Category</option>
                    <s:iterator value="categoryList">
                    	<option value="<s:property value="categoryId"/>" <s:if test="offers.categoryId==categoryId">selected="selected"</s:if>><s:property value="categoryName"/></option>
                    </s:iterator>
                  </select>
                </div>
                <div class="span6 mleft0">
                  <h5>Page URL</h5>
                  <input type="text" name="url" id="url" class="span12" value="<s:property value="offers.url"/>" />
                </div>                
                <div class="span6">
                  <h5>Link URL</h5>
                  <input type="text" name="linkUrl" id="linkUrl" class="span12" value="<s:property value="offers.linkUrl"/>" />
                </div> 
                 <div class="span6 mleft0">
                  <h5>Image </h5>
                  <s:if test="offers.image!=null"><img id="reset" src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="offers.image"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image" id="image" class="span12" value="" /> </div>
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description" value="<s:property value="offers.description"/>" >
                  	<div id="editor">
                        <s:property value="offers.description" escapeHtml="false"/>
                    </div>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  	<select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="offers.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="offers.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="updateOffersButton" name="updateOffersButton" >Update Details</button>
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