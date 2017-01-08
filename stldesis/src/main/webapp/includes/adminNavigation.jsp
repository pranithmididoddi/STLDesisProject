<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="main-nav" class="hidden-phone hidden-tablet">
	
	<ul>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminHome" <s:if test="urlPage.equals('adminHome')">class="selected"</s:if> ><i class="fa fa-home"></i>Home</a> </li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds" <s:if test="urlPage.equals('adminAllClassifieds')">class="selected"</s:if>> <i class="fa fa-adn"></i>Classifides</a></li>
		<li> <a href="#" <s:if test="urlPage.equals('adminYellowPagesList') || urlPage.equals('adminEvents') || urlPage.equals('adminOffers') || urlPage.equals('adminPlacesToVisit') || urlPage.equals('adminMovies') || urlPage.equals('adminInterviews') || urlPage.equals('adminFaq')">class="selected"</s:if>> <i class="fa fa-pencil"></i> Admin Add Pages </a>
			<ul>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminYellowPages" > Yellow Pages </a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminEventsPages"> Events</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminOffersPage" >Offers</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminPlacesToVisitPage" >Places to visit</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminMoviesListPage" >Movies</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminInterviewsListPage" >Interviews</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminFAQListPage" >FAQ</a> </li>
			</ul>
		</li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAdsListPage" <s:if test="urlPage.equals('adminAds')">class="selected"</s:if>><i class="fa fa-bullhorn"></i> Ads </a></li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllCategoriesPage" <s:if test="urlPage.equals('adminAllCategories')">class="selected"</s:if>><i class="fa fa-bars"></i> Category </a></li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>contactusAdmin" <s:if test="urlPage.equals('contactusAdmin')">class="selected"</s:if>><i class="fa fa-envelope"></i> Contact </a></li>
		<s:if test="user.designation==1">
		<li> <a href="#" <s:if test="urlPage.equals('adminsList') || urlPage.equals('adminAccountDetails')">class="selected"</s:if>> <i class="fa fa-user"></i> Super Admin </a>
			<ul>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>listOfAdmins"> List of Admins </a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAccountDetails"> Account Details</a> </li>
			</ul>
		</li>
		</s:if>
		<s:else>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAccountDetails" <s:if test="urlPage.equals('adminAccountDetails')">class="selected"</s:if>><i class="fa fa-user"></i> Admin </a></li>
		</s:else>
	</ul>
	
<div class="clearfix"></div>
</div>
<div class="navbar hidden-desktop">
	<div class="navbar-inner">
		<div class="container"> <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar" > <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
			<div class="nav-collapse collapse navbar-responsive-collapse">
				<ul class="nav">
					<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminHome" <s:if test="urlPage.equals('adminHome')">class="selected"</s:if> >Home</a> </li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds" <s:if test="urlPage.equals('adminAllClassifieds')">class="selected"</s:if>> Classifides</a></li>
		<li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#" <s:if test="urlPage.equals('adminYellowPagesList') || urlPage.equals('adminEvents') || urlPage.equals('adminOffers') || urlPage.equals('adminPlacesToVisit') || urlPage.equals('adminMovies') || urlPage.equals('adminInterviews') || urlPage.equals('adminFaq')">class="selected"</s:if>> Admin Add Pages <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminYellowPages" > Yellow Pages </a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminEventsPages"> Events</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminOffersPage" >Offers</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminPlacesToVisitPage" >Places to visit</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminMoviesListPage" >Movies</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminInterviewsListPage" >Interviews</a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminFAQListPage" >FAQ</a> </li>
			</ul>
		</li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAdsListPage" <s:if test="urlPage.equals('adminAds')">class="selected"</s:if>>Ads </a></li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllCategoriesPage" <s:if test="urlPage.equals('adminAllCategories')">class="selected"</s:if>> Category </a></li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>contactusAdmin" <s:if test="urlPage.equals('contactusAdmin')">class="selected"</s:if>> Contact </a></li>
		<s:if test="user.designation==1">
		<li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#" <s:if test="urlPage.equals('adminsList') || urlPage.equals('adminAccountDetails')">class="selected"</s:if>>Super Admin <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>listOfAdmins"> List of Admins </a> </li>
				<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAccountDetails"> Account Details</a> </li>
			</ul>
		</li>
		</s:if>
		<s:else>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAccountDetails" <s:if test="urlPage.equals('adminAccountDetails')">class="selected"</s:if>> Admin </a></li>
		</s:else>
		<li> <a href="#">View Website</a> </li>
		<li> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>logout">Logout</a> </li>
	</ul>
</div>
</div>
</div>
</div>