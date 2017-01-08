<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title>Top 10 Places to Visit | STL DESIS</title>
<meta name="keywords" content="<s:property value="category.metaKeywords"/> STL DESIS">
<meta name="description" content="<s:property value="category.metaDescription"/> STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 placesToVisit-list">
          <ol class="breadcrumb">
            <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>home">Home</a></li>
            <li class="active">Places to Visit</li>
          </ol>
          <s:if test="placesToVisitList!=null && placesToVisitList.size>0">
          <s:iterator value="placesToVisitList" var="placesToVisit">
          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit/<s:property value="url" />">
          <div class="col-sm-12 single-posting">
            <div class="col-sm-3 post-img"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image1" />" alt="<s:property value="title"/> Image"/></div>
            <div class="col-sm-9 post-details">
              <h2><s:property value="title"/></h2>
              <div class="short-description"><s:property value="description" escapeHtml="false"/></div>
            </div>
          </div>
          </a>
          </s:iterator>
          </s:if><s:else><h2>No Pages were found in this Category.!!!</h2></s:else>
          <div class="col-xs-12 no-padding">
            <ul class="pagination">
			    <s:if test="pageNo==1" ><li class="prev disabled"><a href="#"> << </a></li></s:if>
				<s:else><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo-1)" />"> << </a></li></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo-4)" />"><s:property value="(pageNo-4)" /></a></li></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo-3)" />"><s:property value="(pageNo-3)" /></a></li></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo-2)" />"><s:property value="(pageNo-2)" /></a></li></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo-1)" />"><s:property value="(pageNo-1)" /></a></li></s:if>
				<li class="active"><a href="#"><s:property value="pageNo" /></a></li>
				<s:if test="(pageNo+1)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo+1)" />"><s:property value="(pageNo+1)" /></a></li></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo+2)" />"><s:property value="(pageNo+2)" /></a></li></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo+3)" />"><s:property value="(pageNo+3)" /></a></li></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo+4)" />"><s:property value="(pageNo+4)" /></a></li></s:if>
				<s:if test="noOfPages<=pageNo" ><li class="next disabled"><a href="#"> >> </i></a></li></s:if>
				<s:else><li class="next"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit?pageNo=<s:property value="(pageNo+1)" />"> >> </i></a></li></s:else>
			</ul>
          </div>
         </div>
      </div>
    <%@include file="includes/footer.jsp"%>
