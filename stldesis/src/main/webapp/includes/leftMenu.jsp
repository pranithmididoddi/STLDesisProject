<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-sm-1 left-add">
	<s:if test="homePageLeftAdList!=null && homePageLeftAdList.size>0">
	<s:iterator value="homePageLeftAdList" status="status">
		<a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>" /></a>
    </s:iterator>
    </s:if>
 </div>
    <div class="col-sm-10">
      <div class="top-ads col-sm-12">
      	<s:if test="topAdBlocksList!=null && topAdBlocksList.size>0">
      	<s:iterator value="topAdBlocksList" status="status">
      	  <s:if test="#status.count<13">
	      <a href="<s:property value="linkUrl"/>" target="_blank"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="image"/>" alt="<s:property value="imageAltMsg"/>" class="col-xs-1 img-responsive"/></a>
	      </s:if>  
      	</s:iterator>
      	</s:if>
      </div>
      <div class="clearfix"></div>
      <div class="main-content">
		<div class="col-sm-3"> <a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>postFreeAd" class="btn postadd-btn">Post Free Ad</a>
          <div class="sidebar-nav">
            <div class="navbar navbar-default" role="navigation">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <span class="visible-xs navbar-brand">Category Menu</span> </div>
              <div class="navbar-collapse collapse sidebar-navbar-collapse">
                <ul class="nav navbar-nav">
                  <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>"<s:if test="urlPage.equals('home')">class="active"</s:if>>Home</a></li>
                  <s:if test="categoryObjMap!=null">
                  <s:iterator value="categoryObjMap">
                  <li <s:if test="value!=null && value.size>0">class="dropdown"</s:if> >
                  	<s:if test="value!=null && value.size>0"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><s:property value="key.categoryName"/> <i class="fa fa-caret-right"></i></a></s:if>
                  	<s:else><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %><s:property value="key.categoryUrlName"/>" ><s:property value="key.categoryName"/></a></s:else>
                  	<s:if test="value!=null && value.size>0">
                    <ul class="dropdown-menu">
                  	<s:iterator value="value" var="category">
                   		<li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %><s:property value="key.categoryUrlName"/>/<s:property value="#category.categoryUrlName" />"><s:property value="#category.categoryName" /></a></li>
                    </s:iterator>
                    </ul>
                    </s:if>
                   </li>
                  </s:iterator>
                  </s:if>
                </ul>
              </div>
            </div>
          </div>
        </div>