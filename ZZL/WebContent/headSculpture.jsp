<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 人物头像 -->
<!-- header logo: style can be found in header.less -->
<header class="header">
    <a href="index.jsp" class="logo">
    <!-- Add the class icon to your logo image or logo icon to add the margining -->
        联&nbsp胜&nbsp链
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
    	<a href="<%=request.getContextPath()%>/System/userLogOut" style="float:right;color:white;margin-top:10px;margin-right:100px;text-decoration:underline;">注销</a>
    	<a style="float:right;color:white;margin:10px 0px;"><s:property value="#request.session.account"/>,&nbsp;&nbsp;&nbsp;</a>
    	<img alt="头像" src="<%=request.getContextPath() %>/images/head.png" style="float:right;width:35px;height:35px;margin:5px 10px;">
    </nav>
</header>
<!-- 人物头像 -->