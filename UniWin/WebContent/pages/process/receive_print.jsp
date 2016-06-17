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
<link href="<%=request.getContextPath()%>/css/process_print.css"
	rel="stylesheet" type="text/css" />


<title>ZZL</title>
</head>

<body>
	<div class="container-fluid">
		<div class="row" align="center">
			<span class="print-header"> 收货单 </span>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table-bordered table">
					<tr>
						<th>外发单号：</th>
						<td><s:property value="getRO.outsourceCode" /></td>
						<th>收货日期：</th>
						<td>
							<s:date name="getRO.receiveDate" format="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<th>数量：</th>
						<td><s:property value="getRO.sum" /></td>
						<th>收货人：</th>
						<td><s:property value="getRO.userName" /></td>
					</tr>


					
				</table>
			</div>
		</div>

		<div class="row">
			<!-- 详细信息-->
			<div class="col-md-2 col-md-offset-1">
				<h4>详细信息：</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
				<!-- 详细信息-->
				<table class="table-responsive table-bordered table">											
					<tr class="detail-th">
						<th>颜色</th>
						<th>XS</th>
						<th>S</th>
						<th>M</th>
						<th>L</th>
						<th>XL</th>
						<th>XXL</th>
						<th>合计</th>
					</tr>						
				    <s:iterator value="getDetails" var="item">
				    <tr>
				        <td><s:property value="#item.receiveColor" /></td>
				        <td><s:property value="#item.receiveXS" /></td>
				        <td><s:property value="#item.receiveS" /></td>
				        <td><s:property value="#item.receiveM" /></td>
				        <td><s:property value="#item.receiveL" /></td>
				        <td><s:property value="#item.receiveXL" /></td>
				        <td><s:property value="#item.receiveXXL" /></td>
				        <td><s:property value="#item.receiveTotal" /></td>
				    </tr>
				    </s:iterator>
					
				</table>				
			</div>
			<div class="col-md-2">
				<img src=${getRO.designImgUrl} class="commdity-graph">			
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table-bordered table" style="margin-top:20px">
					<tr>
						<th colspan="10">加工方信息</th>
					</tr>
					<tr>
						<th>加工方：</th>
						<td><s:property value="getRO.processorName" /></td>
						<th>联系电话：</th>
						<td><s:property value="getRO.processorMobile" /></td>
					</tr>
					<tr>
						<th>加工方区域：</th>
						<td><s:property value="getRO.processorDistrict" /></td>
						<th>送货类型：</th>
						<td><s:property value="getRO.deliveryType" /></td>
					</tr>					
				</table>
			</div>
		</div>

	</div>


</body>
</html>