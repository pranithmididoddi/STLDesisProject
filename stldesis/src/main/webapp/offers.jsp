<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title><s:property value="category.title"/> (Offers) | STL DESIS</title>
<meta name="keywords" content="<s:property value="category.metaKeywords"/> STL DESIS">
<meta name="description" content="<s:property value="category.metaDescription"/> STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 postings-list">
          <ol class="breadcrumb">
            <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>">Home</a></li>
            <li class="active"><s:property value="category.categoryName"/> (Offers)</li>
          </ol>
          <s:if test="offersList!=null && offersList.size>0">
          <s:iterator value="offersList" var="offers">
          <a href="<%=properties.getProperty("CONTEXT_PATH").toString()%>offers/<s:property value="category.categoryUrlName"/>/<s:property value="url" />">
	      <div class="col-sm-12 single-posting">
	        	<div class="col-sm-2 post-img"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="accomodation1" /></div>
              	<div class="col-sm-10 post-details">
	              <div class="short-description"><s:property value="description" escapeHtml="false"/></div>
	            </div>
          </div></a>
          </s:iterator>
          </s:if> <s:else><h2>No Pages were found in this Category.!!!</h2></s:else>
          <div class="col-xs-12 no-padding">
            <ul class="pagination">
			    <s:if test="pageNo==1" ><li class="prev disabled"><a href="#"> << </a></li></s:if>
				<s:else><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-1)" />"> << </a></li></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-4)" />"><s:property value="(pageNo-4)" /></a></li></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-3)" />"><s:property value="(pageNo-3)" /></a></li></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-2)" />"><s:property value="(pageNo-2)" /></a></li></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo-1)" />"><s:property value="(pageNo-1)" /></a></li></s:if>
				<li class="active"><a href="#"><s:property value="pageNo" /></a></li>
				<s:if test="(pageNo+1)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+1)" />"><s:property value="(pageNo+1)" /></a></li></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+2)" />"><s:property value="(pageNo+2)" /></a></li></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+3)" />"><s:property value="(pageNo+3)" /></a></li></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+4)" />"><s:property value="(pageNo+4)" /></a></li></s:if>
				<s:if test="noOfPages<=pageNo" ><li class="next disabled"><a href="#"> >> </i></a></li></s:if>
				<s:else><li class="next"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName" />?pageNo=<s:property value="(pageNo+1)" />"> >> </i></a></li></s:else>
			</ul>
          </div>
        </div>
      </div>
    <%@include file="includes/footer.jsp"%>