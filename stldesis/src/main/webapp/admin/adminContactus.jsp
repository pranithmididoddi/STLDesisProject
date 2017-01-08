<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Contact Us | STL DESIS</title>
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
              <div class="title"> Contact Us Overview </div>
            </div>
            <h3>Filter Contact Us Records</h3>
            <div class="widget-body">
              <form id="adminContactUsSearchForm" name="adminContactUsSearchForm" action="#" method="post" class="search-form">
                <div class="span2">
                  <input type="text" class="input-block-level" placeholder="Name" id="name" name="name" />
                </div>
                <div class="span2">
                  <input type="text" class="input-block-level" placeholder="Eamil Id" id="emailId" name="emailId" />
                </div>
                <div class="span1">
                  <button type="button" class="btn btn-success" id="adminContactusSearchButton" name="adminContactusSearchButton" onclick="pagingSTL('sContactUs', '1');">Search</button>
                </div>
              </form>
              <div class="page-header">
                <div class="pull-left">
                  <h2>List of Contacted Persons</h2>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="table-responsive" id="table">
                <table class="table table-condensed table-bordered no-margin">
                  <thead>
                    <tr>
                      <th>Contact Person</th>
                      <th>Email</th>
                      <th>Subject</th>
                      <th>Contacted Date</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  <s:if test="contactusList!=null && contactusList.size>0">
                  <s:iterator value="contactusList" var="contactus">
	                    <tr>
	                      <td><s:property value="name" /></td>
	                      <td><s:property value="emailId" /></td>
	                      <td><s:property value="subject" /></td>
	                      <td><s:date name="time" format="MMM dd, yyyy"/></td>
	                      <td>
	                      	<a href="#" data-toggle="modal" data-target="#view" onclick="javascript:callAjx('vAdminContactUs',<s:property value="contactId"/>);"><i class="fa fa-eye"></i></a>
	                      	<a href="#"  data-toggle="modal" data-target="#delete" onclick="javascript:aDelete('dAdminContactUs',<s:property value="contactId"/>);"><i class="fa fa-trash"></i></a>
	                      </td>
	                    </tr>
                    </s:iterator>
                    </s:if>
                  </tbody>
                </table>     
              <div class="row-fluid ptop30" align="center">
                <div class="span12">
	                <s:if test="pageNo==1" ><a class="inactive" href="#"> « Previous </a></s:if>
					<s:else><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo-1)" />)"> « Previous </a></s:else>
					<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo-4)"/>)"><s:property value="(pageNo-4)" /></a></s:if>
					<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo-3)"/>)"><s:property value="(pageNo-3)" /></a></s:if>
					<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo-2)" />)"><s:property value="(pageNo-2)" /></a></s:if>
					<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo-1)" />)"><s:property value="(pageNo-1)" /></a></s:if>
					<a class="current1" href="#"><s:property value="pageNo" /></a>
					<s:if test="(pageNo+1)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo+1)" />)"><s:property value="(pageNo+1)" /></a></s:if>
					<s:if test="(pageNo+2)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo+2)" />)"><s:property value="(pageNo+2)" /></a></s:if>
					<s:if test="(pageNo+3)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo+3)" />)"><s:property value="(pageNo+3)" /></a></s:if>
					<s:if test="(pageNo+4)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo+4)" />)"><s:property value="(pageNo+4)" /></a></s:if>
					<s:if test="noOfPages<=pageNo" ><a class="inactive" href="#"> Next » </a></s:if>
					<s:else><a class="paginate" href="javascript:pagingSTL('sContactUs',<s:property value="(pageNo+1)" />)"> Next » </a></s:else>
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
<div class="modal fade" id="delete"></div>
<div class="modal fade" id="view"></div>
<%@include file="../includes/adminFooter.jsp"%>
</body>
</html>