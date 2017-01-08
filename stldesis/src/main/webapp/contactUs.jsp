<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Contact Us | STL DESIS</title>
<meta name="keywords" content="Accomodation STL DESIS">
<meta name="description" content="Accomodation STL DESIS" />
<%@include file="includes/links.jsp"%>
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 contact-detail">
          <ol class="breadcrumb">
            <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>">Home</a></li>
            <li class="active">Contact Us</li>
          </ol>
          <div class="col-sm-12 single-posting">
            <div class="col-sm-12 post-details">
              <h2>Contact us</h2>
              <div class="contact-block">
                <form action="saveContactus"  method="post" id="contactusForm" name="contactusForm" enctype="multipart/form-data" onsubmit="return false;">
                 <fieldset class="form-group">
                    <label for="">Subject</label>
                  <select class="form-control" id="subject" name="subject">
                    <option>Select Subject</option>
                    <option value="Report Fraud">Report Fraud</option>
                    <option value="Partnership and Business Development">Partnership and Business Development</option>
                    <option value="Advertising Opportunities">Advertising Opportunities</option>
                    <option value="Legal Issues">Legal Issues</option>
                    <option value="Submit a Feedback to stldesis">Submit a Feedback to stldesis</option>
                    <option value="Others">Others</option>
                  </select>
                  <script type="text/javascript">
	                  $(document).ready(function(){
	                	    $('#subject').on('change', function() {if(this.value=='Report Fraud'||this.value=='Partnership and Business Development')
	                	      {$("#adIdLink").show();}else{$("#adIdLink").hide();}});});
                  </script>
                  </fieldset>
                  <fieldset class="form-group">
                    <label for="">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" onkeypress="return keyRestrict(event, 'charspace');"/>
                  </fieldset>
                  <fieldset class="form-group">
                    <label for="exampleInputEmail1">Email Address</label>
                    <input type="email" class="form-control" id="emailId" name="emailId" placeholder="Enter email" onkeypress="return keyRestrict(event, 'emailchar');">
                    <small class="text-muted">We'll never share your email with anyone else.</small>
                  </fieldset>
                  <fieldset class="form-group">
                    <label for="exampleInputEmail1">Phone No</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter Phone No" onkeypress="return keyRestrict(event, 'phone');">
                    <small class="text-muted">We'll never share your Phone no with anyone else.</small>
                   </fieldset>
                  <fieldset class="form-group" id="adIdLink">
                    <label for="exampleInputEmail1">Ad ID/ Ad link</label>
                    <input type="text" class="form-control" id="adIdLink" name="adIdLink" placeholder="Enter Ad ID/ Ad link">
                   </fieldset>
                   <fieldset class="form-group">
                    <label for="exampleInputEmail1">Add Attachment &nbsp; <small>(If any)</small></label>
                    <input type="file" name="image" id="image" class="form-control">
                   </fieldset>
                  <fieldset class="form-group">
                    <label for="message">Your Message Here</label>
                    <textarea class="form-control" id="message" name="message" rows="6" placeholder="Enter Your Message"></textarea>
                  </fieldset>
                  <button type="submit" class="btn btn-primary" id="contactusFormButton" name="contactusFormButton">Submit</button>
                </form>
              </div>
              <div class="contact-block">
              <h2>Stldesis Contact Details</h2>
                <h3><span>Phone :</span> 9999999999</h3>
                <h3><span>Email :</span> contact@stldesis.com</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
<%@include file="includes/footer.jsp"%>