<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, com.stldesis.util.Helper"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% Properties properties = Helper.getPropertiesFromFile(); %>
<% if(request.getParameter("id").toString().equals("success")) { %>
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                      <h4 class="modal-title"><s:property value="ad.title"/> </h4>
                    </div>
                    <s:if test="ad!=null">
                    <div class="modal-body" id="aView">
                        <h5><span>User Id : </span> <s:property value="ad.id"/>  </h5>
				        <h5><span>Category : </span><s:property value="category.categoryName"/>
				        <h5><span>Ad Type : </span>
							<s:if test="ad.adType==1">Header Ad</s:if><s:elseif test="ad.adType==2">Top-Ad Blocks</s:elseif><s:elseif test="ad.adType==3">Page Left-Ads</s:elseif>
                     		<s:elseif test="ad.adType==4">Page Right-Ads</s:elseif><s:elseif test="ad.adType==5">Home Fixed-Ad</s:elseif><s:elseif test="ad.adType==6">Home Scroll-Ads</s:elseif>
                     		<s:elseif test="ad.adType==7">Home Bottom-Ads</s:elseif>
						</h5>
				        <h5><span>Image : </span><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="ad.image"/>" alt="" title="" class="user-uploaded-image-view"></h5>
				        <h5><span>Image Alternate Message : </span><s:property value="ad.imageAltMsg"/></h5>
				        <h5><span>Link URL : </span><s:property value="ad.linkUrl"/></h5>
				        <h5><span>Description : </span></h5>
				        <textarea rows="5" cols="" disabled="disabled"><s:property value="ad.adDescription" escapeHtml="false"/></textarea>
				        <h5> <span>Priority : </span><s:property value="ad.priority"/></h5>
				        <h5> <span>Status :  </span><s:if test="ad.status==1">Active</s:if><s:else>In Active</s:else></h5>
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