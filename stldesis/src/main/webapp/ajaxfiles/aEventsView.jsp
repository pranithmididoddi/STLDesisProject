<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
       <div class="modal-dialog modal-lg">
         <div class="modal-content">
           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
             <h4 class="modal-title"><s:property value="event.title"/> </h4>
           </div>
           <s:if test="event!=null" >
           <div class="modal-body" id="aView">
             <h5><span>Event Id : </span> <s:property value="event.id"/>  </h5>
             <h5><span>Event Title : </span> <s:property value="event.title"/> </h5>
             <h5><span>Event Url : </span> <s:property value="event.url"/> </h5>
             <h5><span>Description : </span></h5>
	             <textarea rows="10" cols="" disabled="disabled">
	             	<s:property value="event.description" escapeHtml="false"/>
	             </textarea>
	         <h5><span>Contact Person Name :</span> <s:property value="event.name"/></h5>
             <h5><span>Phone No: </span> <s:property value="event.phone"/></h5>
             <h5><span>Email Id : </span> <s:property value="event.emailId"/></h5>
             <h5><span>Address : </span><br/><s:property value="event.address"/></h5>
             <h5><span>Event Start on : </span> <s:date name="event.fromTime" format="MMMM dd, yyyy HH:mm a"/></h5>
             <h5><span>Event End on : </span> <s:date name="event.ToTime" format="MMMM dd, yyyy HH:mm a"/></h5>
             <h5><span>Status : </span><s:if test="event.status==1">Active</s:if><s:else>In Active</s:else></h5>
             <div class="clearfix"></div>
           </div>
           </s:if>
           <div class="modal-footer">
             <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
           </div>
         </div>
       </div>
     </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>