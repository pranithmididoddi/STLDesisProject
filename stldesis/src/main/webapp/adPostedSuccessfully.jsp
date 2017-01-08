<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Ad Posted Successfully | STL DESIS</title>
<meta name="keywords" content="Accomodation STL DESIS">
<meta name="description" content="Accomodation STL DESIS" />
<%@ include file="includes/links.jsp" %>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor.js"></script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor/sample.js"></script>
</head>
<body>
<div class="wrapper">
  <%@ include file="includes/header.jsp" %>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 contact-detail post-classified">
          <div class="col-sm-12 single-posting">
            <div class="col-sm-12 post-details">
              <div class="ad-submit-msg">
                <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/check.png" alt="Successfully Submitted" class="img-responsive"/>
                <h2>Your Ad has been Submitted Successfully !</h2>
                <p>We have submitted your Ad request to the concerned department.Once it is through with our quality check process, it will be published in our website. As soon as it is published on our site, you will get a notification to your email. </p>
                <h4>Thank you for submitting your Ad to stldesis.com </h4>
              </div>
            </div>
          </div>
        </div>
      </div>
<script>initSample();</script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/fade-slide.js"></script> 
<script>
$(document).ready(function(){ $('#fadeMe').EzFade({height: '100'}); });
</script>
<%@ include file="includes/footer.jsp" %>