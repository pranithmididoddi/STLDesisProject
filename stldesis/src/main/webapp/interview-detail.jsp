<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="includes/links.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title><s:property value="interviews.title"/> | STL DESIS</title>
<meta name="keywords" content="<s:property value="interviews.title"/>, celebrities interviews, Business person interviews, St.Louis Top persons interviews, St.Louis | STL DESIS">
<meta name="description" content="<s:property value="interviews.title"/>, celebrities interviews, Business person interviews, St.Louis Top persons interviews, St.Louis | STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@ include file="includes/header.jsp" %>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 interview-detail"> 
                <ol class="breadcrumb">
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH") %>home">Home</a></li>
                	<li><a href="<%=properties.getProperty("CONTEXT_PATH") %>interviews">Interviews</a></li>
                  <li class="active"><s:property value="interviews.title"/></li>
                </ol>
	           <div class="col-sm-12 single-posting">
	             <div class="col-sm-12 post-details">
	               <s:if test="interviews!=null">
	               <h2><s:property value="interviews.title"/></h2>
	               <div><s:property value="interviews.description" escapeHtml="false"/></div>
	             </s:if>
	             </div>
	           </div>
        </div>
      </div>
 <%@ include file="includes/footer.jsp" %>
