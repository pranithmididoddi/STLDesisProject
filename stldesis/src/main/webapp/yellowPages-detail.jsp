<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title><s:property value="yellowPages.title"/> | STL DESIS</title>
<meta name="keywords" content="<s:property value="yellowPages.title"/>, Schools in St.Louis, Church in St.Louis, Shopping malls in St.Louis, Restaurants in St.Louis, Beauty care Centers in St.Louis, St.Louis | STL DESIS">
<meta name="description" content="<s:property value="yellowPages.title"/>, Schools in St.Louis, Church in St.Louis, Shopping malls in St.Louis, Restaurants in St.Louis, Beauty care Centers in St.Louis, St.Louis, STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 posting-detail">
          <ol class="breadcrumb">
            <li><a href="<%= properties.getProperty("CONTEXT_PATH").toString()%>home">Home</a></li>
            <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/<s:property value="category.categoryUrlName"/>"><s:property value="category.categoryName"/> (Yellow Pages)</a></li>
            <li class="active"><s:property value="yellowPages.title" /> Details</li>
          </ol>
          <div class="col-sm-12 single-posting"> 
            <s:if test="yellowPages!=null">
            <div class="col-sm-12 post-details">
				<h2><s:property value="yellowPages.title"/></h2>
              	<div><s:property value="yellowPages.description" escapeHtml="false"/></div>
              	<h3><span>Contact Person : </span> <s:property value="yellowPages.contactPerson"/></h3>
              	<h3><span>Email : </span> <s:property value="yellowPages.emailId"/></h3>
              	<h3><span>Phone : </span> <s:property value="yellowPages.phone"/></h3>
              	<h3><span>Address : </span> <s:property value="yellowPages.address"/></h3>
              	<h3><span>Website : </span><a href="<s:property value="yellowPages.website"/>" target="_blank"><s:property value="yellowPages.website"/>&nbsp;&nbsp;<i class="fa fa-external-link"></i></a></h3>
            </div>
            </s:if>
          </div>
        </div>
      </div>
<%@include file="includes/footer.jsp"%>