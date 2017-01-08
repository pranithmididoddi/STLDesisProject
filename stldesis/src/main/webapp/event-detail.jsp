<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title><s:property value="event.title"/> | STL DESIS</title>
<meta name="keywords" content="<s:property value="event.title"/>, Events in St.Louis, Today Events in St.Louis, St.Louis | STL DESIS">
<meta name="description" content="<s:property value="event.title"/>, Events in St.Louis, Today Events in St.Louis, St.Louis | STL DESIS" />
</head>
<body>
<%@include file="includes/header.jsp"%>
<%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 posting-detail"> 
                <ol class="breadcrumb">
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>">Home</a></li>
                	<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event">Events</a></li>
                  <li class="active">Event Details</li>
                </ol>
              <div class="col-sm-12 single-posting">
                <!--<div class="col-sm-2 post-img"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/accomodation1.jpg" alt="accomodation1"/></div>-->
                <div class="col-sm-12 post-details">
                <s:if test="event!=null">
                  <p class="event-date"><s:date name="event.fromTime" format="MMM dd, EEEE" /> at <s:date name="event.fromTime" format="hh:mm a" /></p>
                  <h2><s:property value="event.title"/></h2>
                  <h3 class="sub-heading">Detail Description : </h3>
                  <div><s:property value="event.description" escapeHtml="false"/></div>
                  <h3 class="sub-heading">Contact Details : </h3>
                  <h3 class="col-sm-6"><span>Name : </span> <s:property value="event.name"/></h3>
                  <h3 class="col-sm-6"><span>Email : </span> <s:property value="event.emailId"/></h3>
                  <h3 class="col-sm-6"><span>Phone : </span> <s:property value="event.phone"/></h3>
                  <h3 class="col-sm-6"><span>Address : </span> <s:property value="event.address"/></h3>
                  <h3 class="col-sm-6"><span>Event Start on : </span><s:date name="event.fromTime" format="MM/dd/yyyy hh:mm a" /></h3>
                  <h3 class="col-sm-6"><span>Event End on : </span> <s:date name="event.toTime" format="MM/dd/yyyy hh:mm a" /></h3>
                </s:if>
                </div>
              </div>
        </div>
<%@include file="includes/footer.jsp"%>
