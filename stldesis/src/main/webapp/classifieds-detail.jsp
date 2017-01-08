<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title><s:property value="classifieds.title"/> Detail | STL DESIS</title>
<meta name="keywords" content="<s:property value="classifieds.title"/>, Free Classifieds, Free Classifieds in USA, Post Free Classifieds, Free Classifieds in St.Louis, St.Louis | STL DESIS">
<meta name="description" content="<s:property value="classifieds.title"/>, Free Classifieds, Free Classifieds in USA, Post Free Classifieds, Free Classifieds in St.Louis, St.Louis | STL DESIS" />
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/gallery-slider.js"></script>
</head>
<body>
<div class="wrapper">
<%@include file="includes/header.jsp"%>
<%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 posting-detail"> 
                <ol class="breadcrumb">
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>">Home</a></li>
                	<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>classifieds/<s:property value="category.categoryUrlName" />"><s:property value="category.categoryName"/> (classifieds)</a></li>
                  <li class="active"><s:property value="classifieds.title"/> Details</li>
                </ol>
                <div class="col-sm-12 single-posting">
                <s:if test="classifieds!=null">
          		    <div class="col-sm-12 post-details">
	                  <h2><s:property value="classifieds.title"/></h2>
	                  <h3><span>Price : </span> &#36; <s:property value="classifieds.price"/></h3>
	                  <h3><span>Posted on : </span> <s:date name="classifieds.postedDate" format="MMM dd, yyyy hh:mm a" /></h3>
	                   <div class="share-post">
						<div class="addthis_toolbox addthis_default_style addthis_32x32_style" data-url="#" data-title="#">
						<a class="addthis_button_facebook at300b" title="Facebook" href="#"></a>
						<a class="addthis_button_twitter at300b" title="Twitter" href="#"></a>
						<a class="addthis_button_email at300b" target="_blank" title="Email" href="#"></a>
						<a class="addthis_button_linkedin at300b" target="_blank" title="LinkdIn" href="#"></a>
						<a class="addthis_button_google_plusone_share at300b" target="_blank" title="Google Plus" href="#"></a>
						<!-- <a class="addthis_button_compact at300m" href="#"></a> -->
						<div class="atclear"></div>
						</div>
						</div>
	                  <div class="product-image">
	                   	 <div id="ninja-slider">
						  <div class="slider-inner">
						    <ul>
						      <s:if test="classifieds.image1!=null && !classifieds.image1.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image1"/>" alt="<s:property value="classifieds.title"/> Image 1" class="ns-img" /></li></s:if>
						      <s:if test="classifieds.image2!=null && !classifieds.image2.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image2"/>" alt="<s:property value="classifieds.title"/> Image 2" class="ns-img" /></li></s:if>
						      <s:if test="classifieds.image3!=null && !classifieds.image3.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image3"/>" alt="<s:property value="classifieds.title"/> Image 3" class="ns-img" /></li></s:if>
						      <s:if test="classifieds.image4!=null && !classifieds.image4.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image4"/>" alt="<s:property value="classifieds.title"/> Image 4" class="ns-img" /></li></s:if>
						    </ul>
						    <div class="fs-icon" title="Expand/Close"></div>
						  </div>
						  <div id="thumbnail-slider">
						    <div class="inner">
						      <ul>
						        <s:if test="classifieds.image1!=null && !classifieds.image1.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image1"/>" alt="<s:property value="classifieds.title"/> Thumb Image 1" class="thumb" /></li></s:if>
						        <s:if test="classifieds.image2!=null && !classifieds.image2.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image2"/>" alt="<s:property value="classifieds.title"/> Thumb Image 2" class="thumb" /></li></s:if>
						        <s:if test="classifieds.image3!=null && !classifieds.image3.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image3"/>" alt="<s:property value="classifieds.title"/> Thumb Image 3" class="thumb" /></li></s:if>
						        <s:if test="classifieds.image4!=null && !classifieds.image4.equals('')"><li><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image4"/>" alt="<s:property value="classifieds.title"/> Thumb Image 4" class="thumb" /></li></s:if>
						      </ul>
						    </div>
						  </div>
						</div>
	                  </div>
	                  <div class="clearfix"></div>
	                  <h3 class="sub-heading">Detail Description : </h3>
	                  <div><s:property value="classifieds.description" escapeHtml="false"/></div>
	                  <p><i>When you call, don't forget to mention that you found this ad on stldesis.com</i></p>
	                  <h3 class="sub-heading">Contact Details : </h3>
	                  <h3 class="col-sm-6"><span>Name : </span> <s:property value="classifieds.name"/></h3>
	                  <h3 class="col-sm-6"><span>Email : </span> <s:property value="classifieds.emailId"/></h3>
	                  <h3 class="col-sm-6"><span>Phone : </span> <s:property value="classifieds.phone"/></h3>
	                  <h3 class="col-sm-6"><span>Address : </span> <s:property value="classifieds.address"/></h3>
	                <hr>
                  <h3 class="sub-heading">Safety Tips for Buyers</h3>
                    <ul class="nav nav-tabs">
					    <li class="active"><a data-toggle="tab" href="#home">Meet seller at a safe location</a></li>
					    <li><a data-toggle="tab" href="#menu1">Check the item before you buy</a></li>
					    <li><a data-toggle="tab" href="#menu2">Pay only after collecting item</a></li>
					</ul>
					<div class="tab-content">
					    <div id="home" class="tab-pane fade in active">
					      <h3>Meet seller at a safe location:</h3>
					      <ul>
					      <li>We highly recommend that you meet the buyer in person</li>
					      <li>Meet the seller at a public place before buying the product.</li>
					      <li>Meet the buyer in person in a public place like a café before closing the deal</li>
					      <li>Avoid meeting the buyer in a secured area or invite strangers into your home.</li>
					      <li>Be especially careful when buying/selling high value items.</li>
					      <li>Tell a friend or family member where you're going and consider having a friend accompany you.</li>
					      <li>Take your cell phone along with you if you have one and request photo identity of the buyer.</li>
					     </ul>
					    </div>
					    <div id="menu1" class="tab-pane fade">
					     <h3>Check the item before you buy:</h3>
					      <ul>
					      <li>We highly recommend that you meet the buyer in person</li>
					      <li>Meet the seller at a public place before buying the product.</li>
					      <li>Meet the buyer in person in a public place like a café before closing the deal</li>
					      <li>Avoid meeting the buyer in a secured area or invite strangers into your home.</li>
					      <li>Be especially careful when buying/selling high value items.</li>
					      <li>Tell a friend or family member where you're going and consider having a friend accompany you.</li>
					      <li>Take your cell phone along with you if you have one and request photo identity of the buyer.</li>
					     </ul>
					    </div>
					    <div id="menu2" class="tab-pane fade">
					      <h3>Pay only:</h3>
					      <ul>
					      <li>We highly recommend that you meet the buyer in person</li>
					      <li>Meet the seller at a public place before buying the product.</li>
					      <li>Meet the buyer in person in a public place like a café before closing the deal</li>
					      <li>Avoid meeting the buyer in a secured area or invite strangers into your home.</li>
					      <li>Be especially careful when buying/selling high value items.</li>
					      <li>Tell a friend or family member where you're going and consider having a friend accompany you.</li>
					      <li>Take your cell phone along with you if you have one and request photo identity of the buyer.</li>
					     </ul>
					    </div>
					</div>
	             </div>
          		 </s:if>
              </div>
        </div>
      </div>
<%@include file="includes/footer.jsp"%>