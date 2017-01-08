<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>List of All Classifieds | STL DESIS</title>
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
	  <div class="row-fluid">
        <div class="span12">
          <div class="widget">
            <div class="widget-header">
              <div class="title"> <span class="fs1"></span> All Classifides Overview </div>
            </div>
            <h3>All classifieds Records</h3>
            <div class="widget-body">
              <form id="classifiedSearchForm" name="classifiedSearchForm" action="#" method="post" class="search-form">
                <div class="span1">
                  <input type="text" class="input-block-level" placeholder=" ID" id="id" name="id" />
                </div>
                <div class="span2">
                  <select class=" input-block-level" id="categoryId" name="categoryId">
                    <option value="">Select Sub Category</option>
                    <s:iterator value="categoryList">
                    	<option value="<s:property value="categoryId"/>"><s:property value="categoryName"/></option>
                    </s:iterator>
                  </select>
                </div>
                <div class="span2">
                  <select class=" input-block-level" id="status" name="status">
                    <option value="">All classifieds</option>
                    <option value="1">Active classifieds</option>
                    <option value="2">Pending classifieds</option>
                  </select>
                </div>
                <div class="span2">
                  <input type="text" class="input-block-level" placeholder="Email Id" id="emailId" name="emailId" />
                </div>
                <div class="span2">
                	 <input type="text" id="dateFrom" name="dateFrom" class="input input-wide span12 date-picker" placeholder="From date" />
                </div>
                <div class="span2">
                	 <input type="text" id="dateTo" name="dateTo" class="input input-wide span12 date-picker" placeholder="To date" />
                </div>
                <div class="span1">
                  <button type="button" class="btn btn-success" id="classifiedSearchButton" name="classifiedSearchButton" onclick="pagingSTL('sClassifieds', '1');">Search</button>
                </div>
              </form>
              <h3 class="green-hdng">List of All classifieds in All Categories</h3>
              
             <div class="table-responsive" id="table">
                <table class="table table-condensed table-bordered no-margin admin-list-table">
                  <thead>
                    <tr>
                      <th>classified ID</th>
                      <th>classified Title</th>
                      <th>Category</th>
                      <th>Member Details</th>
                      <th>Posted Date</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  <s:iterator value="classifiedsList" var="classifieds">
                  	<tr>
                      <td><s:property value="id"/> </td>
                      <td><s:property value="title"/></td>
                      <td><s:iterator value="categoryList" var="category"><s:if test="#category.categoryId==#classifieds.categoryId"><s:property value="#category.categoryName"/></s:if></s:iterator></td>
                      <td><s:property value="name"/>, <s:property value="emailId"/>, <s:property value="phone"/>, <s:property value="address"/></td>
                      <td><s:date name="postedDate" format="MMM dd, yyyy" /></td>
                      <td><s:if test="status==1">Published</s:if><s:elseif test="status==0">INACTIVE</s:elseif><s:elseif test="status==2">PENDING</s:elseif></td>
                      <td>
	                      <span data-toggle="modal" data-target="#view"><a href="#" onclick="javascript:callAjx('vClassifieds',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" title="View"><i class="fa fa-eye"></i></a></span> 
	                      <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminEditClassifiedsPage?id=<s:property value="id" />" data-toggle="tooltip" data-placement="top" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
	                      <s:if test="status==2"><span data-toggle="modal" data-target="#active"><a href="#" onclick="javascript:callAjx('vClassifiedsActive',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" data-original-title="Publish"><i class="fa fa-check"></i></a></span></s:if>
	                      <s:if test="status==1"><span data-toggle="modal" data-target="#inactive"> <a href="#" onclick="javascript:callAjx('vClassifiedsInActive',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" data-original-title="Pending"><i class="fa fa-times"></i></a></span></s:if>
	                      <span data-toggle="modal" data-target="#delete" ><a href="#" onclick="javascript:aDelete('dClassifieds',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></a></span>
                      </td>
                    </tr>
                  </s:iterator>
                  </tbody>
                </table>
              <div class="row-fluid ptop30" align="center">
                <div class="span12">
                <s:if test="pageNo==1" ><a class="inactive" href="#"> « Previous </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo-1)" />)"> « Previous </a></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo-4)"/>)"><s:property value="(pageNo-4)" /></a></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo-3)"/>)"><s:property value="(pageNo-3)" /></a></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo-2)" />)"><s:property value="(pageNo-2)" /></a></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo-1)" />)"><s:property value="(pageNo-1)" /></a></s:if>
				<a class="current1" href="#"><s:property value="pageNo" /></a>
				<s:if test="(pageNo+1)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo+1)" />)"><s:property value="(pageNo+1)" /></a></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo+2)" />)"><s:property value="(pageNo+2)" /></a></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo+3)" />)"><s:property value="(pageNo+3)" /></a></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo+4)" />)"><s:property value="(pageNo+4)" /></a></s:if>
				<s:if test="noOfPages<=pageNo" ><a class="inactive" href="#"> Next » </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sClassifieds',<s:property value="(pageNo+1)" />)"> Next » </a></s:else>
				</div>
              </div>
              </div>
           </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="view" class="modal fade"></div>
<div id="active" class="modal fade"></div>
<div id="inactive" class="modal fade"></div>
<div id="delete" class="modal fade"></div>
<%@include file="../includes/adminFooter.jsp"%>
<script>$(document).ready(function(){ $('[data-toggle="tooltip"]').tooltip(); });</script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/jquery.datetimepicker.full.js"></script>
<script>$('.date-picker').datetimepicker({ timepicker:false, format:'d/m/Y', formatDate:'d/m/Y' });
</script>
</body>
</html>