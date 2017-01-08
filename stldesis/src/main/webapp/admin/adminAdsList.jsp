<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>List of Ads | STL DESIS</title>
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
              <div class="title"> <i class="fa fa-user"></i> Ads Overview </div>
            </div>
            <h3>Filter Ads Records</h3>
            <div class="widget-body">
              <form id="adminAdsSearchForm" name="adminAdsSearchForm" action="#" method="post" class="search-form">
                <div class="span1">
                  <input type="text" class="input-block-level" placeholder="ID" id="id" name="id">
                </div>
                 <div class="span2">
                  <select class=" input-block-level" id="categoryId" name="categoryId">
                    <option value="">Select Category</option>
                    <option value="0">Home Page</option>
                    <s:iterator value="categoryList">
                    	<s:if test="categoryId!=1 && categoryId!=2 && categoryId!=4 && categoryId!=6">
                    	<option value="<s:property value="categoryId"/>"><s:property value="categoryName"/></option>
                    	</s:if>
                    </s:iterator>
                  </select>
                </div>
                <div class="span2">
                  <select class=" input-block-level" id="adType" name="adType">
                    <option value="">Ad Type</option>
                    <option value="1">Header Ad</option>
                    <option value="2">Top-Ad Blocks</option>
                    <option value="3">Page Left-Ads</option>
                    <option value="4">Page Right-Ads</option>
                    <option value="5">Home Fixed-Ads</option>
                    <option value="6">Home Scroll-Ads</option>
                    <option value="7">Home Bottom-Ads</option>
                  </select>
                </div>
                <div class="span2">
                	 <input type="text" id="dateFrom" name="dateFrom" class="input input-wide span12 date-picker" placeholder="From date" />
                </div>
                <div class="span2">
                	 <input type="text" id="dateTo" name="dateTo" class="input input-wide span12 date-picker" placeholder="To date" />
                </div>
                <div class="span2">
                	 <select class=" input-block-level" id="status" name="status">
                        <option value="">Status</option>
                        <option value="1">Active</option>
                        <option value="0">In-active</option>
                      </select>
                </div>
                <div class="span1">
                  <button type="button" class="btn btn-success" id="adminAdsSearchButton" name="adminAdsSearchButton" onclick="pagingSTL('sAdminAds', '1');">Search</button>
                </div>
              </form>
              <div class="page-header">
                <div class="pull-left">
                  <h2>List of Ads</h2>
                </div>
                <div class="pull-right"> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAddAds" class="btn btn-danger">New Ad</a> </div>
                <div class="clearfix"></div>
              </div>
              <div class="table-responsive" id="table">
                <table class="table table-condensed table-bordered no-margin admin-list-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Category</th>
                      <th>Ad Type</th>
                      <th>Priority</th>
                      <th>Posted on</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  <s:iterator value="adList" var="ad">
                    <tr>
                      <td><s:property value="id"/></td>
                      <td><s:iterator value="categoryList" var="category"><s:if test="#category.categoryId==#ad.categoryId"><s:property value="#category.categoryName"/></s:if></s:iterator><s:if test="categoryId==0">Home Page</s:if></td>
                      <td><s:if test="adType==1">Header Ad</s:if><s:elseif test="adType==2">Top-Ad Blocks</s:elseif><s:elseif test="adType==3">Page Left-Ads</s:elseif>
                     		<s:elseif test="adType==4">Page Right-Ads</s:elseif><s:elseif test="adType==5">Home Fixed-Ad</s:elseif><s:elseif test="adType==6">Home Scroll-Ads</s:elseif>
                     		<s:elseif test="adType==7">Home Bottom-Ads</s:elseif>
                      </td>
                      <td><s:property value="priority"/></td>
                      <td><s:date name="lastUpdatedTime" format="MMM dd, yyyy"/></td>
                      <td><s:if test="status==1">Active</s:if><s:else>In Active</s:else></td>
                      <td>
                      <span data-toggle="modal" data-target="#view"><a href="#" onclick="javascript:callAjx('vAd',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" title="View"><i class="fa fa-eye" ></i></a></span> 
                      <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminEditAds?id=<s:property value="id" />" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a> 
                      <span data-toggle="modal" data-target="#delete"><a href="#" onclick="javascript:aDelete('dAd',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash" ></i></a></span>
                      </td>
                    </tr>
                    </s:iterator>
                  </tbody>
                </table>
             <div class="row-fluid ptop30" align="center">
                <div class="span12">
                <s:if test="pageNo==1" ><a class="inactive" href="#"> « Previous </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo-1)" />)"> « Previous </a></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo-4)"/>)"><s:property value="(pageNo-4)" /></a></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo-3)"/>)"><s:property value="(pageNo-3)" /></a></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo-2)" />)"><s:property value="(pageNo-2)" /></a></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo-1)" />)"><s:property value="(pageNo-1)" /></a></s:if>
				<a class="current1" href="#"><s:property value="pageNo" /></a>
				<s:if test="(pageNo+1)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo+1)" />)"><s:property value="(pageNo+1)" /></a></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo+2)" />)"><s:property value="(pageNo+2)" /></a></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo+3)" />)"><s:property value="(pageNo+3)" /></a></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo+4)" />)"><s:property value="(pageNo+4)" /></a></s:if>
				<s:if test="noOfPages<=pageNo" ><a class="inactive" href="#"> Next » </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sAdminAds',<s:property value="(pageNo+1)" />)"> Next » </a></s:else>
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
<div id="delete" class="modal fade"></div>
<%@include file="../includes/adminFooter.jsp"%>
<script>$(document).ready(function(){$('[data-toggle="tooltip"]').tooltip();});</script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/jquery.datetimepicker.full.js"></script>
<script>$('.date-picker').datetimepicker({timepicker:false,format:'d/m/Y',formatDate:'d/m/Y'});
</script>
</body>
</html>