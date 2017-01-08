<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Ad Details | STL DESIS</title>
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
              <div class="title"> <h3>Edit Ad details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="updateAdsForm" name="updateAdsForm" action="updateAds" method="POST" enctype="multipart/form-data" onsubmit="return false;">
                <div class="span6 mleft0">
                  <input type="hidden" name="id" id="id" class="span12" value="<s:property value="ad.id"/>" />
                  <h5>Select Category</h5>
                  <select id="categoryId" name="categoryId" onchange="adsByCategory();">
                  <option value="">Select Category</option>
                  <option value="0" <s:if test="ad.categoryId==0">selected="selected"</s:if>>Home Page</option>
                    <s:iterator value="categoryList">
                    	<s:if test="categoryId!=1 && categoryId!=2 && categoryId!=4 && categoryId!=6">
                    	<option value="<s:property value="categoryId"/>" <s:if test="ad.categoryId==categoryId">selected="selected"</s:if>><s:property value="categoryName"/></option>
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
                  <select class=" input-block-level" id="adType" name="adType">
                    <option value="">Ad Type</option>
                    <option value="1" <s:if test="ad.adType==1">selected="selected"</s:if> >Header Ad</option>
                    <option value="2" <s:if test="ad.adType==2">selected="selected"</s:if> >Top-Ad Blocks</option>
                    <option value="3" <s:if test="ad.adType==3">selected="selected"</s:if> >Page Left-Ads</option>
                    <option value="4" <s:if test="ad.adType==4">selected="selected"</s:if> >Page Right-Ads</option>
                    <option value="5" <s:if test="ad.adType==5">selected="selected"</s:if> >Home Fixed-Ads</option>
                    <option value="6" <s:if test="ad.adType==6">selected="selected"</s:if> >Home Scroll-Ads</option>
                    <option value="7" <s:if test="ad.adType==7">selected="selected"</s:if> >Home Bottom-Ads</option>
                  </select>
                </div>                                
                <div class="span6 mleft0">
                  <h5>Upload Image</h5>
                  <s:if test="ad.image!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="ad.image"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image" id="image" class="span12" value="" />
                </div>
                <div class="span6">
                  <h5>Image alt msg</h5>
                  <input type="text" name="imageAltMsg" id="imageAltMsg" value="<s:property value="ad.imageAltMsg"/>" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>
                <div class="span6">
                  <h5>Priority</h5>
                  <select class=" input-block-level" id="priority" name="priority">
                    <option>Priority</option>
                    <option value="1" <s:if test="ad.priority==1">selected="selected"</s:if> >1</option>
                    <option value="2" <s:if test="ad.priority==2">selected="selected"</s:if> >2</option>
                    <option value="3" <s:if test="ad.priority==3">selected="selected"</s:if> >3</option>
                    <option value="4" <s:if test="ad.priority==4">selected="selected"</s:if> >4</option>
                    <option value="5" <s:if test="ad.priority==5">selected="selected"</s:if> >5</option>
                    <option value="6" <s:if test="ad.priority==6">selected="selected"</s:if> >6</option>
                    <option value="7" <s:if test="ad.priority==7">selected="selected"</s:if> >7</option>
                    <option value="8" <s:if test="ad.priority==8">selected="selected"</s:if> >8</option>
                    <option value="9" <s:if test="ad.priority==9">selected="selected"</s:if> >9</option>
                    <option value="10" <s:if test="ad.priority==10">selected="selected"</s:if> >10</option>
                    <option value="11" <s:if test="ad.priority==11">selected="selected"</s:if> >11</option>
                    <option value="12" <s:if test="ad.priority==12">selected="selected"</s:if> >12</option>
                  </select>
                </div>  
                <div class="span6 mleft0">
                  <h5>Link</h5>
                  <input type="url" name="linkUrl" id="linkUrl" class="span12" value="<s:property value="ad.linkUrl"/>" />
                </div>  
                <div class="span12 mleft0">
                  <h5>Description</h5>
	        		   <textarea rows="6" cols="" class="span12" id="description" name="description"><s:property value="ad.adDescription" escapeHtml="false"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  	<select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="ad.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="ad.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="updateAdsButton" name="updateAdsButton" >Update Details</button>
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