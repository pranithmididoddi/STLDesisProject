<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<footer>
  <p>&copy; 2016 Copyright stldesis.com All right reserved</p>
  <script type='text/javascript' src='<%=properties.getProperty("CONTEXT_PATH").toString() %>js/common.js'></script>
  <script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/jquery.datetimepicker.full.js"></script>
<script>
	$('.date-picker').datetimepicker({
	timepicker:false,
	format:'d/m/Y',
	formatDate:'d/m/Y'
});
</script>
</footer>
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
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>
