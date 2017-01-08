<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="includes/links.jsp"%>
<title>FAQ | STL DESIS</title>
<meta name="keywords" content="<s:property value="category.categoryName"/> STL DESIS">
<meta name="description" content="<s:property value="category.categoryName"/> STL DESIS" />
</head>
<body>
<div class="wrapper">
  <%@include file="includes/header.jsp"%>
  <%@include file="includes/leftMenu.jsp"%>
        <div class="col-sm-9 places-to-visit-list">
          <ol class="breadcrumb">
            <li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>home">Home</a></li>
            <li class="active">FAQ's</li>
          </ol>
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        	<s:if test="faqList!=null && faqList.size>0">
			<s:iterator value="faqList" var="faq" status="status">
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading<s:property value="#status.count"/>">
                  <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="#status.count"/>" aria-expanded="true" aria-controls="collapse<s:property value="#status.count"/>">
                      <s:property value="title"/>
                    </a>
                  </h4>
                </div>
                <div id="collapse<s:property value="#status.count"/>" class="panel-collapse collapse <s:if test="#status.count==1">in</s:if>" role="tabpanel" aria-labelledby="heading<s:property value="#status.count"/>">
                  <div class="panel-body">
                    <s:property value="description" escapeHtml="false"/>
                  </div>
                </div>
              </div>
          	</s:iterator>
          	</s:if> <s:else><h2>Nothing was found in this Category.!!!</h2></s:else>
          </div>
          <div class="col-xs-12">
            <ul class="pagination">
			    <s:if test="pageNo==1" ><li class="prev disabled"><a href="#"> << </a></li></s:if>
				<s:else><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo-1)" />"> << </a></li></s:else>
				<s:if test="(pageNo>4) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo-4)" />"><s:property value="(pageNo-4)" /></a></li></s:if>
				<s:if test="(pageNo>3) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo-3)" />"><s:property value="(pageNo-3)" /></a></li></s:if>
				<s:if test="(pageNo>2) && ((pageNo-2)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo-2)" />"><s:property value="(pageNo-2)" /></a></li></s:if>
				<s:if test="(pageNo>1) && ((pageNo-1)>0)" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo-1)" />"><s:property value="(pageNo-1)" /></a></li></s:if>
				<li class="active"><a href="#"><s:property value="pageNo" /></a></li>
				<s:if test="(pageNo+1)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo+1)" />"><s:property value="(pageNo+1)" /></a></li></s:if>
				<s:if test="(pageNo+2)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo+2)" />"><s:property value="(pageNo+2)" /></a></li></s:if>
				<s:if test="(pageNo+3)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo+3)" />"><s:property value="(pageNo+3)" /></a></li></s:if>
				<s:if test="(pageNo+4)<=noOfPages" ><li><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo+4)" />"><s:property value="(pageNo+4)" /></a></li></s:if>
				<s:if test="noOfPages<=pageNo" ><li class="next disabled"><a href="#"> >> </i></a></li></s:if>
				<s:else><li class="next"><a href="<%=properties.getProperty("CONTEXT_PATH").toString() %>faq?pageNo=<s:property value="(pageNo+1)" />"> >> </i></a></li></s:else>
			</ul>
        </div>
      </div>
    <%@include file="includes/footer.jsp"%>
