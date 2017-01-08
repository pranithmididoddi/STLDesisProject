<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
  <div class="modal-dialog modal-lg row-fluid">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><s:property value="classifieds.title"/> </h4>
      </div>
      <div class="modal-body">
        <h5><span>Classifide Id : </span> <s:property value="classifieds.id"/> </h5>
        <h5><span>Classifide Title : </span> <s:property value="classifieds.title"/></h5>
        <h5><span>Classifide Url : </span> <s:property value="classifieds.url"/></h5>
        <h5><span>Category : </span> <s:iterator value="categoryList" var="category"><s:if test="#category.categoryId==classifieds.categoryId"><s:property value="#category.categoryName"/></s:if></s:iterator></h5>
        <s:if test="classifieds.image1!=null">
        <div class="span3 mleft0">
        <h5><span>Image 1 : </span></h5>
        <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image1"/>" alt="" title="" class="user-uploaded-image-view"></div>
        </s:if>
        <s:if test="classifieds.image2!=null">
        <div class="span3">
        <h5><span>Image 2 : </span></h5>
        <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image2"/>" alt="" title="" class="user-uploaded-image-view"></div>
        </s:if>
        <s:if test="classifieds.image3!=null">
        <div class="span3">
        <h5><span>Image 3 : </span></h5>
        <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image3"/>" alt="" title="" class="user-uploaded-image-view"></div>
        </s:if>
        <s:if test="classifieds.image4!=null">
        <div class="span3">
        <h5><span>Image 4 : </span></h5>
        <img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="classifieds.image4"/>" alt="" title="" class="user-uploaded-image-view"></div>
        </s:if>
        <div class="clear"></div>
        <h5><span>Description : </span></h5>
        <div class="fs14"><s:property value="classifieds.description" escapeHtml="false"/></div>
        <hr/>
        <h5><span>Price : </span> &#36; <s:property value="classifieds.price"/></h5>
        <h5><span>Contact Person Name :</span> <s:property value="classifieds.name"/></h5>
        <h5><span>Phone No: </span> <s:property value="classifieds.phone"/></h5>
        <h5><span>Email Id : </span> <s:property value="classifieds.emailId"/></h5>
        <h5><span>Address : </span></h5>
        <p class="fs14"><s:property value="classifieds.address"/></p>
        <h5><span>Status : </span><s:if test="classifieds.status==1">PUBLISHED</s:if><s:elseif test="classifieds.status==2">PENDING</s:elseif><s:else>In Active</s:else></h5>
        <div class="clearfix"></div>
      </div>
    </div>
  </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>