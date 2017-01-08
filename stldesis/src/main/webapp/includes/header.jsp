<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="header">
  <div class="container">
    <div class="col-md-3 no-padding"> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/logo.png" alt="logo" class="logo" /></a> </div>
    <div class="col-md-6">
      <div id="fadeMe">
      <s:if test="headerAdList!=null && headerAdList.size>0">
      <s:iterator value="headerAdList">
      	<a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>"></a>
      </s:iterator>
      </s:if>
      </div>
    </div>
    <div class="col-md-3 header-nav">
      <ul>
        <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>about-us">About US</a></li>
        <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>contactUs">Contact Us</a></li>
        <li><a href="https://www.facebook.com/stldesis/" target="_blank"><i class="fa fa-facebook-square"></i></a></li>
      </ul>
    </div>
  </div>
</div>
