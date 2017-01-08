<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Are you sure want to Delete the Record of <s:property value="contactus.name" /> ?</h4>
        </div>
        <div class="modal-body">
        <form id="deleteContactusForm" name="deleteContactusForm" action="deleteContactusAdmin" method="post">
        	<input type="hidden" id="contactId" name="contactId" value="<s:property value="contactus.contactId" />" />
	     	<button type="button" class="btn btn-success" onclick="javascript:deleteAdminContactus();">Yes</button>
	    	<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
    	</form>
        </div>
      </div>
    </div>