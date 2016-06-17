<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String actionName = request.getParameter("action");
%>
共
<s:property value="pageBean.allRow" />
条记录 共
<s:property value="pageBean.totalPage" />
页 当前第
<s:property value="pageBean.currentPage" />
页
<br />
<s:if test="%{pageBean.currentPage == 1}">
	第一页 上一页  
	</s:if>
<s:else>
	<a href="<%=actionName%>.action?page=1">第一页</a>
	<a href="<%=actionName%>.action?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
</s:else>
<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
	<a href="<%=actionName%>.action?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
	<a href="<%=actionName%>.action?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
</s:if>
<s:else>  
	下一页 最后一页 
	</s:else>