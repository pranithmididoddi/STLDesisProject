<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Add New Category Details | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
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
              <div class="title"> <span class="fs1"></span>Add New Category </div>
            </div>
            <div class="widget-body">
              <form id="saveCategoriesForm" name="saveCategoriesForm" method="post" action="saveCategories">
               <div class="span12 mleft0">
                  <h5>Select Category</h5>
                  <select class=" input-block-level" id="parentCategoryId" name="parentCategoryId">
                    <option value="">Select Category</option>
                    <option value="1">Classifieds </option>
                    <option value="2">Yellow Pages </option>
                    <option value="4">Offers </option>
                    <option value="6">Movies </option>
                </select>
                </div>
               <div class="span6 mleft0">
                  <h5>Sub Category</h5>
                  <input type="text" name="categoryName" id="categoryName" value="<s:property value="categoryName"/>" class="span12" placeholder="Sub Category Name" />
                </div>
               <div class="span6">
                  <h5>Priority</h5>
                  <select class=" input-block-level" id="priority" name="priority">
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
                  </select>
                </div>
                <div class="span12 mleft0">
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="title"/>" class="span12" placeholder="Add Title" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Keywords</h5>
                  <textarea rows="8" cols="" class="span12" id="metaKeywords" name="metaKeywords"  placeholder="Add Meta Keywords"><s:property value="metaKeywords"/></textarea>
                </div>
                 <div class="span12 mleft0">
                  <h5>Description</h5>
                  <textarea rows="8" cols="" class="span12" id="metaDescription" name="metaDescription" placeholder="Add Meta Description"><s:property value="metaDescription"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <button type="button" class="btn btn-primary" id="saveCategoriesButton" name="saveCategoriesButton" >Save</button>
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