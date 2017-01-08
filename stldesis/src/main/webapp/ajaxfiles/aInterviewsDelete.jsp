<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% if(request.getParameter("id").toString().equals("success")) { %>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Are you sure want to delete the entry ?</h4>
      </div>
      <div class="modal-body">
        <form action="deleteAdminInterviewsPages" id="deleteInterviewsForm" name="deleteInterviewsForm" method="post">
          <input type="hidden" id="pId" name="pId" value="<s:property value="interviews.id"/>" />
          <button type="button" id="deleteInterviewsYes" name="deleteInterviewsYes" class="btn btn-success" onclick="javascript:deleteAdminInterviews();">Yes</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
        </form>
      </div>
    </div>
  </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>