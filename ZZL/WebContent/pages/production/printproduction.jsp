<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<jsp:include page="../../header.jsp"></jsp:include>
<!-- Theme style -->
<link href="<%=request.getContextPath()%>/adminLTE/css/AdminLTE.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/printproduction.css"
	rel="stylesheet" type="text/css" />

<title>ZZL</title>
</head>

<body>
	<!-- header logo: style can be found in header.less -->
	<div class="container-fluid">
		<div class="row" align="center">
			<span class="head"> 生产单 </span>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<table class="table-bordered table">

					<tr>
						<th class="t1c1">新/老款：</th>
						<td class="t1c2" style="text-align: left;"><s:property
								value='printVO.productionVO.designNewOld' /></td>
						<td colspan="4" style="text-align: left;">
							来源：${printVO.productionVO.orderSource}&nbsp;&nbsp;&nbsp;制单人：${printVO.productionVO.orderMaker}&nbsp;&nbsp;&nbsp;生产单号：${printVO.productionVO.productionCode}&nbsp;订单优先级：${printVO.productionVO.productionPriority}
						</td>

					</tr>
					<tr>
						<th class="t1c1">款号：</th>
						<td class="t1c2" style="text-align: left;">${printVO.productionVO.designCode}</td>
						<th>下单日期：</th>
						<td style="text-align: left;">${printVO.productionVO.orderDate}</td>
						<th>合同号：</th>
						<td style="text-align: left;">${printVO.productionVO.orderContractNum}</td>
					</tr>
					<tr>
						<th class="t1c1">客户名称：</th>
						<td class="t1c2" style="text-align: left;">${printVO.productionVO.customerName}</td>
						<th>客户代表<span class="text-red">*</span>：
						</th>
						<td style="text-align: left;">${printVO.productionVO.customerRepresentative}</td>
						<th>联系方式<span class="text-red">*</span>：
						</th>
						<td style="text-align: left;">${printVO.productionVO.contact}</td>
					</tr>
					<tr>
						<th class="t1c1">款式名称：</th>
						<td colspan="3" style="text-align: left;">
							${printVO.productionVO.designName}</td>
						<th>订单类型<span class="text-red">*</span>：
						</th>
						<td style="text-align: left;">${printVO.productionVO.orderType}</td>

					</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<!-- 订单信息-->
			<div class="col-md-2 col-md-offset-2">
				<h4>订单信息：</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<!-- 订单信息-->
				<table class="table-responsive table">
					<tr>
						<td style="width:70%;">
							<table class="table-bordered table">

								<tr class="t2r1">
									<th class="t2c1">颜色</th>
									<th>XS</th>
									<th>S</th>
									<th>M</th>
									<th>L</th>
									<th>XL</th>
									<th>XXL</th>
									<th>合计</th>
								</tr>
								<!-- iterator goes here:预计和实际剪裁-->
								<s:iterator value="printVO.productionVO.orderDetails"
									var="orderDetail">
									<tr>
										<td class="t2c1"><s:property value='color' /></td>
										<td><s:property value='XS' /></td>
										<td><s:property value='S' /></td>
										<td><s:property value='M' /></td>
										<td><s:property value='L' /></td>
										<td><s:property value='XL' /></td>
										<td><s:property value='XXL' /></td>
										<td><s:property value='total' /></td>
									</tr>
								</s:iterator>
								<s:iterator value="printVO.productionVO.orderDetails"
									var="orderDetail">
									<tr>
										<td class="t2c1">实裁（<s:property value='color' />）
										</td>
										<td><s:property value='actualXS' /></td>
										<td><s:property value='actualS' /></td>
										<td><s:property value='actualM' /></td>
										<td><s:property value='actualL' /></td>
										<td><s:property value='actualXL' /></td>
										<td><s:property value='actualXXL' /></td>
										<td><s:property value='actualTotal' /></td>
									</tr>
								</s:iterator>
								<tr>
									<th class="t2c1">特殊工艺</th>
									<td colspan="2">${printVO.productionVO.specialTechnique}</td>
									<th>
										<p>样板</p>

										<p>码数</p>
									</th>
									<td>${printVO.productionVO.sampleYardage}</td>
									<th>
										<p>面料</p>

										<p>成分</p>
									</th>
									<td colspan="2">${printVO.productionVO.shellIngredient}</td>
								</tr>
								<tr>
									<th class="t2c1">
										<p>备注</p>

										<p>（水洗标编码）</p>
									</th>
									<td colspan="7">
										<p>${printVO.productionVO.comment}</p>
									</td>
								</tr>

							</table>
						</td>
						<td align="center"><img src="<%=request.getContextPath()%>/images/1.png"
							class="commdity-graph"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2" >
				<table class="table-bordered table" >
					<tr>
						<th colspan="10">客供用料搭配明细</th>
					</tr>
					<tr>
						<th>面料属性</th>
						<th class="t3c2">物料名称</th>
						<th>主/辅料</th>
						<th>色号</th>
						<th>供应商名</th>
						<th>区域</th>
						<th class="t3c7">供应商电话</th>
						<th>订购数量</th>
						<th class="t3c9">说明</th>
						<th>确认人签名</th>
					</tr>
					<s:iterator value="printVO.materialDetails" var="materialDetail">
						<tr>
							<td><s:property value='orderMaterialAttr' /></td>
							<td class="t3c2"><s:property value='materialName' /></td>
							<td><s:property value='materialType' /></td>
							<td><s:property value='orderColorNum' /></td>
							<td><s:property value='vendorName' /></td>
							<td><s:property value='area' /></td>
							<td class="t3c7"><s:property value='vendorPhone' /></td>
							<td><s:property value='orderVol' /></td>
							<td class="t3c9"><s:property value='orderComment' /></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</s:iterator>
					<tr>
						<td colspan="10" style="text-align: left; min-height: 10%;">
							<p>
								<b>客户面辅料要求，配送方式等明细：</b>
							</p>
							<p>${printVO.otherComment}</p>
						</td>
					</tr>
					<tr>
						<td colspan="10" style="text-align: left; min-height: 10%;">
							<p>
								<b>工艺制作明细要求：</b>
							</p>
							<p>${printVO.techniqueComment}</p>
						</td>
					</tr>
					<tr>
						<th colspan="5" style="text-align: left;">是否核实录入BOM</th>
						<th rowspan="2" colspan="5">
							<p>填写说明</p>

							<p class="text-red">1、带*项目为必填项</p>

							<p>2、区域分中大、柯桥、义务、其他</p>
						</th>
					</tr>
					<tr>
						<th colspan="5" style="text-align: left;"><p>${printVO.BOMRegistered}</p></th>
					</tr>
				</table>
			</div>
		</div>

	</div>


	<!-- jQuery 2.0.2 -->
	<script src="js/jQuery-2.1.4.min.js"></script>
	<!-- jQuery UI 1.10.3 -->
	<script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>


</body>
</html>