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
<link href="<%=request.getContextPath()%>/css/productionlist.css"
	rel="stylesheet" type="text/css" />


<title>ZZL</title>
</head>
<body class="skin-blue"
	onload="setDefault();changeTab('10700', '10701')">
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
				生产单管理 <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>"><i
						class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">生产单管理</li>
			</ol>
			</section> <!-- Main content --> <section class="content">
			<div class="col-md-12">
				<s:iterator value="#session.authorityList" id="low">
					<s:if
						test="#low.highAuthName=='生产单管理'&&#low.middleAuthName=='生产单列表'&&#low.lowAuthName=='生产单列表查询'">

						<s:form action="specproductions" namespace="/Production">
							<div class="row">
								<div class="input-group">
									<label for="design_code">款号：</label> <input id="design_code"
										type="text" class="form-control form-input" placeholder="款号"
										maxlength="20" name="designCode" value="${designCode}">
								</div>

								<div class="input-group">
									<label for="customer_brand">客户名：</label> <input
										id="customer_brand" type="text"
										class="form-control form-input" placeholder="客户名"
										maxlength="20" name="customerBrand" value="${customerBrand}">
								</div>

								<div class="input-group">
									<label for="customer_representative">客户代表：</label> <input
										id="customer_representative" type="text"
										class="form-control form-input" placeholder="客户代表"
										maxlength="20" name="customerRepresentative"
										value="${customerRepresentative}">
								</div>
								<div class="form-group">
									<label for="accessory_state">辅料采购状况：</label> <select
										id="accessory_state" class="form-control"
										name="accessoryState">
										<option>请选择</option>
										<option>无需采购辅料</option>
										<option>已完成部分采购</option>
										<option>已完成辅料采购</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label for="production_priority">生产单优先级：</label> <select
										id="production_priority" class="form-control"
										name="productionPriority">
										<option>请选择</option>
										<option>第一时间</option>
										<option>普通</option>
									</select>
								</div>

								<div class="input-group">
									<label for="order_date">下单日期：</label> <input type="text"
										class="form-control form-input date" id="order_date"
										placeholder="yyyy-mm-dd" value="" name="orderDate"
										value="${orderDate}">
								</div>



								<div class="form-group">
									<label for="production_state">排单状态：</label> <select
										id="production_state" class="form-control"
										name="productionState">
										<option>请选择</option>
										<option>未排单</option>
										<option>已排单</option>
									</select>
								</div>
								<div class="form-group">
									<label for="design_new_old">新/老款：</label> <select
										id="design_new_old" class="form-control" name="designNewOld">
										<option>请选择</option>
										<option>新款</option>
										<option>老款</option>
									</select>
								</div>

								<button type="submit" id="search-pro" onclick="beforeSearch()"
									class="btn btn-primary">查询</button>
							</div>
						</s:form>
					</s:if>
				</s:iterator>

			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- 生产单表格-->
					<div class="table-responsive">
						<!-- .table - Uses sparkline charts-->
						<table class="table table-striped">
							<tr>
								<th>图片</th>
								<th>生产单编号</th>
								<th>款式信息</th>
								<th>客户名称</th>
								<th>采购单</th>
								<th>工艺单</th>
								<th>进度</th>
								<th>操作</th>
							</tr>
							<!-- iterator goes here and set data dynamically-->
							<s:iterator value="pageBean.list" var="production">
								<tr>
									<td><img src="<%=request.getContextPath()%>/images/1.png"
										class="commdity-graph"></td>
									<td>
										<p>
											<s:property value="productionCode" />
										</p>
										<p>
											<s:set
												value="@productManage.vo.production.ProductionConstants@DESIGN_NEW_OLD"
												var="designnewold" />
											<s:if
												test="#production.designNewOld.equals(#designnewold[0])">
												<span class="red">
											</s:if>
											<s:else>
												<span class="green">
											</s:else>
											<s:property value="designNewOld" />
											</span>&nbsp;&nbsp;
											<s:set
												value="@productManage.vo.production.ProductionConstants@PRODUCTION_PRIORITY"
												var="priority" />
											<s:if
												test="#production.productionPriority.equals(#priority[0])">
												<span class="red">
											</s:if>
											<s:else>
												<span class="green">
											</s:else>
											<s:property value="productionPriority" />
											</span>&nbsp;&nbsp;<span class="green"><s:property
													value="processType" /></span>
										</p>
									</td>
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
											<s:property value="customerBrand" />
										</p>
									</td>
									<td class="tc5">
										<!-- 根据状态显示图片 -->
										<p>
											<s:if test="materialExamined==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/examine.png">
											</s:if>
											<s:if test="warehouseExamined==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/warehousecheck.png">
											</s:if>
											<s:if test="phoneOrdered==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/phoneorder.png">
											</s:if>
											<s:if test="faxed==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/fax.png">
											</s:if>
											<s:if test="financeChecked==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/finance.png">
											</s:if>
											<s:if test="materialInWarehouse==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/inwarehouse.png">
											</s:if>
											<s:elseif test="materialChecked==true">
												<img class="purchase-graph"
													src="<%=request.getContextPath()%>/images/materialExamine.png">
											</s:elseif>

										</p>
									</td>
									<td>
										<p>
											<!-- 工艺单 -->
											<s:if test="#production.techniqueCode.equals('暂无')">
												<span class="red">暂无</span>
											</s:if>
											<s:else>
												<span class="item-name"> <a
													href="<%=request.getContextPath()%>/listManage/showOutSourceDetail?outSourceID=<s:property value='outsourceID'/>"><s:property
															value="techniqueCode" /></a>
												</span>
											</s:else>
										</p>
									</td>
									<td>
										<p>
											<s:property value="productionProgress" />
										</p>
										<p>
											<s:set
												value="@productManage.vo.production.ProductionConstants@ACCESSORY_STATE"
												var="accessorystates" />
											<s:if
												test="#production.accessoryState.equals(#accessorystates[0])">
												<span class="yellow">
											</s:if>
											<s:elseif
												test="#production.accessoryState.equals(#accessorystates[1])">
												<span class="red">
											</s:elseif>
											<s:else>
												<span class="green">
											</s:else>
											<s:property value="accessoryState" />
											</span>
										</p>
									</td>
									<td class="c8">
										<p>
											<span class="item-name"> <a
												href="<%=request.getContextPath()%>/Production/production?productionCode=<s:property value="productionCode" />">查看详细</a>
											</span>
										</p>
										<p>
											<s:set
												value="@productManage.vo.production.ProductionConstants@PRODUCTION_STATE"
												var="productionstates" />
											<s:if
												test="#production.productionState.equals(#productionstates[0])">
												<span class="yellow">
											</s:if>
											<s:else>
												<span class="green">
											</s:else>
											<s:property value="productionState" />
											</span>
										</p>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
					<!-- .table-responsive -->
					<!-- 分页 -->
					<jsp:include page="../../page.jsp" />
				</div>
				<!-- .col-md-12 -->
			</div>
			<!-- .row --> </section> </aside>
		</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

	<script type="text/javascript">
		$('#order_date').datetimepicker({
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
	<script src="<%=request.getContextPath()%>/js/setDefaultSelect.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		function beforeSearch() {

		}
		function setDefault() {
			var accState = "<s:property value='accessoryState'/>";
			var selectforAState = document.getElementById("accessory_state");
			setSelectDefault(selectforAState, accState);

			var proPriority = "<s:property value='productionPriority'/>";
			var selectforpri = document.getElementById("production_priority");
			setSelectDefault(selectforpri, proPriority);

			var proState = "<s:property value='productionState'/>";
			var selectforpState = document.getElementById("production_state");
			setSelectDefault(selectforpState, proState);

			var designNewOld = "<s:property value='designNewOld'/>";
			var selectfornewold = document.getElementById("design_new_old");
			setSelectDefault(selectfornewold, designNewOld);

		}
	</script>

</body>
</html>