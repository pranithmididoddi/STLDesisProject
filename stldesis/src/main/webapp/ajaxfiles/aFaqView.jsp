<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
           <h4 class="modal-title"><s:property value="faq.title"/> </h4>
         </div>
         <s:if test="faq!=null">
         <div class="modal-body" id="aView">
            <h5><span>FAQ Id : </span> <s:property value="faq.id"/> </h5>
           <h5><span>FAQ Title : </span> <s:property value="faq.title"/></h5>
           <h5><span>FAQ URL : </span> <s:property value="faq.url"/></h5>
          <h5><span>Description : </span></h5>
          <textarea rows="10" cols="" disabled="disabled"> 
          <s:property value="faq.description" escapeHtml="false"/>
          </textarea>
          <h5><span>Status : </span><s:if test="faq.status==1">Active</s:if><s:else>In Active</s:else></h5>
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