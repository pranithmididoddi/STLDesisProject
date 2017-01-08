<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
        </div>
    </div>
    <div class="col-sm-1 right-add">
    	<s:if test="homePageRightAdList!=null && homePageRightAdList.size>0">
		<s:iterator value="homePageRightAdList" status="status">
			<a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>"/></a>
    	</s:iterator>
    	</s:if>
	</div>
    <div class="clearfix"></div>
</div>
<script type='text/javascript' src='<%=properties.getProperty("CONTEXT_PATH").toString() %>js/common.js'></script>
<div class="alert alert-success-empty fade" id="loading">
	<img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/loading-icon.gif" alt="loading" class="loading-icon" />
</div>
<div class="alert alert-success-empty fade" id="success">
	<div class="alert-text">
  	<button type="button" class="close" onclick="$('#sMsg').html(''); $('#success').hide()">×</button>
  	<div id="sMsg"></div>
  	</div>
</div>

<div class="alert alert-danger-empty fade" id="failure">
	<div class="alert-text">
  	<button type="button" class="close" onclick="$('#eMsg').html(''); $('#failure').hide()">×</button>
  	<div id="eMsg"></div>
  	</div>
</div>
<s:if test="errorMsg!=null && !errorMsg.equals('')">
<script type="text/javascript">showError('<s:property value="errorMsg"/>');</script>
</s:if> 
<s:if test="msg!=null && !msg.equals('')">
<script type="text/javascript">showSucess('<s:property value="msg"/>');</script>
</s:if>
<a href="#" title="Go to Top" class="back-to-top"> <span class="fa fa-angle-up"></span> </a>
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
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/fade-slide.js"></script> 
<script>
$(document).ready(function(){
	$('#fadeMe').EzFade({height: '100'});
});
</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js" async></script>
<script type="text/javascript">jQuery(document).ready(function() {var offset = 220; var duration = 500;jQuery(window).scroll(function() {if (jQuery(this).scrollTop() > offset) {jQuery('.back-to-top').fadeIn(duration);} else {jQuery('.back-to-top').fadeOut(duration);}});jQuery('.back-to-top').click(function(event) {event.preventDefault();jQuery('html, body').animate({scrollTop: 0}, duration);return false;})});</script>
</body>
</html>