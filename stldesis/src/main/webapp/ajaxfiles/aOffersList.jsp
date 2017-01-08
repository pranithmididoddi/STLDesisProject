<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
                <table class="table table-condensed table-bordered no-margin">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Sub Category </th>
                      <th>URL</th>
                      <th>Posted Date</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <s:iterator value="offersList" var="offers">
                    <tr>
                      <td><s:property value="id"/></td>  
                      <td><s:iterator value="categoryList" var="category"><s:if test="#category.categoryId==#offers.categoryId"><s:property value="#category.categoryName"/></s:if></s:iterator></td>
                      <td><s:property value="url"/></td>
                      <td><s:date name="lastUpdatedTime" format="MMM dd, yyyy"/></td>
                      <td><s:if test="status==1">Active</s:if><s:else>In Active</s:else></td>
                      <td>
                      	<span data-toggle="modal" data-target="#view"><a href="#" onclick="javascript:callAjx('vOffers',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" title="View"><i class="fa fa-eye"></i></a></span>                        	
                      	<a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminEditOffers?id=<s:property value="id" />"><i class="fa fa-pencil"></i></a>
                      	<span data-toggle="modal" data-target="#delete"><a href="#" onclick="javascript:aDelete('dOffers',<s:property value="id" />)" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></a></span>
                      </td>
                    </tr>
                    </s:iterator>
                  </tbody>
                </table>
              <div class="row-fluid ptop30" align="center">
                <div class="span12">
                	<s:if test="pageNo==1" ><a class="inactive" href="#"> « Previous </a></s:if>
					<s:else><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo-1)" />)"> « Previous </a></s:else>
					<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo-4)"/>)"><s:property value="(pageNo-4)" /></a></s:if>
					<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo-3)"/>)"><s:property value="(pageNo-3)" /></a></s:if>
					<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo-2)" />)"><s:property value="(pageNo-2)" /></a></s:if>
					<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo-1)" />)"><s:property value="(pageNo-1)" /></a></s:if>
					<a class="current1" href="#"><s:property value="pageNo" /></a>
					<s:if test="(pageNo+1)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo+1)" />)"><s:property value="(pageNo+1)" /></a></s:if>
					<s:if test="(pageNo+2)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo+2)" />)"><s:property value="(pageNo+2)" /></a></s:if>
					<s:if test="(pageNo+3)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo+3)" />)"><s:property value="(pageNo+3)" /></a></s:if>
					<s:if test="(pageNo+4)<=noOfPages" ><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo+4)" />)"><s:property value="(pageNo+4)" /></a></s:if>
					<s:if test="noOfPages<=pageNo" ><a class="inactive" href="#"> Next » </a></s:if>
					<s:else><a class="paginate" href="javascript:pagingSTL('sOffers',<s:property value="(pageNo+1)" />)"> Next » </a></s:else>
				</div>
              </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>