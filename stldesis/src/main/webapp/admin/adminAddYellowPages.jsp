<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Add Yellow Pages Details | STL DESIS</title>
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
              <div class="title"> <h3>Add Yellow Page Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="saveYellowPageForm" name="saveYellowPageForm" method="post" action="adminSaveYellowPages">
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
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="title"/>" placeholder="Add Title" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>
                <div class="span6">
                  <h5>Contact Person</h5>
                  <input type="text" name="contactPerson" id="contactPerson" value="<s:property value="contactPerson"/>" placeholder="Contact Person" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>
                <div class="span6 mleft0">
                  <h5>Email</h5>
                  <input type="email" name="emailId" id="emailId" value="<s:property value="emailId"/>" class="span12" placeholder="Email" onkeypress="return keyRestrict(event, 'emailchar');"/>
                </div>  
                <div class="span6">
                  <h5>Phone</h5>
                  <input type="tel" name="phone" id="phone" value="<s:property value="phone"/>" placeholder="Phone" class="span12" onkeypress="return keyRestrict(event, 'phone');"/>
                </div>
                <div class="span6 mleft0">
                  <h5>Website</h5>
                  <input type="url" name="website" id="website" value="<s:property value="website"/>" class="span12" placeholder="Website URL with http Extension" />
                </div>  
                <div class="span12 mleft0">
                  <h5>Address</h5>
                  <textarea rows="6" cols="" class="span12" id="address" name="address" placeholder="Address"><s:property value="address"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Description</h5>
	        		<input type="hidden" id="description" name="description" value="<s:property value="description"/>" >
                  	<div id="editor">
                        <s:property value="description" escapeHtml="false"/>
                    </div>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="saveYellowPageButton" name="saveYellowPageButton" >Add Details</button>
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