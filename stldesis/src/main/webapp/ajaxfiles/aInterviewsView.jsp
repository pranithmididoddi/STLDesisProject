<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
              <h4 class="modal-title"><s:property value="interviews.title"/> </h4>
            </div>
            <s:if test="interviews!=null">
            <div class="modal-body" id="aView">
              <h5><span>Interview Id : </span><s:property value="interviews.id"/></h5>
              <h5><span>Interview Person : </span> <s:property value="interviews.title"/></h5>
              <h5><span>Interview Url : </span> <s:property value="interviews.url"/></h5>
              <s:if test="interviews.image1!=null">
	              <h5><span>Uploaded Image 1 : </span></h5>
	              <div><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image1"/>" alt="" title="" class="user-uploaded-image-view"></div>
              </s:if>
              <s:if test="interviews.image2!=null">
	              <h5><span>Uploaded Image 2 : </span></h5>
	              <div><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image2"/>" alt="" title="" class="user-uploaded-image-view"></div>
              </s:if>
              <s:if test="interviews.image3!=null">
	              <h5><span>Uploaded Image 3 : </span></h5>
	              <div><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image3"/>" alt="" title="" class="user-uploaded-image-view"></div>
              </s:if>
              <s:if test="interviews.image4!=null">
	              <h5><span>Uploaded Image 4 : </span></h5>
	              <div><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="interviews.image4"/>" alt="" title="" class="user-uploaded-image-view"></div>
              </s:if>
              <h5><span>Description : </span></h5>
              <textarea rows="10" cols="" disabled="disabled">
              	<s:property value="interviews.description" escapeHtml="false"/>
              </textarea>
              <h5><span>Status : </span><s:if test="interviews.status==1">Active</s:if><s:else>In Active</s:else></h5>
              <div class="clearfix"></div>
            </div>
            </s:if>
            <div class="modal-footer">
              <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
<%}else{%>
<s:property value="errorMsg"/>
<%}%>