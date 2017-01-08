<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
           <h4 class="modal-title"><s:property value="yellowPages.title"/> </h4>
         </div>
         <div class="modal-body" >
	           <h5><span>Yellow page Id : </span> <s:property value="yellowPages.id"/>  </h5>
	           <h5><span>Category : </span> <s:iterator value="categoryList" var="category"><s:if test="#category.categoryId==yellowPages.categoryId"><s:property value="#category.categoryName"/></s:if></s:iterator></h5>
	           <h5><span>Title : </span> <s:property value="yellowPages.title"/> </h5>
	           <h5><span>Url : </span> <s:property value="yellowPages.url"/></h5>
	          
	           <h5><span>Description : </span></h5>
	           <div class="fs14"><s:property value="yellowPages.description" escapeHtml="false"/></div>
	           <hr/>
	           <h5><span>Contact Person Name :</span> <s:property value="yellowPages.contactPerson"/></h5>
	           <h5><span>Phone No: </span> <s:property value="yellowPages.phone"/></h5>
	           <h5><span>Email Id : </span> <s:property value="yellowPages.emailId"/></h5>
	           <h5><span>Address : </span><s:property value="yellowPages.address"/></h5>
	           <h5><span>Website URL : </span> <s:property value="yellowPages.website"/></h5>
	           <h5><span>Status : </span><s:if test="yellowPages.status==1">Active</s:if><s:else>In Active</s:else></h5>
	           <div class="clearfix"></div>
         </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>