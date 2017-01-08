<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Add New Ad Details | STL DESIS</title>
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
              <div class="title"> <h3>New Ad details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="saveAdsForm" name="saveAdsForm" method="POST" enctype="multipart/form-data" action="saveAds" onsubmit="return false;">
                <div class="span6 mleft0">
                  <h5>Select Category</h5>
                  <select id="categoryId" name="categoryId" onchange="adsByCategory();">
                  <option value="">Select Category</option>
                  <option value="0">Home Page</option>
                  	<s:iterator value="categoryList">
                    	<s:if test="categoryId!=1 && categoryId!=2 && categoryId!=4 && categoryId!=6">
                    	<option value="<s:property value="categoryId"/>"><s:property value="categoryName"/></option>
                    	</s:if>
                    </s:iterator>
                  </select>
                </div>
                <script type="text/javascript">
	                function adsByCategory(){
	                $(document).ready(function(){
	            	    if($('#categoryId').val()=='0'){
	            	    	$('#adType').html('<option value="0">Ad Type</option><option value="1">Header Ad</option><option value="2">Top-Ad Blocks</option><option value="3">Page Left-Ads</option><option value="4">Page Right-Ads</option><option value="5">Home Fixed-Ads</option> <option value="6">Home Scroll-Ads</option> <option value="7">Home Bottom-Ads</option>');
	            	    }else{ $('#adType').html('<option value="0">Ad Type</option><option value="3">Page Left-Ads</option><option value="4">Page Right-Ads</option>'); }});
	                }
                </script>   
                
                <div class="span6">
                  <h5>Ad Type</h5>
                  <select class="input-block-level" id="adType" name="adType">
                    <option value="0">Ad Type</option>
                    <option value="1">Header Ad</option>
                    <option value="2">Top-Ad Blocks</option>
                    <option value="3">Page Left-Ads</option>
                    <option value="4">Page Right-Ads</option>
                    <option value="5">Home Fixed-Ads</option>
                    <option value="6">Home Scroll-Ads</option>
                    <option value="7">Home Bottom-Ads</option>
                  </select>
                </div>                    
                <div class="span6 mleft0">
                  <h5>Upload Image</h5>
                  <input type="file" name="image" id="image" class="span12" placeholder="Ad Image" value="<s:property value="image"/>" />
                </div>
                <div class="span6">
                  <h5>Image alt msg</h5>
                  <input type="text" name="imageAltMsg" id="imageAltMsg" placeholder="Alt Message" class="span12" value="<s:property value="imageAltMsg"/>" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>
                <div class="span6 mleft0">
                  <h5>Priority</h5>
                  <select class="input-block-level" id="priority" name="priority">
                    <option value="">Priority</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>
                </div>  
                <div class="span6">
                  <h5>Link</h5>
                  <input type="url" name="linkUrl" id="linkUrl" class="span12" placeholder="link" value="<s:property value="linkUrl"/>" />
                </div>  
                <div class="span12 mleft0">
                  <h5>Ad Description</h5>
                  <textarea rows="6" cols="" class="span12" id="description" name="description" placeholder="description"></textarea>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="saveAdsButton" name="saveAdsButton" >Save Details</button>
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