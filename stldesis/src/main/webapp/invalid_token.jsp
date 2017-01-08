<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Update Duplicate Request Page</title>
</head>
<body>
<h3>User information is not updated, duplicate request detected.</h3>
<h4>Possible Reasons are:</h4>
<ul>
    <li>Back button usage to submit form again</li>
    <li>Double click on Submit button</li>
    <li>Using "Reload" Option in browser</li>
</ul>
<br>
<s:if test="hasActionErrors()">
    <s:actionerror/>
</s:if>
</body>
</html>