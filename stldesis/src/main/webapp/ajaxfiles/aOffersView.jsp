<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
           <h4 class="modal-title"><s:property value="offers.title"/> </h4>
         </div>
         <s:if test="offers!=null">
         <div class="modal-body" id="aView">
          <h5><span>Offer Id : </span> <s:property value="offers.id"/></h5>
           <h5><span>Offer Url : </span><s:property value="offers.url"/></h5>
           <h5><span>Offer Link Url : </span><s:property value="offers.linkUrl"/></h5>
           <h5><span>Category : </span> <s:iterator value="categoryList" var="category"><s:if test="#category.categoryId==offers.categoryId"><s:property value="#category.categoryName"/></s:if></s:iterator></h5>
           <div class="span3 mleft0">
           <h5><span>Uploaded Image : </span></h5>
           		<img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="offers.image"/>" alt="" title="" class="user-uploaded-image-view">
           </div>
           <div class="clear"></div>
           <h5><span>Description : </span></h5>
           <textarea rows="10" cols="" disabled="disabled">
           	<s:property value="offers.description" escapeHtml="false"/>
           </textarea>
           <h5><span>Status : </span><s:if test="offers.status==1">Active</s:if><s:else>In Active</s:else></h5>
         <div class="clearfix"></div>
         </div>
         </s:if>
         <div class="modal-footer">
           <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
         </div>
       </div>
     </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>