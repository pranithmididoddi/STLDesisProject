<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="includes/links.jsp" %>
<title>Events | STL DESIS</title>
<meta name="keywords" content="<s:property value="category.metaKeywords"/> STL DESIS">
<meta name="description" content="<s:property value="category.metaDescription"/> STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@ include file="includes/header.jsp" %>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 events-list">
          <ol class="breadcrumb">
            <li><a href="<%=properties.getProperty("CONTEXT_PATH")%>home">Home</a></li>
            <li class="active">Events</li>
          </ol>
          <s:if test="eventsList!=null && eventsList.size>0">
          <s:iterator value="eventsList" var="event">
          	<div class="col-sm-6">
	          <a href="<%=properties.getProperty("CONTEXT_PATH")%>event/<s:property value="url" />">
		          <div class="single-posting post-details">
		              <p class="event-date"><s:date name="fromTime" format="MMM dd, EEEE" /></p>
		              <div class="padding5">
		                  <h2 class="one-line-hdng"><s:property value="title"/></h2>
		                  <h3><span>Location : </span><s:property value="address"/><br/></h3>
		                  <h3><span>Event Start on : </span><s:date name="fromTime" format="hh:mm a" /></h3>
		              </div>
		          </div>
	          </a>
	        </div>
	      </s:iterator>
          </s:if><s:else><h2>No Pages were found in this Category.!!!</h2></s:else>
         <div class="col-xs-12">
            <ul class="pagination">
			    <s:if test="pageNo==1" ><li class="prev disabled"><a href="#"> << </a></li></s:if>
				<s:else><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo-1)" />"> << </a></li></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo-4)" />"><s:property value="(pageNo-4)" /></a></li></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo-3)" />"><s:property value="(pageNo-3)" /></a></li></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo-2)" />"><s:property value="(pageNo-2)" /></a></li></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo-1)" />"><s:property value="(pageNo-1)" /></a></li></s:if>
				<li class="active"><a href="#"><s:property value="pageNo" /></a></li>
				<s:if test="(pageNo+1)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo+1)" />"><s:property value="(pageNo+1)" /></a></li></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo+2)" />"><s:property value="(pageNo+2)" /></a></li></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo+3)" />"><s:property value="(pageNo+3)" /></a></li></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo+4)" />"><s:property value="(pageNo+4)" /></a></li></s:if>
				<s:if test="noOfPages<=pageNo" ><li class="next disabled"><a href="#"> >> </i></a></li></s:if>
				<s:else><li class="next"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event?pageNo=<s:property value="(pageNo+1)" />"> >> </i></a></li></s:else>
			</ul>
          </div>
        </div>
      </div>
    <%@ include file="includes/footer.jsp" %>
