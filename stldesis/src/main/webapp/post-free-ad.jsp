<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Post Free Ad | STL DESIS</title>
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
              <h2>Post Free Classified Ad</h2>
              <div class="contact-block">
                <form id="postFreeAdForm" name="postFreeAdForm" method="post" enctype="multipart/form-data" action="uploadPostFreeAd" onsubmit="return false;">
                  <fieldset class="form-group">
                    <label for="category">Select Classifides Category</label>
                    <select class="form-control" id="categoryId" name="categoryId">
                      <option value="">Select Classifides Category</option>
                      <s:if test="categoryList!=null">
                      <s:iterator value="categoryList">
                      <option value="<s:property value="categoryId"/>"><s:property value="categoryName"/></option>
                      </s:iterator>
                      </s:if>
                    </select>
                  </fieldset>
                  <fieldset class="form-group">
                    <label for="title">Ad Title</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Add Title" onkeypress="return keyRestrict(event, 'charspace');"/>
                  </fieldset>
                  <fieldset class="form-group">
                    <label for="addimage">Ad Images</label>
                  </fieldset>
                  <fieldset class="form-group col-sm-6 no-padding">
                    <input type="file" class="form-control" name="image1" id="image1" />
                  </fieldset>
                  <fieldset class="form-group col-sm-6">
                    <input type="file" class="form-control" name="image2" id="image2" />
                  </fieldset>
                  <div class="clearfix"></div>
                  <fieldset class="form-group col-sm-6 no-padding">
                    <input type="file" class="form-control" name="image3" id="image3" />
                  </fieldset>
                  <fieldset class="form-group col-sm-6">
                    <input type="file" class="form-control" name="image4" id="image4" />
                  </fieldset>
                  <div class="clearfix"></div>
                  <fieldset class="form-group">
                    <label for="description">Description</label>
	        		<input type="hidden" id="description" name="description" value="" >
                    <div id="editor">
                        <p>Description</p>
                    </div>
                  </fieldset>
                  <fieldset class="form-group col-sm-6 no-padding">
                    <label for="price">Price</label>
                    <input type="text" class="form-control" id="price" name="price" placeholder="price" onkeypress="return keyRestrict(event, 'dotint');"/>
                  </fieldset>
                  <div class="clearfix"></div>
                  <h3><span>Contact Details</span></h3>
                  <fieldset class="form-group col-sm-6 no-padding">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" onkeypress="return keyRestrict(event, 'char');"/>
                  </fieldset>
                  <fieldset class="form-group col-sm-6">
                    <label for="phone">Phone</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone" onkeypress="return keyRestrict(event, 'phone');"/>
                  </fieldset>
                  <fieldset class="form-group col-sm-6 no-padding">
                    <label for="email">Email</label>
                    <div class="input-group">
                      <input type="email" id="emailId" name="emailId" class="form-control" placeholder="Email" onkeypress="return keyRestrict(event, 'emailchar');"/>
                      <span class="input-group-btn">
                      <button class="btn btn-default" type="button" id="verifyEmail" name="verifyEmail">Verify</button>
                      </span> </div>
                    <small class="text-muted">Get verification code by submitting your mail id.</small>
                  </fieldset>
                  <fieldset class="form-group col-sm-6 mbottom40">
                    <label for="code">Verification Code</label>
                    <input type="text" class="form-control" id="securitycode" name="securitycode" placeholder="Enter the code you received" />
                  </fieldset>
                  <div class="clearfix"></div>
                  <fieldset class="form-group">
                    <label for="description">Address</label>
                    <textarea class="form-control" id="address" name="address" rows="5"></textarea>
                  </fieldset>
                  <div class="clearfix"></div>
                  <button type="button" id="postFreeAdButton" name="postFreeAdButton" class="btn btn-primary" >Submit</button>
                </form>
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