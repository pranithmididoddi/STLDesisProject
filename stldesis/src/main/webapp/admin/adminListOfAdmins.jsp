<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>List of Admins | STL DESIS</title>
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
              <div class="title"> <i class="fa fa-user"></i> Admin Overview </div>
            </div>
            <h3>Filter Admin Records</h3>
            <div class="widget-body">
              <form id="searchAdminsForm" name="searchAdminsForm" action="#" method="post" class="search-form">
                <div class="span1">
                  <input type="text" class="input-block-level" placeholder="ID" id="userId" name="userId" />
                </div>
                <div class="span2">
                  <input type="email" class="input-block-level" placeholder="Email" id="loginName" name="loginName" />
                </div>
                <div class="span2">
                  <input type="text" class="input-block-level" placeholder="Contact No" id="contactNo" name="contactNo" />
                </div>                
               <div class="span2">
                	 <select class=" input-block-level" id="status" name="status">
                        <option value="">Status</option>
                        <option value="1">Active</option>
                        <option value="0">In-active</option>
                      </select>
                </div>
                <div class="span1">
                  <button type="button" class="btn btn-success" id="searchAdminsFormButton" name="searchAdminsFormButton">Search</button>
                </div>
              </form>
              <div class="page-header">
                <div class="pull-left">
                  <h2>List of Admins</h2>
                </div>
                <div class="pull-right"> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>addAdmin" class="btn btn-danger">Add New Admin</a> </div>
                <div class="clearfix"></div>
              </div>
              <div class="table-responsive" id="table">
                <table class="table table-condensed table-bordered no-margin admin-list-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name </th>
                      <th>Login Name </th>
                      <th>Password </th>
                      <th>Designation</th>
                      <th>Contact No</th>
                      <th>Address</th>
                      <th>Added On</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  <s:iterator value="adminsList">
                    <tr>
                      <td><s:property value="userId"/></td>
                      <td><s:property value="firstName"/> <s:property value="lastName"/></td>
                      <td><s:property value="loginName"/></td>
                      <td><s:property value="password"/></td>
                      <td><s:property value="designation"/></td>
                      <td><s:property value="contactNo"/></td>
                      <td><s:property value="address"/></td>
                      <td><s:date name="time" format="MMM dd, yyyy" /></td>
                      <td><s:if test="status==1">Active</s:if><s:else>In Active</s:else></td>
                      <td>
	                      <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>editAdmin?userId=<s:property value="userId"/>" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a> 
	                      <span data-toggle="modal" data-target="#delete"><a href="#" onclick="javascript:aDelete('dAdmins',<s:property value="userId" />)" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></a></span>
	                  </td>
                    </tr>
                    </s:iterator>
                  </tbody>
                </table>
               <div class="row-fluid ptop30" align="center">
                <div class="span12">
                <s:if test="pageNo==1" ><a class="inactive" href="#"> « Previous </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo-1)" />)"> « Previous </a></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo-4)"/>)"><s:property value="(pageNo-4)" /></a></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo-3)"/>)"><s:property value="(pageNo-3)" /></a></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo-2)" />)"><s:property value="(pageNo-2)" /></a></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo-1)" />)"><s:property value="(pageNo-1)" /></a></s:if>
				<a class="current1" href="#"><s:property value="pageNo" /></a>
				<s:if test="(pageNo+1)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo+1)" />)"><s:property value="(pageNo+1)" /></a></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo+2)" />)"><s:property value="(pageNo+2)" /></a></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo+3)" />)"><s:property value="(pageNo+3)" /></a></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo+4)" />)"><s:property value="(pageNo+4)" /></a></s:if>
				<s:if test="noOfPages<=pageNo" ><a class="inactive" href="#"> Next » </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sAdmin',<s:property value="(pageNo+1)" />)"> Next » </a></s:else>
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
<script>$('.date-picker').datetimepicker({timepicker:false,format:'d/m/Y',formatDate:'d/m/Y'});</script>
</body>
</html>