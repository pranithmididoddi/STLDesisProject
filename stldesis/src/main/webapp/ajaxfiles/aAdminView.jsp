<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
<div class="modal fade" id="view">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                      <h4 class="modal-title">Details of <s:property value="user.firstName"/> <s:property value="user.lastName"/></h4>
                    </div>
                    <div class="modal-body" id="aView">
                       <h5><span>User Id : </span><s:property value="user.userId"/>  </h5>
				        <h5><span>Login Name : </span><s:property value="user.loginName"/></h5>
				        <h5><span>Password : </span><s:property value="user.password"/></h5>
				        <h5><span>First Name : </span><s:property value="user.firstName"/></h5>
				        <h5><span>Last Name : </span> <s:property value="user.lastName"/></h5>
				        <h5><span>Contact No : </span><s:property value="user.contactNo"/></h5>
				        <h5><span>Address : </span></h5>
				        <textarea rows="5" cols="" disabled="disabled"><s:property value="user.address"/></textarea>
				        <h5>Time :  <span><s:date name="user.time" format="MMM dd, yyyy" /></span></h5>
				        <h5>Status :  <span><s:if test="user.status==1">Active</s:if><s:else>In Active</s:else></h5>
                        <div class="clearfix"></div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>