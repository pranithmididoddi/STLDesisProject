<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>404 Error</title>
<meta name="keywords" content="Accomodation STL DESIS">
<meta name="description" content="Accomodation STL DESIS" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/favicon.png" type="image/x-icon" />
<link rel="stylesheet" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/custom.css" />
<link rel="stylesheet" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/font-awesome.css" />
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/jquery-1.12.3.min.js"></script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div class="wrapper">
<div class="header">
  <div class="container">
    <div class="col-md-9 no-padding"> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/logo.png" alt="logo" class="logo" /></a> </div>
    <div class="col-md-3 header-nav">
      <ul>
        <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>about-us">About US</a></li>
        <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>contactUs">Contact Us</a></li>
        <li><a href="https://www.facebook.com/stldesis/" target="_blank"><i class="fa fa-facebook-square"></i></a></li>
      </ul>
    </div>
  </div>
</div>
    <div class="col-sm-10 div-center">
      <div class="clearfix"></div>
      <div class="main-content">
		<div class="col-sm-3"> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>postFreeAd" class="btn postadd-btn">Post Free Ad</a>
          <div class="sidebar-nav">
            <div class="navbar navbar-default" role="navigation">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <span class="visible-xs navbar-brand">Sidebar menu</span> </div>
              <div class="navbar-collapse collapse sidebar-navbar-collapse">
                <ul class="nav navbar-nav">
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>">Home</a></li>
                  <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Classifides <i class="fa fa-caret-right"></i></a>
                    <ul class="dropdown-menu">
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/accommodation" class="">Accomodation</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/auto" class="">Auto</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/catering" class="">Catering</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/child_care" class="">Child Care</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/forSale" class="">For Sale</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/jobs" class="">Jobs</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/ladiesCorner" class="">Ladies Corner</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/travelCompanion" class="">Travel Companion</a></li>
                      <li class=""><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/others" class="">Others</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Yellow Pages <i class="fa fa-caret-right"></i></a>
                    <ul class="dropdown-menu">
                      
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/arts">Arts</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/beauty">Beauty</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/caterings">Caterings</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/educationForKids">Education for Kids</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/entertainers">Entertainers</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/organizations">Organizations</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/placesOfWorship">Places of Worship</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/profesionals">Profesionals</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/restaurants">Restaurants</a></li>
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>yellowPages/services">Services</a></li>
                    </ul>
                  </li>
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>event">Events</a></li>
                  <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Offers <i class="fa fa-caret-right"></i></a>
                    <ul class="dropdown-menu">
                      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/coupons">Coupons</a></li>
                      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>offers/deals">Deals</a></li>
                    </ul>
                  </li>
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>placesToVisit">Places to Visit</a></li>
                  <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Movies <i class="fa fa-caret-right"></i></a>
                    <ul class="dropdown-menu">
                      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/telugu">Telugu</a></li>
                      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/tamil">Tamil</a></li>
                      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>movies/hindi">Hindi</a></li>
                    </ul>
                  </li>
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>interviews">Interviews</a></li>
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq">FAQ</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-9 posting-detail"> 
            <div id="error-page">
		      <h2>404 ERROR</h2>
		      <h4>Unfortunately, the page you are looking for could not found here. <br/>Please visit the <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>" title="STL DESIS" rel="home">Homepage</a>.</h4>
		    </div>
      	</div>
       </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="footer">
  <div class="footer-nav">
    <ul>
      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>sitemap">Sitemap</a></li>
      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>testimonials">Testimonials</a></li>
      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>privacy-policy">Privacy Policy</a></li>
      <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>disclaimer">Disclaimer</a></li>
    </ul>
  </div>
  <div class="text-center">
    <p>Copyright &copy; 2016 STLDESIS.COM. All rights reserved</p>
  </div>
</div>
</body>
</html>