<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Add Offer Details | STL DESIS</title>
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
              <div class="title"> <h3>Add Images for Offers</h3> </div>
            </div>
            <div class="widget-body">
              <form id="saveOffersForm" name="saveOffersForm" method="POST" action="saveOffers" enctype="multipart/form-data">
                <div class="span12">
                  <h5>Select Category</h5>
                  <select class=" input-block-level" id="categoryId" name="categoryId">
                    <option value="0">Select Category</option>
                    <s:iterator value="categoryList">
                    	<option value="<s:property value="categoryId"/>" ><s:property value="categoryName"/></option>
                    </s:iterator>
                  </select>
                </div>
                <div class="span6 mleft0">
                  <h5>Page URL</h5>
                  <input type="text" name="url" id="url" class="span12" placeholder="Unique URL of the page" value="<s:property value="url"/>"/>
                </div>   
                <div class="span6">
                  <h5>Link URL</h5>
                  <input type="text" name="linkUrl" id="linkUrl" class="span12" placeholder="Unique URL of the page" value="<s:property value="linkUrl"/>"/>
                </div>             
                <div class="span12 mleft0">
                  <h5>Upload Image</h5>
                   <span class="span12 mleft0">
                  <input type="file" name="image" id="image" value="<s:property value="image"/>" />
                  <button type="button" class="close-image" onclick="getElementById('image').value= null;"><i class="fa fa-times"></i></button></span>
                 </div>
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description" value="<s:property value="description"/>" >
                  <div id="editor"><s:property value="description" escapeHtml="false"/></div>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="saveOffersButton" name="saveOffersButton" >Save</button>
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