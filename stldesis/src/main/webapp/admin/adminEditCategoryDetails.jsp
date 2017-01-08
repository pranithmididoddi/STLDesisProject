<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Category Details | STL DESIS</title>
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
              <div class="title">Edit Category </div>
            </div>
            <div class="widget-body">
              <form id="updateCategoriesForm" name="updateCategoriesForm" method="post" action="updateCategories">
               <div class="span6 mleft0">
                  <h5>Category Id</h5>
                  	<input type="text" class="span12" id="categoryId" name="categoryId" value="<s:property value="category.categoryId"/>" disabled="disabled">
	        		<input type="hidden" class="span12" id="categoryId" name="categoryId" value="<s:property value="category.categoryId"/>" >
                </div>
               <div class="span6">
                  <h5>Select Category</h5>
                  <select class=" input-block-level" id="parentCategoryId" name="parentCategoryId">
                    <option value="">Select Category</option>
                    <option value="1" <s:if test="category.parentCategoryId==1">selected="selected"</s:if> >Classifieds </option>
                    <option value="2" <s:if test="category.parentCategoryId==2">selected="selected"</s:if> >Yellow Pages </option>
                    <option value="4" <s:if test="category.parentCategoryId==4">selected="selected"</s:if> >Offers </option>
                    <option value="6" <s:if test="category.parentCategoryId==6">selected="selected"</s:if> >Movies </option>
                </select>
                </div>
               <div class="span6 mleft0">
                  <h5>Sub Category</h5>
                  <input type="text" name="categoryName" id="categoryName" class="span12" value="<s:property value="category.categoryName"/>" />
                </div>
               <div class="span6">
                  <h5>Priority</h5>
                 <select class=" input-block-level" id="priority" name="priority">
                   	<option value="">Priority</option>
                    <option value="1" <s:if test="category.priority==1">selected="selected"</s:if> >1</option>
                    <option value="2" <s:if test="category.priority==2">selected="selected"</s:if> >2</option>
                    <option value="3" <s:if test="category.priority==3">selected="selected"</s:if> >3</option>
                    <option value="4" <s:if test="category.priority==4">selected="selected"</s:if> >4</option>
                    <option value="5" <s:if test="category.priority==5">selected="selected"</s:if> >5</option>
                    <option value="6" <s:if test="category.priority==6">selected="selected"</s:if> >6</option>
                    <option value="7" <s:if test="category.priority==7">selected="selected"</s:if> >7</option>
                    <option value="8" <s:if test="category.priority==8">selected="selected"</s:if> >8</option>
                    <option value="9" <s:if test="category.priority==9">selected="selected"</s:if> >9</option>
                    <option value="10" <s:if test="category.priority==10">selected="selected"</s:if> >10</option>
                  </select>
                </div>
                <div class="span12 mleft0">
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" class="span12" value="<s:property value="category.title"/>" onkeypress="return keyRestrict(event, 'char');"/>
                </div>
                <div class="span12 mleft0">
                  <h5>Keywords</h5>
                  <textarea rows="8" cols="" class="span12" id="metaKeywords" name="metaKeywords"> <s:property value="category.metaKeywords"/> </textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <textarea rows="8" cols="" class="span12" id="metaDescription" name="metaDescription"><s:property value="category.metaDescription"/></textarea>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  	<select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="category.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="category.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>
                <div class="span12 mleft0">
                  <button type="button" class="btn btn-primary" id="updateCategoriesButton" name="updateCategoriesButton" >Update</button>
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