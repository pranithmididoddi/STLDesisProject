<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>images/favicon.png" type="image/x-icon" />
<link rel="stylesheet" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/custom.css" />
<link rel="stylesheet" href="<%=properties.getProperty("CONTEXT_PATH").toString() %>css/font-awesome.css" />
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/jquery-1.12.3.min.js"></script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-control" content="public">
<meta http-equiv="Pragma" content="no-cache" >
