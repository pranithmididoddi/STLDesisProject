<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
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
<%}else{%>
<s:property value="errorMsg"/>
<%}%>