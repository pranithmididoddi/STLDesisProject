<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>
<%
   String remoteAddr = request.getRemoteAddr();
   ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
   reCaptcha.setPrivateKey("6LeGVu4SAAAAAM2tHzL7XTpmsoNuR_OkuwcieCQJ");

   String challenge = request.getParameter("recaptcha_challenge_field");
   String uresponse = request.getParameter("recaptcha_response_field");
   ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

   if (reCaptchaResponse.isValid()) {
     out.print("1");
   } else {
     out.print("0");
   }
 %>