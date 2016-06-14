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
			<span class="print-header"> 外发单 </span>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table-bordered table">
					<tr>
						<th>外发单号：</th>
						<td><s:property value="getOS.osCode" /></td>
						<th>预约交期：</th>
						<td>
							<s:date name="getOS.finishDate" format="yyyy-MM-dd"/>
						</td>

					</tr>
					<tr>
						<th>款号：</th>
						<td><s:property value="getOS.designCode" /></td>
						<th>款式名称：</th>
						<td><s:property value="getOS.designName" /></td>
					</tr>
					<tr>
						<th>排单时间：</th>
						<td>
							<s:date name="getOS.osScheduleDate" format="yyyy-MM-dd"/>
						</td>
						<th>外发时间：</th>
						<td>
							<s:date name="getOS.actualOutDate" format="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<th>订单优先级：</th>
						<td><span class="priority"><s:property value="getOS.osPriority" /></span></td>
						<th>数量：</th>
						<td><s:property value="getOS.sum" /></td>
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
				        <td><s:property value="#item.outsourceColor" /></td>
				        <td><s:property value="#item.outsourceXS" /></td>
				        <td><s:property value="#item.outsourceS" /></td>
				        <td><s:property value="#item.outsourceM" /></td>
				        <td><s:property value="#item.outsourceL" /></td>
				        <td><s:property value="#item.outsourceXL" /></td>
				        <td><s:property value="#item.outsourceXXL" /></td>
				        <td><s:property value="#item.outsourceTotal" /></td>
				    </tr>
				    </s:iterator>
					
				</table>				
			</div>
			<div class="col-md-2">
				<img src=${getOS.designImg} class="commdity-graph">			
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table-bordered table table-buttom" style="margin-top:20px">
					<tr>
						<th colspan="10">加工方信息</th>
					</tr>
					<tr>
						<th>加工方：</th>
						<td><s:property value="getOS.processorName" /></td>
						<th>联系电话：</th>
						<td><s:property value="getOS.processorMobile" /></td>
					</tr>
					<tr>
						<th>实际工价：</th>
						<td><s:property value="getOS.labourCost" /></td>
						<th>外发负责人：</th>
						<td><s:property value="getOS.userName" /></td>
					</tr>					
				</table>
			</div>
		</div>

	</div>


</body>
</html>