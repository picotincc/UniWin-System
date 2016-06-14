<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <!-- css,js 引包 -->
    <jsp:include page="header.jsp"></jsp:include>

    <title>联胜供应链管理系统</title>
</head>

<body class="skin-blue" style="vertical-align:middle;">
	<s:if test="#request.session.account!=null">
	<!-- 人物头像 -->
	<jsp:include page="headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->
    <div class="wrapper row-offcanvas row-offcanvas-left" style="background-color:#f9f9f9;">
        <!-- 左边导航栏  -->
        <jsp:include page="navigation.jsp"></jsp:include>
        
    </div>
	</s:if>
	<s:else>
		<jsp:include page="login.jsp"></jsp:include>
	</s:else>
</body>
</html>