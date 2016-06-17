<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<jsp:include page="../../header.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/abnormal.css"
	rel="stylesheet" type="text/css" />

<title>ZZL</title>
</head>
<body class="skin-blue" onload="changeTab('10700', '10702')">
	<!-- 人物头像 -->
	<jsp:include page="../../headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="../../navigation.jsp"></jsp:include>

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side"> <!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			异常积压订单追踪 <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">异常积压订单</li>
		</ol>
		</section> <s:iterator value="#session.authorityList" id="low">
			<s:if
				test="#low.highAuthName=='生产单管理'&&#low.middleAuthName=='异常积压订单追踪'&&#low.lowAuthName=='异常积压订单追踪查询'">
				<!-- Main content -->
				<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="table-responsive">
								<table class="table table-striped" align="center">
									<tr>
										<th>积压环节</th>
										<th>标准时间</th>
										<th>积压数量</th>
									</tr>
									<s:iterator value="abnormalParams">
										<tr>
											<td><s:property value="paramName" />:</td>
											<td><s:property value="standardTime" />H</td>
											<td><span class="red"><s:property value="volume" /></span></td>
										</tr>
									</s:iterator>
								</table>
							</div>
						</div>
					</div>
				</div>
				</section>
			</s:if>
		</s:iterator></aside>
	</div>
</body>
</html>