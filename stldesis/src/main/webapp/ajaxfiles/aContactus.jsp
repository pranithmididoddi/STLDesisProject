<%@ taglib prefix="s" uri="/struts-tags" %>
<% if(request.getParameter("id").toString().equals("success")) { %>
<s:property value="msg"/>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>