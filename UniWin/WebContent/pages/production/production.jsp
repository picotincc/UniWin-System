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
<link href="<%=request.getContextPath()%>/css/production.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" media="screen">

<title>ZZL</title>
</head>
<body class="skin-blue" onload="setDefault()">
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
				生产单 详细页 <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>"><i
						class="fa fa-dashboard"></i> Home</a></li>
				<li><a
					href="<%=request.getContextPath()%>/Production/productions"><i
						class="fa fa-dashboard"></i> 生产单列表</a></li>
				<li class="active">生产单详细页</li>
			</ol>
			</section> <!-- Main content --> <section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="row">

							<div class="col-md-3">
								<div class="form-group">
									<label for="design_new_old">新/老款：</label> <select
										id="design_new_old" class="form-control">
										<option>老款</option>
										<option>新款</option>
									</select>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<label for="production_priority">订单优先级：</label> <select
										id="production_priority" class="form-control">
										<option>第一时间</option>
										<option>普通</option>
									</select>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<label for="order_source">来源：</label> <select id="order_source"
										class="form-control">
										<option>旗舰店</option>
										<option>速卖通</option>
										<option>外贸店</option>
										<option>专营店</option>
										<option>阿里巴巴</option>
										<option>国外平台</option>
										<option>雅酷衣衣</option>
										<option>好衣汇</option>
										<option>hodoyi</option>
										<option>其他客户</option>
									</select>
								</div>
							</div>

							<div class="col-md-2">
								<div class="input-group">
									<span>制单人：</span> <input id="order_maker" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.orderMaker}" readonly>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="input-group">
									<span>款号：</span> <input id="design_code" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.designCode}" readonly>
								</div>
							</div>

							<div class="col-md-2">
								<div class="input-group">
									<span>下单日期：</span> <input id="order_date" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.orderDate}" readonly>
								</div>
							</div>

							<div class="col-md-2">
								<div class="input-group">
									<span>合同号：</span> <input id="order_contract_num" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.orderContractNum}">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<label for="process_type">加工分类：</label> <select
										id="process_type" class="form-control">
										<option>春夏款</option>
										<option>秋冬款</option>
										<option>毛衣款</option>
									</select>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="input-group">
									<span>客户名称：</span><span class="red">*</span> <input
										id="customer_name" type="text" class="form-control form-input"
										maxlength="20" value="${productionVO.customerName}">
								</div>
							</div>
							<div class="col-md-2">
								<div class="input-group">
									<span>客户代表：</span> <span class="red">*</span><input
										id="customer_representative" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.customerRepresentative}">
								</div>
							</div>
							<div class="col-md-3">
								<div class="input-group">
									<span>联系方式：</span> <span class="red">*</span><input
										id="contact" type="text" class="form-control form-input"
										maxlength="20" value="${productionVO.contact}">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4">
								<div class="input-group">
									<span>款式名称：</span> <input id="design_name" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.designName}" readonly>
								</div>
							</div>
							<div class="col-md-3 col-md-offset-1">
								<div class="input-group">
									<span>订单类型：</span> <input id="order_type" type="text"
										class="form-control form-input" maxlength="20"
										value="${productionVO.orderType}">
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<span>订单信息：</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<!-- 订单信息表格-->
							<div class="table-responsive">
								<!-- .table - Uses sparkline charts-->
								<table class="table table-striped">
									<tr>
										<th>颜色</th>
										<th>XS/90CM</th>
										<th>S/100CM</th>
										<th>M/110CM</th>
										<th>L/120CM</th>
										<th>XL/130CM</th>
										<th>XXL/140CM</th>
										<th>合计</th>
									</tr>
									<!-- iterator goes here and set data dynamically-->
									<s:iterator value="productionVO.orderDetails" var="orderDetail">
										<tr>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='color'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='XS'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='S'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='M'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='L'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='XL'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='XXL'/>">
												</div></td>
											<td><div class="input-group">
													<input type="text" class="form-control form-input"
														maxlength="20" value="<s:property value='total'/>">
												</div></td>
										</tr>
									</s:iterator>
								</table>
							</div>
							<!-- .table-responsive -->
						</div>
						<!-- .row -->
						<div class="row">
							<div class="col-md-2">
								<span>特殊工艺：</span>
							</div>
							<div class="col-md-2">
								<div class="input-group">
									<input type="text" class="form-control form-input"
										maxlength="20" value="${productionVO.specialTechnique}">
								</div>
							</div>
							<div class="col-md-2">
								<span>样板码数：</span>
							</div>
							<div class="col-md-2">
								<div class="input-group">
									<input type="text" class="form-control form-input"
										maxlength="20" value="${productionVO.sampleYardage}">
								</div>
							</div>
							<div class="col-md-2">
								<span>面料成分：</span>
							</div>
							<div class="col-md-2">
								<div class="input-group">
									<input type="text" class="form-control form-input"
										maxlength="20" value="${productionVO.shellIngredient}">
								</div>
							</div>
						</div>
						<!-- .row -->
						<div class="row">
							<div class="col-md-2">
								<span>备注：</span>
							</div>
							<div class="col-md-10">
								<div class="input-group">
									<textarea class="form-control form-input" cols="20">${productionVO.comment}
									</textarea>
								</div>
							</div>
						</div>
						<!-- .row -->
						<div class="row">
							<s:iterator value="#session.authorityList" id="low">
								<s:if
									test="#low.highAuthName=='生产单管理'&&#low.middleAuthName=='生产单列表'&&#low.lowAuthName=='状态调整'">
									<button type="button" class="btn" id="change_state"
										data-toggle="modal" data-target="#myModal">状态调整</button>
								</s:if>
							</s:iterator>

							<s:set value="productionVO.productionCode" var="pCode" />
							<s:iterator value="#session.authorityList" id="low">
								<s:if
									test="#low.highAuthName=='生产单管理'&&#low.middleAuthName=='生产单列表'&&#low.lowAuthName=='生产单打印'">
									<button type="button" class="btn" id="print"
										onclick="printProduction('<s:property value='#pCode'/>')">打印</button>
								</s:if>
							</s:iterator>

							<button type="button" class="btn backBtn" id="back"
								onclick="javascript:history.go(-1)">返回</button>
						</div>
					</div>
					<!-- .col-md-8 -->
					<div class="col-md-4">
						<img src="<%=request.getContextPath()%>/images/1.png" class="commdity-graph">
					</div>
					<!-- .col-md-4 -->
				</div>
				<!-- .row -->
			</div>
			</section> </aside>
		</div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel" style="color: black;">优先级修改</h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<s:form action="modproduction" namespace="/Production">
								<div class="row">
									<div class="col-md-2 col-md-offset-1">
										<label for="name" style="float: left; margin-top: 10px;">订单优先级：</label>
									</div>
									<div class="col-md-2">
										<select id="production_priority_modal" class="form-control"
											name="productionPriority">
											<option>第一时间</option>
											<option>普通</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1 col-md-offset-2">
										<button type="submit" id="search-responser"
											class="btn btn-primary">提交</button>
									</div>
								</div>
							</s:form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

	<script src="<%=request.getContextPath()%>/js/setDefaultSelect.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		window.onload = changeTab("10700", "10701");
		function setDefault() {
			var designNewOld = "<s:property value='productionVO.designNewOld'/>";
			var selectfornewold = document.getElementById("design_new_old");
			setSelectDefault(selectfornewold, designNewOld);

			var proPriority = "<s:property value='productionVO.productionPriority'/>";
			var selectforpri = document.getElementById("production_priority");
			var selectforpriModal = document
					.getElementById("production_priority_modal");
			setSelectDefault(selectforpri, proPriority);
			setSelectDefault(selectforpriModal, proPriority);

			var orderSource = "<s:property value='productionVO.orderSource'/>";
			var selectforOSource = document.getElementById("order_source");
			setSelectDefault(selectforOSource, orderSource);

			var processType = "<s:property value='productionVO.processType'/>";
			var selectforPType = document.getElementById("process_type");
			setSelectDefault(selectforPType, processType);

		}
		function printProduction(code){
			url='<%=request.getContextPath()%>/Production/printproduction';
			param='?productionCode='+code;
			url+=param;
			window.open(url);
		}
	</script>
</body>
</html>