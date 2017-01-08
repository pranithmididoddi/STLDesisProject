<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title><s:property value="category.title"/> (Movies) | STL DESIS</title>
<meta name="keywords" content="<s:property value="category.metaKeywords"/> STL DESIS">
<meta name="description" content="<s:property value="category.metaDescription"/> STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 movies-list">
          <ol class="breadcrumb">
            <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>home">Home</a></li>
            <li class="active"><s:property value="category.categoryName"/> (Movies)</li>
          </ol>
          <s:if test="moviesList!=null && moviesList.size>0">
          <s:iterator value="moviesList" var="movies">
          <div class="col-sm-12 single-posting">
            <div class="col-sm-4 post-img"><img src="<%=properties.getProperty("CONTEXT_PATH").toString()%>imageAction?imageurl=<s:property value="image1" />" alt="<s:property value="title" /> Image"/></div>
            <div class="col-sm-8 post-details">
              <h2><s:property value="title" /></h2>
              <h3><span>Starring :</span> <s:property value="starring" /></h3>
              <h3><span>Director :</span> <s:property value="director" /></h3>
              <h3><span>Music :</span> <s:property value="music" /></h3> 
              <h3><span>Producer :</span> <s:property value="producer" /> </h3>
            </div>
            <div class="col-xs-12 post-details no-padding">
            	<h3><a href="<s:property value="latestShowTimingsLink" />" target="_blank">Click here for Latest Show Timings &nbsp;<i class="fa fa-external-link"></i></a></h3>
                <div class="movie-location"><s:property value="description" escapeHtml="false"/></div>
            </div>
          </div>
          </s:iterator>
          </s:if><s:else><h2>No Pages were found in this Category.!!!</h2></s:else>
          <div class="col-xs-12 no-padding">
            <ul class="pagination">
			    <s:if test="pageNo==1" ><li class="prev disabled"><a href="#"> << </a></li></s:if>
				<s:else><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-1)" />"> << </a></li></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-4)" />"><s:property value="(pageNo-4)" /></a></li></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-3)" />"><s:property value="(pageNo-3)" /></a></li></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-2)" />"><s:property value="(pageNo-2)" /></a></li></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-1)" />"><s:property value="(pageNo-1)" /></a></li></s:if>
				<li class="active"><a href="#"><s:property value="pageNo" /></a></li>
				<s:if test="(pageNo+1)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+1)" />"><s:property value="(pageNo+1)" /></a></li></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+2)" />"><s:property value="(pageNo+2)" /></a></li></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+3)" />"><s:property value="(pageNo+3)" /></a></li></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+4)" />"><s:property value="(pageNo+4)" /></a></li></s:if>
				<s:if test="noOfPages<=pageNo" ><li class="next disabled"><a href="#"> >> </i></a></li></s:if>
				<s:else><li class="next"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+1)" />"> >> </i></a></li></s:else>
			</ul>
          </div>
        </div>
      </div>
<%@include file="includes/footer.jsp"%>