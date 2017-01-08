<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title>Offers Detail | STL DESIS</title>
<meta name="keywords" content="Deals in St.Louis, Offers in St.Louis, Coupons in St.Louis, Todays Offers in St.Louis, St.Louis | STL DESIS">
<meta name="description" content="Deals in St.Louis, Offers in St.Louis, Coupons in St.Louis, Todays Offers in St.Louis, St.Louis | STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
      <div class="col-sm-9 posting-detail"> 
              <ol class="breadcrumb">
                <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>">Home</a></li>
                	<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/<s:property value="category.categoryUrlName"/>"><s:property value="category.categoryUrlName"/> (Offers)</a></li>
                  <li class="active"> Details</li>
              </ol>
            <div class="col-sm-12 single-posting">                
              <div class="col-sm-12 post-details">
             <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="offers.image"/>" alt="accomodation1"/>
             <h3 class="sub-heading">Detail Description : </h3>
             <div><s:property value="offers.description" escapeHtml="false"/></div>
             <h3><a href="<s:property value="offers.linkUrl"/>" target="_blank"><s:property value="offers.linkUrl"/>&nbsp;<i class="fa fa-external-link"></i></a></h3>
           </div>
        </div>
      </div>
<%@include file="includes/footer.jsp"%>
