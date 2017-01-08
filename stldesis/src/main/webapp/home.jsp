<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<head>
<meta charset="utf-8">
<title>STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="includes/links.jsp"%>
</head>
<body>
<div class="wrapper">
<%@include file="includes/header.jsp"%>
<%@include file="includes/leftMenu.jsp"%>
	<div class="content">
        <div class="col-sm-6 popular-block-home">
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/accommodation"> 
	          		<i class="fa fa-home"></i>
	            	<h2>Accommodation</h2>
	          </a>
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
          	<a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/auto"> 
          		<i class="fa fa-car"></i>
            	<h2>Auto</h2>
            </a>
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/catering"> 
	          		<i class="fa fa-cutlery"></i>
	            	<h2>Catering</h2>
	          </a>
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/child_care"> 
	          		<i class="fa fa-child"></i>
	            	<h2>Child Care</h2>
	          </a>
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/forSale"> 
	          		<i class="fa fa-money"></i>
	            	<h2>For Sale</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/jobs"> 
	          		<i class="fa fa-briefcase"></i>
	            	<h2>Jobs</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/ladiesCorner"> 
	          		<i class="fa fa-female"></i>
	            	<h2>Ladies Corner</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/travelCompanion"> 
	          		<i class="fa fa-plane"></i>
	            	<h2>Travel</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/others"> 
	          		<i class="fa fa-adn"></i>
	            	<h2>Other Classifieds</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event"> 
	          		<i class="fa fa-calendar"></i>
	            	<h2>Events</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit"> 
	          		<i class="fa fa-map-o"></i>
	            	<h2>Places to Visit</h2>
	          </a> 
          </div>
          <div class="col-sm-6 col-xs-6 col-md-4"> 
	          <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>interviews"> 
	          		<i class="fa fa-microphone"></i>
	            	<h2>Interviews</h2>
	          </a> 
          </div>
          <div class="clearfix"></div>
        </div>
        </div>
        <div class="col-sm-3 content-right-add">
        	<s:iterator value="homeRightFixedAdList"><a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>" /></a></s:iterator>  
          	<marquee behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
          	<s:iterator value="homeScrollAdList">
          		<a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>"></a><br>
           	</s:iterator>  
          </marquee>
       </div></div>      
       <div class="col-sm-9 mtop10"> <s:iterator value="homeBottomAdList"><a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>" class="content-bottom-add" /></a></s:iterator></div>
<%@include file="includes/footer.jsp"%>