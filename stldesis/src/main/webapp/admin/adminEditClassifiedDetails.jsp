<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Edit Classifieds | STL DESIS</title>
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
              <div class="title">Classified / Edit Classified </div>
            </div>
            <h3><s:property value="classifieds.title"/></h3>
            <div class="widget-body">
              <form id="updateClassifiedsForm" name="updateClassifiedsForm" method="POST" action="adminUpdateClassifieds" enctype="multipart/form-data" onsubmit="return false;">
                <input type="hidden" name="id" id="id" class="span12" value="<s:property value="classifieds.id"/>"/>
                <div class="span6 mleft0">
                  <h5>Classified Title</h5>
                  <input type="text" name="title" id="title" class="span12" value="<s:property value="classifieds.title"/>" onkeypress="return keyRestrict(event, 'vchar');"/>
                </div>
                <div class="span6">
                  <h5>Select Category</h5>
                  <select class=" input-block-level" id="categoryId" name="categoryId">
                    <option value="">Select Category</option>
                    <s:iterator value="categoryList">
                    	<option value="<s:property value="categoryId" />" <s:if test="classifieds.categoryId==categoryId">selected="selected"</s:if>><s:property value="categoryName"/></option>
                    </s:iterator>
                  </select>
                </div>
                <div class="span3 mleft0">
                  <h5>Classified Image 1</h5>
                  <s:if test="classifieds.image1!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image1"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image1" id="image1" class="span12" value="" /> </div>
                <div class="span3">
                  <h5>Classified Image 2</h5>
                  <s:if test="classifieds.image2!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image2"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image2" id="image2" class="span12" value="" /> </div>
                <div class="span3">
                  <h5>Classified Image 3</h5>
                  <s:if test="classifieds.image3!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image3"/>" class="user-uploaded-image-edit"></s:if> 
                  <input type="file" name="image3" id="image3" class="span12" value="" /></div>
                <div class="span3">
                  <h5>Classified Image 4</h5>
                  <s:if test="classifieds.image4!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image4"/>" class="user-uploaded-image-edit" ></s:if> 
                  <input type="file" name="image4" id="image4" class="span12" value="" /></div>
                <div class="span12 mleft0">
                  <h5>Description</h5>
	        		<input type="hidden" id="description" name="description" value="<s:property value="classifieds.description"/>" >
                  <div id="editor">
                    <s:property value="classifieds.description" escapeHtml="false"/>
                  </div>
                </div>
                <div class="span6 mleft0">
                  <h5>Price</h5>
                  <input type="text" name="price" id="price" class="span12" value="<s:property value="classifieds.price"/>" />
                </div>
                <div class="span6">
                  <h5> Name</h5>
                  <input type="text" name="name" id="name" class="span12" value="<s:property value="classifieds.name"/>" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>
                <div class="span6 mleft0">
                  <h5>Phone No</h5>
                  <input type="text" name="phone" id="phone" class="span12" value="<s:property value="classifieds.phone"/>" onkeypress="return keyRestrict(event, 'phone');"/>
                </div>
                <div class="span6">
                  <h5>Email Id</h5>
                  <input type="text" name="emailId" id="emailId" class="span12" value="<s:property value="classifieds.emailId"/>" onkeypress="return keyRestrict(event, 'emailchar');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Address</h5>
                  <textarea rows="6" cols="" class="span12" id="address" name="address"><s:property value="classifieds.address"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  <select class="input-block-level" id="status" name="status">
	         	    <option value="1" <s:if test="classifieds.status==1">selected="selected"</s:if> >ACTIVE</option>
	         	    <option value="2" <s:if test="classifieds.status==2">selected="selected"</s:if> >PENDING</option>
			        <option value="0" <s:if test="classifieds.status==0">selected="selected"</s:if> >In Active</option>
	             </select>
                </div>
                <div class="span12 mleft0">
                  <button type="button" class="btn btn-primary" id="updateClassifiedsButton" name="updateClassifiedsButton" >Update</button>
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