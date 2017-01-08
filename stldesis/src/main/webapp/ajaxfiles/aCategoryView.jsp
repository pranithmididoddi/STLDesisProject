<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                      <h4 class="modal-title"><s:property value="category.title"/> </h4>
                    </div>
                    <s:if test="category!=null">
                    <div class="modal-body" id="aView">
                        <h5><span>Category Id : </span><s:property value="category.categoryId"/></h5>
				        <h5><span>Category : </span> <s:property value="category.categoryName"/></h5>
				        <h5><span>Parent Category : </span><s:if test="category.isParentCategory==0"><s:property value="category.parentCategory.categoryName"/></s:if><s:else>-</s:else> </h5>
				        <h5><span>Category Url : </span> <s:property value="category.categoryUrlName"/></h5>
				        <h5><span>Priority : </span>  <s:property value="category.priority"/></h5>
				        <h5><span>Title : </span> <s:property value="category.title"/></h5>
				        <h5><span>Key Words : </span></h5>
				        <textarea rows="7" cols="" disabled="disabled"> <s:property value="category.metaKeywords"/></textarea>
				        <h5><span>Description : </span></h5>
				        <textarea rows="7" cols="" disabled="disabled"> <s:property value="category.metaDescription" escapeHtml="false"/></textarea>
                        <h5><span>Status : </span><s:if test="category.status==1">Active</s:if><s:else>In Active</s:else></h5>
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