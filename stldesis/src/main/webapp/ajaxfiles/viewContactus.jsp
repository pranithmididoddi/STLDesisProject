<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="modal-dialog">
	<div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">Contact Form Details of <s:property value="contactus.name" /></h4>
        </div>
<s:if test="contactus!=null" >
<div class="modal-body">
     <h5>Id :  <span><s:property value="contactus.contactId" /></span></h5>
     <h5>Name : <span><s:property value="contactus.name" /></span></h5>
     <h5>Email Id :  <span><s:property value="contactus.emailId" /></span></h5>
     <h5>Phone :  <span><s:property value="contactus.phone" /></span></h5>
     <h5>Subject :  <span><s:property value="contactus.subject" /></span></h5>
     <s:if test="contactus.subject=='Report Fraud' || contactus.subject=='Partnership and Business Development'"><h5>Ad Id / Link :  <span><s:property value="contactus.adIdLink" /></span></h5></s:if>
     <s:if test="contactus.attachment !=null">
     <h5>Attachment :  <span><s:property value="contactus.attachment" /></span></h5>
       		<s:url id="downloadAttachment" namespace="/" action="downloadAttachment" >
	            <s:param name="contactId" value="contactus.contactId"/>
	        </s:url>
	        <s:a href="%{downloadAttachment}" cssClass="btn btn-primary attachment-dwnld-button" >Download Attachment of <s:property value="contactus.name" /> <i class="fa fa-download"></i></s:a>
     </s:if>
     <h5>Message :</h5>
     <textarea rows="10" cols="" placeholder="Enter English Page Content" disabled="disabled"><s:property value="contactus.message" /></textarea>
     <h5>Time :  <span><s:date name="contactus.time" format="MMM dd, yyyy" /></span></h5>
     <h5>Status : <span> <s:if test="contactus.status==1">Active</s:if><s:else>In Active</s:else></span></h5>
</div>
</s:if>
<div class="modal-footer">
  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
</div>
</div>
</div>
