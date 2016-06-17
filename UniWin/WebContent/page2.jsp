<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="../css/page.css" rel="stylesheet" type="text/css" />
<s:property value="PageBean.setUrlString(<%=request.getRequestURL()%>)>"/>
<!-- 分页-->
<div class="pages" style="margin-top:30px;text-align:center;" >                
    <a id="page-show">每页显示</a>
    <div class="dropdown" style="float:left;margin-right:20px;">
	   <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
	      data-toggle="dropdown" style="background-color:white;border-color:#CDCDB4;">
	      ${PageBean.pageSize}
	      <span class="caret"></span>
	   </button>
	   <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="min-width:55px;">
	      <li role="presentation">
	         <a role="menuitem" tabindex="-1" href="${PageBean.urlString}?page=1&rowsPerPage=3">3</a>
	      </li>
	      <li role="presentation">
	         <a role="menuitem" tabindex="-1" href="${PageBean.urlString}?page=1&rowsPerPage=6">6</a>
	      </li>
	      <li role="presentation">
	         <a role="menuitem" tabindex="-1" href="${PageBean.urlString}?page=1&rowsPerPage=10">10</a>
	      </li>
	      <li role="presentation">
	         <a role="menuitem" tabindex="-1" href="${PageBean.urlString}?page=1&rowsPerPage=20">20</a>
	      </li>
	      <li role="presentation">
	         <a role="menuitem" tabindex="-1" href="${PageBean.urlString}?page=1&rowsPerPage=30">30</a>
	      </li>
	      <li role="presentation">
	         <a role="menuitem" tabindex="-1" href="${PageBean.urlString}?page=1&rowsPerPage=100">100</a>
	      </li>
	   </ul>
	</div>
            
    <s:if test="PageBean.currentPage == 1">
    <img src="../images/pfirst.png" id="pfirstpage">
    <img src="../images/pprev.png" id="pfirstpage">
    </s:if>
    <s:else>
    <a href="${PageBean.urlString}?page=1&rowsPerPage=${PageBean.pageSize}"><img src="../images/first.png" id="firstpage"></a>
    <a href="${PageBean.urlString}?page=${PageBean.currentPage-1}&rowsPerPage=${PageBean.pageSize}"><img src="../images/prev.png" id="prevpage"></a>
    </s:else>
    <span id="page-show">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<a id="currentPage"><s:property value="PageBean.currentPage"/></a>&nbsp;&nbsp;页&nbsp;&nbsp;/&nbsp;&nbsp;共&nbsp;&nbsp;<s:property value="PageBean.totalPage"/>&nbsp;&nbsp;页</span>
    <s:if test="PageBean.currentPage != PageBean.totalPage">
    <a href="${PageBean.urlString}?page=${PageBean.currentPage+1}&rowsPerPage=${PageBean.pageSize}"><img src="../images/next.png" id="nextpage"></a>
    <a href="${PageBean.urlString}?page=${PageBean.totalPage}&rowsPerPage=${PageBean.pageSize}"><img src="../images/last.png" id="lastpage"></a>
    </s:if>
    <s:else>
    <img src="../images/pnext.png" id="pnextpage">
    <img src="../images/plast.png" id="plastpage">
    </s:else>
</div>
<!-- 分页-->
<script src="<%=request.getContextPath() %>/js/page.js" type="text/javascript"></script>