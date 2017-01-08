<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin Index | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
</head>
<body>
<%@include file="../includes/adminHeader.jsp"%>
<div class="container-fluid">
  <div class="dashboard-wrapper">
  <%@include file="../includes/adminNavigation.jsp"%>
	<div class="main-container">
	  <div class="row-fluid">
        <div class="span12">
          <div class="widget">
            <div class="widget-header">
              <div class="title"> stldesis Classifides Overview </div>
            </div>
            <div class="widget-body" align="center">
              <div class="quick-action-btn span4 admin-home-block">
                <h4><i class="fa fa-home"></i> Accomodation</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeAccomodation" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingAccomodation" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block">
                <h4><i class="fa fa-car"></i> Auto</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeAuto" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingAuto" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block">
                <h4> <i class="fa fa-cutlery"></i> Catering</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeCatering" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingCatering" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block no-margin">
                <h4><i class="fa fa-child"></i> Child Care</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeChildCare" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingChildCare" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block ">
                <h4><i class="fa fa-money"></i> For Sale</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeForSale" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingForSale" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block">
                <h4><i class="fa fa-briefcase"></i> Jobs</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeJobs" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingJobs" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block no-margin">
                <h4><i class="fa fa-female"></i> Ladies Corner</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeLadiesCorner" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingLadiesCorner" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block">
                <h4> <i class="fa fa-plane"></i> Travel Companion</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeTravelCompanion" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingTravelCompanion" /></a></div>
                </div>
              </div>
              <div class="quick-action-btn span4 admin-home-block">
                <h4><i class="fa fa-adn"></i> Others</h4>
                <div class="span6 no-margin">
                  <p>Active Classifides</p>
                  <div class="label label-success"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="activeOthers" /></a></div>
                </div>
                <div class="span6 ">
                  <p>Pending Classifides</p>
                  <div class="label label-important"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>adminAllClassifieds"><s:property value="pendingOthers" /></a></div>
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../includes/adminFooter.jsp"%>
</body>
</html>