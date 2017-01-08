<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Movie Details Step 1 | STL DESIS</title>
<meta name="keywords" content="STL DESIS" />
<meta name="description" content="STL DESIS" />
<%@include file="../includes/adminLinks.jsp"%>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor.js"></script>
<script src="<%=properties.getProperty("CONTEXT_PATH").toString() %>js/ckeditor/sample.js"></script>
</head>
<body>
<%@include file="../includes/adminHeader.jsp"%>
<div class="container-fluid">
  <div class="dashboard-wrapper">
  <%@include file="../includes/adminNavigation.jsp"%>
	<div class="main-container">
	  <div class="row-fluid ">
        <div class="span8 offset2">
          <div class="widget">
            <div class="widget-header">
              <div class="title"> <h3>Edit Movie Details</h3> </div>
            </div>
            <div class="widget-body">
              <form id="updateMoviesForm" name="updateMoviesForm" method="POST" action="updateMovies" enctype="multipart/form-data" onsubmit="return false;">
                <div class="span12">
                  <input type="hidden" name="id" id="id" value="<s:property value="movies.id"/>"/>
                  <h5>Select Category</h5>
                  <select class=" input-block-level" id="categoryId" name="categoryId">
                    <option value="0">Select Category</option>
                    <s:iterator value="categoryList">
                    	<option value="<s:property value="categoryId"/>" <s:if test="movies.categoryId==categoryId">selected="selected"</s:if>><s:property value="categoryName"/></option>
                    </s:iterator>
                  </select>
                </div>
                <div class="span6 mleft0">
                  <h5>Title</h5>
                  <input type="text" name="title" id="title" value="<s:property value="movies.title"/>" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>   
                <div class="span6">
                  <h5>Starring</h5>
                  <input type="text" name="starring" id="starring" value="<s:property value="movies.starring"/>" class="span12" onkeypress="return keyRestrict(event, 'char');"/>
                </div>  
                <div class="span6 mleft0">
                  <h5>Director</h5>
                  <input type="text" name="director" id="director" value="<s:property value="movies.director"/>" class="span12" onkeypress="return keyRestrict(event, 'char');"/>
                </div>   
                <div class="span6">
                  <h5>Music</h5>
                  <input type="text" name="music" id="music" value="<s:property value="movies.music"/>" class="span12" onkeypress="return keyRestrict(event, 'char');"/>
                </div>  
                <div class="span6 mleft0">
                  <h5>Producer</h5>
                  <input type="text" name="producer" id="producer" value="<s:property value="movies.producer"/>" class="span12" onkeypress="return keyRestrict(event, 'charspace');"/>
                </div>   
                <div class="span6">
                  <h5>Show timings link</h5>
                  <input type="url" name="latestShowTimingsLink" id="latestShowTimingsLink" value="<s:property value="movies.latestShowTimingsLink"/>" class="span12" />
                </div>  
                <div class="span3 mleft0">
                  <h5>Image 1 </h5>
                  <s:if test="movies.image1!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="movies.image1"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image1" id="image1" class="span12" value="" /> </div>
                <div class="span3">
                  <h5>Image 2 </h5>
                  <s:if test="movies.image2!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="movies.image2"/>" class="user-uploaded-image-edit"></s:if>
                  <input type="file" name="image2" id="image2" class="span12" value="" /> </div>
                <div class="span3">
                  <h5>Image 3 </h5>
                  <s:if test="movies.image3!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="movies.image3"/>" class="user-uploaded-image-edit"></s:if> 
                  <input type="file" name="image3" id="image2" class="span12" value="" /></div>
                <div class="span3">
                  <h5>Image 4 </h5>
                  <s:if test="movies.image4!=null"><img src="<%=properties.getProperty("CONTEXT_PATH").toString() %>imageAction?imageurl=<s:property value="movies.image4"/>" class="user-uploaded-image-edit" ></s:if> 
                  <input type="file" name="image4" id="image4" class="span12" value="" /></div>
                <div class="span12 mleft0">
                  <h5>Description</h5>
                  <input type="hidden" id="description" name="description" value="<s:property value="movies.description"/>" >
                  <div id="editor">                
                        <s:property value="movies.description" escapeHtml="false"/>
                    </div>
                </div>
                <div class="span12 mleft0">
                  <h5>Status</h5>
                  <select class="input-block-level" id="status" name="status">
			         	<option value="1" <s:if test="movies.status==1">selected="selected"</s:if> >Active</option>
			        	<option value="0" <s:if test="movies.status==0">selected="selected"</s:if> >In Active</option>
	         		</select>
                </div>
                <div class="span12 mleft0 mtop10">
                  <button type="button" class="btn btn-primary" id="updateMoviesFormButton" name="updateMoviesFormButton" >Update Details</button>
                </div>
              </form>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../includes/adminFooter.jsp"%>
<script>initSample();</script>
</body>
</html>