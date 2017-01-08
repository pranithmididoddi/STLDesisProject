$ = jQuery.noConflict(); var http = getHTTPObject(); var calDiv = '';
/* Ajax Functionality */
function getHTTPObject(){ var xmlhttp; if(window.XMLHttpRequest){ xmlhttp = new XMLHttpRequest(); }else if(window.ActiveXObject){ xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); if (!xmlhttp){ xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); } } return xmlhttp; }
var testresults;
function checkemail(emailCheck){ var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; if (filter.test(emailCheck)){ testresults=true; }else{ testresults=false; } return (testresults); }
//Trim Function 
function trim(text) { return (text || "").replace(/^\s+|\s+$/g, "" ); }
function keyRestrict(e, choice){ validchars = ''; var key='', keychar='';
	if(choice == 'int'){ validchars = '1234567890'; }else if(choice == 'dotint'){ validchars = '1234567890.$,'; }else if(choice == 'latlong'){ validchars = '1234567890.-'; }
	else if(choice == 'phone'){ validchars = '1234567890. -_()+,'; }else if(choice == 'char'){ validchars = 'abcdefghijklmnopqrstuvwxyz, '; }
	else if(choice == 'charspe'){ validchars = 'abcdefghijklmnopqrstuvwxyz_.'; }else if(choice == 'emailchar'){ validchars = 'abcdefghijklmnopqrstuvwxyz_-.1234567890@'; }
	else if(choice == 'charnum'){ validchars = 'abcdefghijklmnopqrstuvwxyz1234567890'; }else if(choice == 'passchar'){ validchars = 'abcdefghijklmnopqrstuvwxyz_1234567890.'; }
	else if(choice == 'charspace'){ validchars = 'abcdefghijklmnopqrstuvwxyz1234567890 '; }else if(choice == 'vchar'){ validchars = 'abcdefghijklmnopqrstuvwxyz1234567890 ._-@,#|:;'; }
	key = getKeyCode(e); if(key == null){ return true; } keychar = String.fromCharCode(key); keychar = keychar.toLowerCase(); validchars = validchars.toLowerCase();
	if(validchars.indexOf(keychar) != -1){	return true; } if( key==null || key==0 || key==8 || key==9 || key==13 || key==27 ){ return true; } return false; }
function getKeyCode(e){ if (window.event){ return window.event.keyCode; }else if(e){ return e.which; }else{	return null; } }

$(document).ready(function(){
	$('#postFreeAdButton').click(function(){ postFreeAd(); });
	$('#verifyEmail').click(function(){ verifyEmail(); });
	$('#contactusFormButton').click(function(){ contactus(); });
	$('#adminLoginButton').click(function(){ adminLogin(); });
	$('#adminContactusSearchButton').click(function(){ searchAdminContactus(); });
	$('#careerAdminSearchButton').click(function(){ searchAdminCareers(); });
	$('#saveYellowPageButton').click(function(){ saveYellowPage(); });
	$('#updateYellowPageButton').click(function(){ updateYellowPage(); });
	$('#saveAdminEventsButton').click(function(){ saveEvents(); });
	$('#updateEventsButton').click(function(){ updateEvents(); });
	$('#saveOffersButton').click(function(){ saveOffers(); });
	$('#updateOffersButton').click(function(){ updateOffers(); });
	$('#savePlacesToVisitButton').click(function(){ savePlacesToVisit(); });
	$('#updatePlacesToVisitButton').click(function(){ updatePlacesToVisit(); });
	$('#saveMoviesFormButton').click(function(){ saveMovies(); });
	$('#updateMoviesFormButton').click(function(){ updateMovies(); });
	$('#saveInterviewsButton').click(function(){ saveInterviews(); });
	$('#updateInterviewsButton').click(function(){ updateInterviews(); });
	$('#saveFAQButton').click(function(){ saveFAQs(); });
	$('#updateFAQButton').click(function(){ updateFAQs(); });
	$('#saveAdsButton').click(function(){ saveAds(); });
	$('#updateAdsButton').click(function(){ updateAds(); });
	$('#saveCategoriesButton').click(function(){ saveCategories(); });
	$('#updateCategoriesButton').click(function(){ updateCategories(); });
	$('#saveAdminButton').click(function(){ saveAdmin(); });
	$('#updateAdminButton').click(function(){ updateAdmin(); });
	$('#updateClassifiedsButton').click(function(){ updateClassifieds(); });
	$('#searchAdminsFormButton').click(function(){ searchListOfAdmins(); });
	
	$('.close').click(function(){ $(".notification-box").hide(); $('#eMsg').html(''); $('#sMsg').html(''); });
	$('#resumeFile').on('change', function() { myfile= $( this ).val(); var ext = myfile.split('.').pop(); if(ext!="docx"){ showError('Please provide Word Document with ".docx" Extension'); $('#resume').val('');} });
	
	$('#adminLoginForm').keydown(function(e){ var key = e.which; if(key == 13){ adminLogin(); return false; } });
	$('#careerFormButton').keydown(function(e){ var key = e.which; if(key == 13){ careerForm(); return false; } });
	$('#contactusFormButton').keydown(function(e){ var key = e.which; if(key == 13){ contactus(); return false; } });
	
});

function verifyEmail(){
	try{
		var errMsg = ''; var emailId = trim($('#emailId').val());
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{
			$.ajax({url:'sendVerificationEmail?emailId='+emailId,context:document.body}).done(function(data){data=trim(data);if(data.indexOf("Email sent")!=-1){showSucess(data);}else{showError(data);} }).fail(function(data){showError(data);});
		}
	}catch(e){ return false; }
}

function validateCaptcha(){
	if($('#loginName').val()!='undefined' && $('#loginName').val()!=''){
		var capt = $('#recaptcha_response_field').val();
		if(capt!='undefined' && capt!=''){
			url = 'ajaxfiles/validatecaptcha.jsp?id=captcha&recaptcha_response_field='+capt+'&recaptcha_challenge_field='+$('#recaptcha_challenge_field').val();
			http.open("GET", url, true); http.onreadystatechange = captchaServerResponse; http.send(null);
		}else{ showError('<li>Please Insert text in Captha Field !!</li>'); }
	}else{ showError('<li>Please Provide Email-Id !!</li>'); }
}

function captchaServerResponse(){
	if(http.readyState == 4 && http.status == 200){	 	
		var results = trim(http.responseText);
		if(results == "1" || results == 1){ document.forgotpasswordform.submit(); }
		else{ showError('<li>Text Entered Does Not Match with Captcha Image</li>'); Recaptcha.reload(); }			
	}
}

function postFreeAd(){
	try{
		var errMsg = ''; var categoryId = trim($('#categoryId').val()); var title = trim($('#title').val());
		var image1 = trim($('#image1').val()); var image2 = trim($('#image2').val());
		var image3 = trim($('#image3').val()); var image4 = trim($('#image4').val());
		var price = trim($('#price').val()); var name = trim($('#name').val()); var phone = trim($('#phone').val());
		var emailId = trim($('#emailId').val()); var securitycode = trim($('#securitycode').val());
		var address = trim($('#address').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(categoryId=='undefined' || categoryId==''){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please provide Title !!\n</li>'; }
		if((image1=='undefined' || image1=='') && (image2=='undefined' || image2=='') && (image3=='undefined' || image3=='') && (image4=='undefined' || image4=='') ){ errMsg += '<li>Please Select Atleast One Image !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(price=='undefined' || price==''){ errMsg += '<li>Please Provide Price !!\n</li>'; }
		if(name=='undefined' || name==''){ errMsg += '<li>Please provide Name !!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(securitycode=='undefined' || securitycode==''){ errMsg += '<li>Please provide Security Code !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.postFreeAdForm.submit(); }
	}catch(e){ return false; }
}

function updateClassifieds(){
	try{
		var errMsg = ''; var categoryId = trim($('#categoryId').val()); var title = trim($('#title').val());
		var price = trim($('#price').val()); var name = trim($('#name').val()); var phone = trim($('#phone').val());
		var emailId = trim($('#emailId').val()); var id = trim($('#id').val());
		var address = trim($('#address').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(categoryId=='undefined' || categoryId==''){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please provide Title !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(price=='undefined' || price==''){ errMsg += '<li>Please Provide Price !!\n</li>'; }
		if(name=='undefined' || name==''){ errMsg += '<li>Please provide Name !!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateClassifiedsForm.submit(); }
	}catch(e){ return false; }
}

function adminLogin(){
	try{
		var errMsg = ''; var loginName = trim($('#loginName').val()); var password = trim($('#password').val());
		if(loginName=='undefined' || loginName=='' || !checkemail(loginName)){ errMsg += '<li>Please provide Your User Name to Login!!\n</li>'; }
		if(password=='undefined' || password==''){ errMsg += '<li>Please provide Password !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.loginForm.submit(); }
	}catch(e){ return false; }
}

function resetPw(){
	var loginName = trim($('#loginName').val());
	var securitycode = trim($('#securitycode').val());
	var password = trim($('#password').val());
	var retypePassword = trim($('#retypePassword').val());
	var message = '';
	if(loginName=='undefined' || loginName=='' || !checkemail(loginName)){ message += '<li>Please provide Login Name !!\n</li>'; }
	if(securitycode=='undefined' || securitycode==''){ message += '<li>Please provide Security Code !!\n</li>'; }
	if(password=='undefined' || password==''){ message += '<li>Please provide Password !!\n</li>'; }
	if(retypePassword=='undefined' || retypePassword==''){ message += '<li>Please provide Retype Password !!\n</li>'; }
	if(message!=''){ showError(message); }
	else{
		if(password!=retypePassword){ showError('<li>Retype Password does not Match with the Password !!</li>'); }
		else{ document.passwordresetform.submit(); }
	}
}

function changePasswd(){
	var currentPassword = trim($('#currentPassword').val()); var password = trim($('#password').val());
	var retypeNewPassword = trim($('#retypeNewPassword').val());
	var message = '';
	if(currentPassword=='undefined' || currentPassword==''){ message += '<li>Please Provide Yor Current Password !!\n</li>'; }
	if(password=='undefined' || password==''){ message += '<li>Please Provide New Password !!\n</li>'; }
	if(retypeNewPassword=='undefined' || retypeNewPassword==''){ message += '<li>Please Retype Your New Password !!\n</li>'; }
	if(message!=''){ showError(message); }
	else{
		if(password!=retypeNewPassword){ showError('<li>Retype Password does not Match with the Password !!</li>'); }
		else{ document.changePasswordForm.submit(); }
	}
}

function contactus(){
	try{
		var errMsg = ''; 
		var name = trim($('#name').val()); var emailId = trim($('#emailId').val()); var phone = trim($('#phone').val());
		var subject = trim($('#subject').val()); var message = trim($('#message').val());
		if(name=='undefined' || name==''){ errMsg += '<li>Please provide Name !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id !!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone Number !!\n</li>'; }
		if(subject=='undefined' || subject=='Select Subject'){ errMsg += '<li>Choose your Subject !!\n</li>'; }
		if(message=='undefined' || message==''){ errMsg += '<li>Please provide Message !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }
		else{ document.contactusForm.submit(); }
	}catch(e){ return false; }
}

function callAjx(urlNam,id){
	if(urlNam=='vAdminContactUs'){ $('#loading').show();		
		$.ajax({url:'viewContactusAdmin?contactId='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){showError(data);});
	}else if(urlNam=='vClassifieds'){ $('#loading').show();
		$.ajax({url:'viewClassifieds?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vClassifiedsActive'){ $('#loading').show();
		$.ajax({url:'retriveClassifiedToActive?id='+id,context:document.body}).done(function(data){$('#active').html(data);$('#loading').hide();$('#active').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vClassifiedsInActive'){ $('#loading').show();
		$.ajax({url:'retriveClassifiedToInActive?id='+id,context:document.body}).done(function(data){$('#inactive').html(data);$('#loading').hide();$('#inactive').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vYellowPages'){ $('#loading').show();
		$.ajax({url:'viewYellowPages?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vAdminEvents'){ $('#loading').show();
		$.ajax({url:'viewAdminEvents?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vOffers'){ $('#loading').show();
		$.ajax({url:'viewAdminOffers?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vPlacesToVisit'){ $('#loading').show();
		$.ajax({url:'viewAdminPlacesToVisit?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vMovies'){ $('#loading').show();
		$.ajax({url:'viewAdminMovies?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vInterviews'){ $('#loading').show();
		$.ajax({url:'viewAdminInterviews?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vFAQ'){ $('#loading').show();
		$.ajax({url:'viewAdminFAQs?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vAd'){ $('#loading').show();
		$.ajax({url:'viewAdminAds?id='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}else if(urlNam=='vCategories'){ $('#loading').show();
		$.ajax({url:'viewAdminAllCategories?categoryId='+id,context:document.body}).done(function(data){$('#view').html(data);$('#loading').hide();$('#view').show();}).fail(function(data){$('#loading').hide();showError(data);});
	}
}

function aDelete(urlNam,id){
	if(urlNam=='dAdminContactUs'){
		$.ajax({ url: 'dContactusAdmin?contactId='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dYellowPages'){
		$.ajax({ url: 'dYellowPagesAdmin?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dEvents'){
		$.ajax({ url: 'dAdminEvents?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dClassifieds'){
		$.ajax({ url: 'retriveClassifiedForDeletion?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dOffers'){
		$.ajax({ url: 'dAdminOffers?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dPlacesToVisit'){
		$.ajax({ url: 'dAdminPlacesToVisit?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dMovies'){
		$.ajax({ url: 'dAdminMovies?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dInterviews'){
		$.ajax({ url: 'dAdminInterviews?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dFAQ'){
		$.ajax({ url: 'dAdminFAQs?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dAd'){
		$.ajax({ url: 'dAdminAds?id='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dCategories'){
		$.ajax({ url: 'dAdminCategories?categoryId='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}else if(urlNam=='dAdmins'){
		$.ajax({ url: 'dListOfAdmins?userId='+id, context: document.body }).done(function(data){ $('#delete').html(data); $('#delete').addClass('in'); }).fail(function(data){ showError(data); });
	}
}

function activateClassifieds(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Contact Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.activateClassifiedForm.submit(); }
}

function inActivateClassifieds(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Contact Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.inactivateClassifiedForm.submit(); }
}


function deleteAdminContactus(){
	var errMsg = ''; var contactId = trim($('#contactId').val()); 
	if(contactId=='undefined' || contactId==''){ errMsg += '<li>Please Provide Contact Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteContactusForm.submit(); }
}

function deleteAdminClassifieds(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Contact Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteClassifiedForm.submit(); }
}

function saveYellowPage(){
	try{
		var errMsg = ''; var categoryId = trim($('#categoryId').val()); var title = trim($('#title').val());
		var contactPerson = trim($('#contactPerson').val()); var phone = trim($('#phone').val());
		var emailId = trim($('#emailId').val()); var address = trim($('#address').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please provide Title !!\n</li>'; }
		if(contactPerson=='undefined' || contactPerson==''){ errMsg += '<li>Please Provide Contact Person !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveYellowPageForm.submit(); }
	}catch(e){ return false; }
}

function updateYellowPage(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var categoryId = trim($('#categoryId').val()); var title = trim($('#title').val());
		var contactPerson = trim($('#contactPerson').val()); var phone = trim($('#phone').val());
		var emailId = trim($('#emailId').val());
		var address = trim($('#address').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id=='' || id=='0'){ errMsg += '<li>Please Provide Id !!\n</li>'; }
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please provide Title !!\n</li>'; }
		if(contactPerson=='undefined' || contactPerson==''){ errMsg += '<li>Please Provide Contact Person !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateYellowPageForm.submit(); }
	}catch(e){ return false; }
}

function saveEvents(){
	try{
		var errMsg = ''; var title = trim($('#title').val());
		var name = trim($('#name').val()); var phone = trim($('#phone').val());	var emailId = trim($('#emailId').val());
		var address = trim($('#address').val());
		var fromDate = $("[name='dateFrom']").datetimepicker('getDate').val(); var toDate = $("[name='dateTo']").datetimepicker('getDate').val();
		var curDate = new Date();
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(title=='undefined' || title==''){ errMsg += '<li>Please provide Title !!\n</li>'; }
		if(name=='undefined' || name==''){ errMsg += '<li>Please Provide Contact Person\'s Name !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		
		if(fromDate=='undefined' || fromDate==''){ errMsg += '<li>Event Start Date shouldn\'t be Empty!!\n</li>'; }
		if(toDate=='undefined' || toDate==''){ errMsg += '<li>Event End Date shouldn\'t be Empty!!\n</li>'; }
		var fdate = new Date(fromDate);  var tdate = new Date(toDate);
		if(curDate.getTime() > fdate.getTime()){ errMsg = '<p>Event \'From Date\' Should Not be Less Than \'Current Date\' !!</p>';}
		if(fdate.getTime() >= tdate.getTime()){ errMsg = '<p>Event \'From Date\' Should Not be Less Than Or Equal to Event \'To Date\' !!</p>';}
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveAdminEventsForm.submit(); }
	}catch(e){ return false; }
}

function updateEvents(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var title = trim($('#title').val());
		var name = trim($('#name').val()); var phone = trim($('#phone').val());	var emailId = trim($('#emailId').val());
		var address = trim($('#address').val()); var id = trim($('#id').val());
		var fromDate = $("[name='dateFrom']").datetimepicker('getDate').val(); var toDate = $("[name='dateTo']").datetimepicker('getDate').val();
		var curDate = new Date();
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please provide Title !!\n</li>'; }
		if(name=='undefined' || name==''){ errMsg += '<li>Please Provide Contact Person\'s Name !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(fromDate=='undefined' || fromDate==''){ errMsg += '<li>Event Start Date shouldn\'t be Empty!!\n</li>'; }
		if(toDate=='undefined' || toDate==''){ errMsg += '<li>Event End Date shouldn\'t be Empty!!\n</li>'; }
		var fdate = new Date(fromDate);  var tdate = new Date(toDate);
		if(curDate.getTime() > fdate.getTime()){ errMsg = '<p>Event \'From Date\' Should Not be Less Than \'Current Date\' !!</p>';}
		if(fdate.getTime() >= tdate.getTime()){ errMsg = '<p>Event \'From Date\' Should Not be Less Than Or Equal to Event \'To Date\' !!</p>';}
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateEventsForm.submit(); }
	}catch(e){ return false; }
}

function saveOffers(){
	try{
		var errMsg = ''; var categoryId = trim($('#categoryId').val()); var url = trim($('#url').val());
		var linkUrl = trim($('#linkUrl').val()); var image = trim($('#image').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(url=='undefined' || url==''){ errMsg += '<li>Please provide URL !!\n</li>'; }
		if(linkUrl=='undefined' || linkUrl==''){ errMsg += '<li>Please Provide Link URL !!\n</li>'; }
		if((image=='undefined' || image=='') && (description=='undefined' || description=='' || description=='<p>Description<\/p>')){ errMsg += '<li>Please provide an Image / Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveOffersForm.submit(); }
	}catch(e){ return false; }
}

function updateOffers(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var categoryId = trim($('#categoryId').val()); var url = trim($('#url').val());
		var linkUrl = trim($('#linkUrl').val()); var image = trim($('#image').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(url=='undefined' || url==''){ errMsg += '<li>Please provide URL !!\n</li>'; }
		if(linkUrl=='undefined' || linkUrl==''){ errMsg += '<li>Please Provide Link URL !!\n</li>'; }	
		if((image=='undefined' || image=='') && (description=='undefined' || description=='' || description=='<p>Description<\/p>')){ errMsg += '<li>Please provide an Image / Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateOffersForm.submit(); }
	}catch(e){ return false; }
}

function savePlacesToVisit(){
	try{
		var errMsg = ''; var title = trim($('#title').val()); var image1 = trim($('#image1').val());
		var image2 = trim($('#image2').val()); var image3 = trim($('#image3').val()); var image4 = trim($('#image4').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if((image1=='undefined' || image1=='') && (image2=='undefined' || image2=='') && (image3=='undefined' || image3=='') && (image4=='undefined' || image4=='') ){ errMsg += '<li>Please Provide Atleast 1st Image !!\n</li>'; }	
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.savePlacesToVisitForm.submit(); }
	}catch(e){ return false; }
}

function updatePlacesToVisit(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var title = trim($('#title').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updatePlacesToVisitForm.submit(); }
	}catch(e){ return false; }
}

function saveMovies(){
	try{
		var errMsg = ''; var title = trim($('#title').val()); 
		var image1 = trim($('#image1').val()); var categoryId = trim($('#categoryId').val()); var starring = trim($('#starring').val()); var music = trim($('#music').val()); var director = trim($('#director').val());
		var producer = trim($('#producer').val()); var latestShowTimingsLink = trim($('#latestShowTimingsLink').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title of the Film !!\n</li>'; }
		if(image1=='undefined' || image1==''){ errMsg += '<li>Please Provide 1st Image of the Film !!\n</li>'; }
		if(starring=='undefined' || starring==''){ errMsg += '<li>Please provide Starring of the Film !!\n</li>'; }
		if(music=='undefined' || music==''){ errMsg += '<li>Please provide Music of the Film !!\n</li>'; }
		if(director=='undefined' || director==''){ errMsg += '<li>Please provide Director of the Film !!\n</li>'; }
		if(producer=='undefined' || producer==''){ errMsg += '<li>Please provide Producer of the Film !!\n</li>'; }
		if(latestShowTimingsLink=='undefined' || latestShowTimingsLink==''){ errMsg += '<li>Please provide Show Timings Link !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveMoviesForm.submit(); }
	}catch(e){ return false; }
}

function updateMovies(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var title = trim($('#title').val()); 
		var starring = trim($('#starring').val()); var music = trim($('#music').val()); var director = trim($('#director').val());
		var producer = trim($('#producer').val()); var latestShowTimingsLink = trim($('#latestShowTimingsLink').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title of the Film !!\n</li>'; }
		if(starring=='undefined' || starring==''){ errMsg += '<li>Please provide Starring of the Film !!\n</li>'; }
		if(music=='undefined' || music==''){ errMsg += '<li>Please provide Music of the Film !!\n</li>'; }
		if(director=='undefined' || director==''){ errMsg += '<li>Please provide Director of the Film !!\n</li>'; }
		if(producer=='undefined' || producer==''){ errMsg += '<li>Please provide Producer of the Film !!\n</li>'; }
		if(latestShowTimingsLink=='undefined' || latestShowTimingsLink==''){ errMsg += '<li>Please provide Show Timings Link !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateMoviesForm.submit(); }
	}catch(e){ return false; }
}

function saveInterviews(){
	try{
		var errMsg = ''; var title = trim($('#title').val()); var image1 = trim($('#image1').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(image1=='undefined' || image1==''){ errMsg += '<li>Please Provide 1st Image !!\n</li>'; }	
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveInterviewsForm.submit(); }
	}catch(e){ return false; }
}

function updateInterviews(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var title = trim($('#title').val()); 
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateInterviewsForm.submit(); }
	}catch(e){ return false; }
}

function saveFAQs(){
	try{
		var errMsg = ''; var title = trim($('#title').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveFAQForm.submit(); }
	}catch(e){ return false; }
}

function updateFAQs(){
	try{
		var errMsg = ''; var id = trim($('#id').val()); var title = trim($('#title').val());
		var value=CKEDITOR.instances['editor'].getData();value=trim(value);
		$('#description').val(value); var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateFAQForm.submit(); }
	}catch(e){ return false; }
}

function saveAds(){
	try{
		var errMsg = ''; var adType = trim($('#adType').val()); var image = trim($('#image').val());
		var categoryId = trim($('#categoryId').val()); var imageAltMsg = trim($('#imageAltMsg').val()); var linkUrl = trim($('#linkUrl').val());
		var description=trim($('#description').val()); var priority=trim($('#priority').val());
		if(adType=='undefined' || adType==''){ errMsg += '<li>Please Select Ad Type !!\n</li>'; }
		if(categoryId=='undefined' || categoryId==''){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(image=='undefined' || image==''){ errMsg += '<li>Please Select an Image !!\n</li>'; }
		if(imageAltMsg=='undefined' || imageAltMsg==''){ errMsg += '<li>Please provide Image Alternate Message!!\n</li>'; }
		if(linkUrl=='undefined' || linkUrl==''){ errMsg += '<li>Please provide Link URL !!\n</li>'; }
		if(priority=='undefined' || priority=='' || priority=='Priority'){ errMsg += '<li>Please provide Priority for Ad !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveAdsForm.submit(); }
	}catch(e){ return false; }
}

function updateAds(){
	try{
		var errMsg = '';  var id = trim($('#id').val()); var adType = trim($('#adType').val());
		var categoryId = trim($('#categoryId').val()); var imageAltMsg = trim($('#imageAltMsg').val()); var linkUrl = trim($('#linkUrl').val());
		var priority=trim($('#priority').val());  var description=trim($('#description').val());
		if(id=='undefined' || id==''){ errMsg += '<li>Please provide ID !!\n</li>'; }
		if(adType=='undefined' || adType==''){ errMsg += '<li>Please Select Ad Type !!\n</li>'; }
		if(categoryId=='undefined' || categoryId==''){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(imageAltMsg=='undefined' || imageAltMsg==''){ errMsg += '<li>Please provide Image Alternate Message!!\n</li>'; }
		if(linkUrl=='undefined' || linkUrl==''){ errMsg += '<li>Please provide Link URL !!\n</li>'; }
		if(priority=='undefined' || priority=='' || priority=='Priority'){ errMsg += '<li>Please provide Priority for Ad !!\n</li>'; }
		if(description=='undefined' || description=='' || description=='<p>Description<\/p>'){ errMsg += '<li>Please provide Description !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateAdsForm.submit(); }
	}catch(e){ return false; }
}

function saveCategories(){
	try{
		var errMsg = ''; var title = trim($('#title').val()); 
		var categoryName = trim($('#categoryName').val()); var parentCategoryId = trim($('#parentCategoryId').val());
		var metaKeywords = trim($('#metaKeywords').val()); var metaDescription = trim($('#metaDescription').val());
		var priority = trim($('#priority').val());
		if(parentCategoryId=='undefined' || parentCategoryId=='' || parentCategoryId=='0'){ errMsg += '<li>Please Select Category !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(categoryName=='undefined' || categoryName==''){ errMsg += '<li>Please Provide Category Name !!\n</li>'; }
		if(metaKeywords=='undefined' || metaKeywords==''){ errMsg += '<li>Please provide Meta Keywords !!\n</li>'; }
		if(metaDescription=='undefined' || metaDescription==''){ errMsg += '<li>Please provide Meta Description!!\n</li>'; }
		if(priority=='undefined' || priority==''){ errMsg += '<li>Please provide Priority !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveCategoriesForm.submit(); }
	}catch(e){ return false; }
}

function updateCategories(){
	try{
		var errMsg = ''; var title = trim($('#title').val()); 
		var categoryName = trim($('#categoryName').val()); var categoryId = trim($('#categoryId').val());
		var metaKeywords = trim($('#metaKeywords').val()); var metaDescription = trim($('#metaDescription').val()); var parentCategoryId = trim($('#parentCategoryId').val());
		var priority = trim($('#priority').val());
		if(categoryId=='undefined' || categoryId=='' || categoryId=='0'){ errMsg += '<li>Please Provide Category ID !!\n</li>'; }
		if(title=='undefined' || title==''){ errMsg += '<li>Please Provide Title !!\n</li>'; }
		if(parentCategoryId=='undefined' || parentCategoryId=='' || parentCategoryId=='0'){ errMsg += '<li>Please Select Parent Category !!\n</li>'; }
		if(categoryName=='undefined' || categoryName==''){ errMsg += '<li>Please Provide Category Name !!\n</li>'; }
		if(metaKeywords=='undefined' || metaKeywords==''){ errMsg += '<li>Please provide Meta Keywords !!\n</li>'; }
		if(metaDescription=='undefined' || metaDescription==''){ errMsg += '<li>Please provide Meta Description!!\n</li>'; }
		if(priority=='undefined' || priority==''){ errMsg += '<li>Please provide Priority !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateCategoriesForm.submit(); }
	}catch(e){ return false; }
}

function saveAdmin(){
	try{
		var errMsg = ''; var firstName = trim($('#firstName').val()); var lastName = trim($('#lastName').val());
		var emailId = trim($('#emailId').val()); var password = trim($('#password').val()); var retypePassword = trim($('#retypePassword').val());
		var phone = trim($('#phone').val()); var address = trim($('#address').val());
		if(firstName=='undefined' || firstName==''){ errMsg += '<li>Please Select First Name !!\n</li>'; }
		if(lastName=='undefined' || lastName==''){ errMsg += '<li>Please provide Last Name !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(password=='undefined' || password==''){ errMsg += '<li>Please Provide Password !!\n</li>'; }
		if(retypePassword=='undefined' || retypePassword==''){ errMsg += '<li>Please Provide Retype Password !!\n</li>'; }
		if(password!='undefined' && password!='' && retypePassword!='undefined' && retypePassword!='' && password!=retypePassword){ errMsg += '<li>Password and Retype Password must be Same !!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.saveAdminForm.submit(); }
	}catch(e){ return false; }
}

function updateAdmin(){
	try{
		var errMsg = ''; var userId = trim($('#userId').val()); var firstName = trim($('#firstName').val()); var lastName = trim($('#lastName').val());
		var emailId = trim($('#emailId').val()); var password = trim($('#password').val()); var retypePassword = trim($('#retypePassword').val());
		var phone = trim($('#phone').val()); var address = trim($('#address').val());
		if(userId=='undefined' || userId=='' || userId=='0'){ errMsg += '<li>Please Provide Admin Id !!\n</li>'; }
		if(firstName=='undefined' || firstName==''){ errMsg += '<li>Please Select First Name !!\n</li>'; }
		if(lastName=='undefined' || lastName==''){ errMsg += '<li>Please provide Last Name !!\n</li>'; }
		if(emailId=='undefined' || emailId=='' || !checkemail(emailId)){ errMsg += '<li>Please provide Email Id!!\n</li>'; }
		if(password=='undefined' || password==''){ errMsg += '<li>Please Provide Password !!\n</li>'; }
		if(retypePassword=='undefined' || retypePassword==''){ errMsg += '<li>Please Provide Retype Password !!\n</li>'; }
		if(password!='undefined' && password!='' && retypePassword!='undefined' && retypePassword!='' && password!=retypePassword){ errMsg += '<li>Password and Retype Password must be Same !!\n</li>'; }
		if(phone=='undefined' || phone==''){ errMsg += '<li>Please provide Phone !!\n</li>'; }
		if(address=='undefined' || address==''){ errMsg += '<li>Please provide Address !!\n</li>'; }
		if(errMsg!=''){ showError(errMsg); }else{ document.updateAdminForm.submit(); }
	}catch(e){ return false; }
}

function deleteAdminYellowPages(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Yellow Pages Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteYellowPageForm.submit(); }
}

function deleteAdminEvents(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Event Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteAdminEventForm.submit(); }
}

function deleteAdminOffers(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Event Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteOffersForm.submit(); }
}

function deleteAdminPlacesToVisit(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Event Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deletePlacesToVisitForm.submit(); }
}

function deleteAdminMovies(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Event Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteMoviesForm.submit(); }
}

function deleteAdminInterviews(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Event Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteInterviewsForm.submit(); }
}

function deleteAdminFAQs(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Event Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteFaqForm.submit(); }
}

function deleteAdminAds(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Ad Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteAdForm.submit(); }
}

function deleteAdminCategories(){
	var errMsg = ''; var categoryId = trim($('#categoryId').val()); 
	if(categoryId=='undefined' || categoryId==''){ errMsg += '<li>Please Provide Category Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteCategoryForm.submit(); }
}

function deleteListOfAdmins(){
	var errMsg = ''; var pId = trim($('#pId').val()); 
	if(pId=='undefined' || pId==''){ errMsg += '<li>Please Provide Admin Id !!\n</li>'; }
	if(errMsg!=''){ showError(errMsg); }
	else{ document.deleteAdminsForm.submit(); }
}

function pagingSTL(urlNam,no){
	if(urlNam=='sClassifieds'){
		var url='';var id=trim($('#id').val());var categoryId=trim($('#categoryId').val());var status=trim($('#status').val());var emailId=trim($('#emailId').val());var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(categoryId!='undefined'&&categoryId!=''){url+='&categoryId='+categoryId;}
		if(status!='undefined'){url+='&status='+status;}
		if(emailId!='undefined'&&emailId!=''){url+='&emailId='+emailId;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		$.ajax({url:'adminClassifieds?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sYellowPages'){
		var url='';var id=trim($('#id').val());var categoryId=trim($('#categoryId').val());var contactPerson=trim($('#contactPerson').val());var phone=trim($('#phone').val());var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());var emailId=trim($('#emailId').val());
		if(contactPerson!='undefined'&&contactPerson!=''){url+='&contactPerson='+contactPerson;}
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(categoryId!='undefined'&&categoryId!=''){url+='&categoryId='+categoryId;}
		if(phone!='undefined'){url+='&phone='+phone;}
		if(emailId!='undefined'&&emailId!=''){url+='&emailId='+emailId;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminYellowPagesList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sEvents'){
		var url='';var id=trim($('#id').val()); var name=trim($('#name').val()); var phone=trim($('#phone').val());var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());var emailId=trim($('#emailId').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(name!='undefined'&&name!=''){url+='&name='+name;}
		if(emailId!='undefined'&&emailId!=''){url+='&emailId='+emailId;}
		if(phone!='undefined'&&phone!=''){url+='&phone='+phone;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminEventPagesList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sOffers'){
		var url='';var id=trim($('#id').val()); var categoryId=trim($('#categoryId').val()); var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(categoryId!='undefined'&&categoryId!=''){url+='&categoryId='+categoryId;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminOffersPageList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sPlacesToVisit'){
		var url='';var id=trim($('#id').val()); var title=trim($('#title').val()); var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(title!='undefined'&&title!=''){url+='&title='+title;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminPlacesToVisitList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sMovies'){
		var url='';var id=trim($('#id').val()); var categoryId=trim($('#categoryId').val()); var title=trim($('#title').val()); var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(categoryId!='undefined'&&categoryId!=''){url+='&categoryId='+categoryId;}
		if(title!='undefined'&&title!=''){url+='&title='+title;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminMovies?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sInterviews'){
		var url='';var id=trim($('#id').val()); var title=trim($('#title').val()); var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(title!='undefined'&&title!=''){url+='&title='+title;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminInterviews?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sFAQ'){
		var url='';var id=trim($('#id').val()); var title=trim($('#title').val()); var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val());var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(title!='undefined'&&title!=''){url+='&title='+title;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminFAQs?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sAllCategories'){
		var url='';var id=trim($('#id').val()); var categoryName=trim($('#categoryName').val()); var parentCategoryId=trim($('#parentCategoryId').val()); var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(categoryName!='undefined'&&categoryName!=''){url+='&categoryName='+categoryName;}
		if(parentCategoryId!='undefined'&&parentCategoryId!=''){url+='&parentCategoryId='+parentCategoryId;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminAllCategoriesList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sAdminAds'){
		var url='';var id=trim($('#id').val()); var categoryId=trim($('#categoryId').val()); var adType=trim($('#adType').val());
		var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val()); var status=trim($('#status').val());
		if(id!='undefined'&&id!=''){url+='&id='+id;}
		if(categoryId!='undefined'&&categoryId!=''){url+='&categoryId='+categoryId;}
		if(adType!='undefined'&&adType!=''){url+='&adType='+adType;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminAdsList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}else if(urlNam=='sContactUs'){
		var url='';var name=trim($('#name').val()); var emailId=trim($('#emailId').val());
		var dateFrom=trim($('#dateFrom').val());var dateTo=trim($('#dateTo').val()); var status=trim($('#status').val());
		if(name!='undefined'&&name!=''){url+='&name='+name;}
		if(emailId!='undefined'&&emailId!=''){url+='&emailId='+emailId;}
		if(dateFrom!='undefined'&&dateFrom!=''){url+='&dateFrom='+dateFrom;}
		if(dateTo!='undefined'&&dateTo!=''){url+='&dateTo='+dateTo;}
		if(status!='undefined'){url+='&status='+status;}
		$.ajax({url:'adminCountactUsList?pageNo='+no+url,context:document.body}).done(function(data){$('#table').html(data);}).fail(function(data){showError(data);});
	}
}

function searchListOfAdmins() {
	  var userId = trim($('#userId').val());  var loginName = trim($('#loginName').val());  var contactNo = trim($('#contactNo').val());
	  var status = trim($('#status').val()); 
	  if( (userId!='undefined' && userId!='') || (loginName!='undefined' && loginName!='') || (contactNo!='undefined' && contactNo!='') || (status!='undefined' && status!='')){
			$.ajax({ url: 'searchAdmins?userId='+userId+'&loginName='+loginName+'&contactNo='+contactNo+'&status='+status, context: document.body }).done(function(data){ $('#table').html(data); }).fail(function(data){ showError(data); });
		}else{showError('<li>Please Provide at least one value to Search!!\n</li>'); }
}

function formatDate(fromDate) {
  var fromDateArray = fromDate.split("/");
  var selectedDate = fromDateArray[2] +"-"+ fromDateArray[0] +"-"+ fromDateArray[1];
  return selectedDate;
}

function captchaResumeServerResponse(){
	if(http.readyState == 4 && http.status == 200){
		var results = trim(http.responseText);
		if(results == "1" || results == 1){ document.saveResume.submit();  }
		else{ showError('<li>Text Entered Does Not Match with Captcha Image</li>'); Recaptcha.reload(); return false; }			
	}
}

function showError(message){ try{ $('#eMsg').html(message); $('#failure').addClass('in').show();}catch(e){ alert(e);};}
function showSucess(message){ $('#sMsg').html(message); $('#success').addClass('in').show(); }