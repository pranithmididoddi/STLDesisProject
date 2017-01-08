<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
      <table class="table table-condensed table-bordered no-margin admin-list-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Category </th>
                      <th>Parent Category </th>
                      <th>Title</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  <s:iterator value="categoryList" var="category">
                    <tr>
                      <td><s:property value="categoryId"/></td>
                      <td><s:property value="categoryName"/></td>
                      <td><s:if test="isParentCategory==0"><s:property value="parentCategory.categoryName"/></s:if><s:else>-</s:else> </td>
                      <td><s:property value="title"/> </td>
                      <td>
	                      <span data-toggle="modal" data-target="#view"><a href="#" onclick="javascript:callAjx('vCategories',<s:property value="categoryId" />)" data-toggle="tooltip" data-placement="top" title="View"><i class="fa fa-eye"></i></a></span> 
	                      <s:if test="isParentCategory==0"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminEditCategoriesPage?categoryId=<s:property value="categoryId" />" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a></s:if>
	                      <s:if test="isParentCategory==0"><span data-toggle="modal" data-target="#delete"><a href="#" onclick="javascript:aDelete('dCategories',<s:property value="categoryId" />)" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></a></span></s:if>
                      </td>
                    </tr>
                    </s:iterator>
                  </tbody>
                </table>
             <div class="row-fluid ptop30" align="center">
                <div class="span12">
                <s:if test="pageNo==1" ><a class="inactive" href="#"> « Previous </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo-1)" />)"> « Previous </a></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo-4)"/>)"><s:property value="(pageNo-4)" /></a></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo-3)"/>)"><s:property value="(pageNo-3)" /></a></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo-2)" />)"><s:property value="(pageNo-2)" /></a></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo-1)" />)"><s:property value="(pageNo-1)" /></a></s:if>
				<a class="current1" href="#"><s:property value="pageNo" /></a>
				<s:if test="(pageNo+1)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo+1)" />)"><s:property value="(pageNo+1)" /></a></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo+2)" />)"><s:property value="(pageNo+2)" /></a></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo+3)" />)"><s:property value="(pageNo+3)" /></a></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo+4)" />)"><s:property value="(pageNo+4)" /></a></s:if>
				<s:if test="noOfPages<=pageNo" ><a class="inactive" href="#"> Next » </a></s:if>
				<s:else><a class="paginate" href="javascript:pagingSTL('sAllCategories',<s:property value="(pageNo+1)" />)"> Next » </a></s:else>
				</div>
              </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>