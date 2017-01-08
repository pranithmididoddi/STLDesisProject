<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<header> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminHome" class="logo" >stldesis Admin Panel</a>
  <div id="mini-nav">
    <ul class="hidden-phone">
      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>changePassword" <s:if test="urlPage.equals('changePassword')">class="selected"</s:if>>Change Password</a></li>
      <li><a href="#" target="_blank">View Website</a></li>
      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>logout">Logout</a></li>
    </ul>
    <div class="clearfix"></div>
  </div>
</header>