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
<link href="<%=request.getContextPath()%>/css/tailors.css"
	rel="stylesheet" type="text/css" />

<title>ZZL</title>
</head>
<body class="skin-blue">
	<s:if test="#request.session.account!=null">
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
			订单实际裁剪数量预警管理 <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">裁剪单预警管理</li>
		</ol>
		</section> <!-- Main content --> <section class="content">
		<div class="row col-md-12">
			<s:form action="spectailor" namespace="/Production">
				<div class="input-group">
					<label for="production_code">生产单编号</label> <input
						id="production_code" name="productionCode" type="text"
						class="form-control form-input" placeholder="生产单编号" maxlength="20"
						value="${productionCode}">
				</div>

				<div class="input-group">
					<label for="design_code">款号</label> <input id="design_code"
						name="designCode" type="text" class="form-control form-input"
						placeholder="款号" maxlength="20" value="${designCode}">
				</div>

				<button type="submit" id="search-tailors" class="btn btn-primary">查询</button>
			</s:form>
		</div>
		<!-- 裁剪单订单预警查询-->
		<div class="row col-md-12">
			<div class="table-responsive">
				<!-- .table - Uses sparkline charts-->
				<table class="table table-striped">
					<tr>
						<th>图片</th>
						<th>生产单编号</th>
						<th>款式信息</th>
						<th>客户名称</th>
						<th>数量信息</th>
						<th>进度</th>
						<th>操作</th>
					</tr>
					<!-- iterator goes here and set data dynamically-->
					<s:iterator value="pageBean.list">
						<tr>
							<td><img src="<s:property value="designPicURL" />"
								class="commdity-graph"></td>
							<td><a
								href="<%=request.getContextPath()%>/Production/production?productionCode=<s:property value="productionCode" />"
								style="color: #7EC0EE; font-size: 14px"><s:property
										value="productionCode" /></a><br />
								<p>
									<span class="item-name">颜色：</span>
									<s:property value="color" />
								</p></td>
							<td>
								<p>
									<span class="item-name">款号：</span>
									<s:property value="designCode" />
								</p>
								<p>
									<span class="item-name">款式名称：</span>
									<s:property value="designName" />
								</p>
							</td>
							<td>
								<p>
									<s:property value="customerName" />
								</p>
							</td>
							<td>
								<p>
									<span class="item-name">订单数量：</span>
									<s:property value="orderVol" />
								</p>
								<p>
									<span class="item-name">裁剪数量：</span>
									<s:property value="actualVol" />
								</p>
							</td>
							<td>
								<p class="item-name">
									<s:property value="progress" />
								</p>
							</td>
							<td>
								<p>
									<span class="item-name"> <a
											href="<%=request.getContextPath()%>/Production/detailtailor?tailorID=<s:property value="tailorID" />">查看详细</a>
										</span>
								</p>
							</td>
						</tr>
					</s:iterator>
				</table>
				<!-- /.table -->
			</div>
		</div>
		<!-- 分页 --> <jsp:include page="../../page.jsp" /> </section> </aside>
	</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	
	<script type="text/javascript">
		window.onload = changeTab("10700", "10703");
	</script>
</body>
</html>