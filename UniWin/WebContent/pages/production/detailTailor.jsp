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
<link href="<%=request.getContextPath()%>/css/detailTailor.css"
	rel="stylesheet" type="text/css" />

<title>ZZL</title>
</head>
<body class="skin-blue" onload="setDefault()">
	<!-- header logo: style can be found in header.less -->
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
				裁剪单 详细页 <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>"><i
						class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="<%=request.getContextPath()%>/Production/tailor"><i
						class="fa fa-dashboard"></i> 裁剪单列表</a></li>
				<li class="active">裁剪单详细页</li>
			</ol>
			</section> <!-- Main content --> <section class="content">
			<div class="container-fluid">
				<div class="row">
					<s:form action="modifytailor" namespace="/Production">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2">
									<div class="input-group">
										<span>实际剪裁XS：</span> <input id="actual_xs" type="text"
											class="form-control form-input" maxlength="5" name="xs"
											value="${tailorDetailVO.actualXS}">
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
										<span>实际剪裁S：</span> <input id="actual_s" type="text"
											class="form-control form-input" maxlength="5" name="s"
											value="${tailorDetailVO.actualS}">
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
										<span>实际剪裁M：</span> <input id="actual_m" type="text"
											class="form-control form-input" maxlength="5" name="m"
											value="${tailorDetailVO.actualM}">
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
										<span>实际剪裁L：</span> <input id="actual_l" type="text"
											class="form-control form-input" maxlength="5" name="l"
											value="${tailorDetailVO.actualL}">
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
										<span>实际剪裁XL：</span> <input id="actual_xl" type="text"
											class="form-control form-input" maxlength="5" name="xl"
											value="${tailorDetailVO.actualXL}">
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
										<span>实际剪裁XXL：</span> <input id="actual_xxl" type="text"
											class="form-control form-input" maxlength="5" name="xxl"
											value="${tailorDetailVO.actualXXL}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">
									<div class="input-group">
										<span>开始日期：</span> <input id="start_time" type="text"
											class="form-control form-input" maxlength="20"
											name="startTime" value="${tailorDetailVO.startTime}">
									</div>
								</div>

								<div class="col-md-2">
									<div class="input-group">
										<span>结束日期：</span> <input id="finish_time" type="text"
											class="form-control form-input" maxlength="20"
											name="finishTime" value="${tailorDetailVO.finishTime}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<input type="hidden" name="tailorID"
										value="${tailorDetailVO.tailorID}">
									<s:iterator value="#session.authorityList" id="low">
										<s:if
											test="#low.highAuthName=='生产单管理'&&#low.middleAuthName=='裁剪单订单预警'&&#low.lowAuthName=='裁剪单管理'">
											<button type="submit" class="btn" id="change_state">修改裁剪单</button>
										</s:if>
									</s:iterator>
									<button type="button" class="btn backBtn" id="back"
										onclick="javascript:history.go(-1)">返回</button>
								</div>
							</div>
						</div>
					</s:form>
				</div>
				<!-- .row -->
			</div>
			</section> </aside>
		</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

	<script type="text/javascript">
		window.onload = changeTab("10700", "10703");
		$('#start_time').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			maxView : 4,
			forceParse : 0,
		});
		$('#finish_time').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			maxView : 4,
			forceParse : 0,
		});
	</script>
</body>
</html>