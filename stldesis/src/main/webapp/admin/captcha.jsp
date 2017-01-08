<script type="text/javascript">var RecaptchaOptions = { theme : 'red'};</script> 
<% String publicKey  = "6LeGVu4SAAAAAL0Ec7QelEw2WLy4ZZKaUeYO30Be";  %>
<%@page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
 <script type="text/javascript" src="https://www.google.com/recaptcha/api/challenge?k=<%=publicKey %>"></script>
 <noscript>
   <iframe src="https://www.google.com/recaptcha/api/noscript?k=<%=publicKey %>" height="300" width="500"></iframe><br>
   <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
   <input type="hidden" name="recaptcha_response_field" value="manual_challenge">
 </noscript>