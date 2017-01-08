<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title><s:property value="placesToVisit.title"/> | STL DESIS</title>
<meta name="keywords" content="<s:property value="placesToVisit.title"/>, Famous places in St.Louis, Visiting places in St.Louis, Tourist places in St.Louis, St.Louis | STL DESIS">
<meta name="description" content="<s:property value="placesToVisit.title"/>, Famous places in St.Louis, Visiting places in St.Louis, Tourist places in St.Louis, St.Louis | STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 posting-detail"> 
                <ol class="breadcrumb">
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>home">Home</a></li>
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit">Places to Visit</a></li>
                  <li class="active"><s:property value="placesToVisit.title"/></li>
                </ol>
              <div class="col-sm-12 single-posting">
                <div class="col-sm-12 post-details">
                  <h2><s:property value="placesToVisit.title"/></h2>
                  <div><s:property value="placesToVisit.description" escapeHtml="false"/></div>
                </div>
              </div>
        </div>
      </div>
    <%@include file="includes/footer.jsp"%>