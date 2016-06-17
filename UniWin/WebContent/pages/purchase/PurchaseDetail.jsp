<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<jsp:include page="../../header.jsp"></jsp:include>
<title>ZZL-款式采购信息</title>
<style type="text/css">
        .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.input-group,.form-group{position: relative;float: left;width: 100%;}
.form-control{float: left;width: 100%;}
label {color: #555555;font-size: 12px; margin-left: 10px;}
#search-purchaselist{position: relative;float: left;width: 8%;height:34px;margin-left: 15px;margin-top: 23px;}
.table-responsive{margin-top: 10px;}
.table{border-top: 3px solid #7D9EC0;}
th{font-size: 12px;color: #4F4F4F;text-align: center;}
td{text-align: center;font-size:14px;}
tr{background-color:transpare}
.item-name{color:#0000ff;}
.qcCode{color:#008080;}
.commdity-graph{width: 60px;height: 80px;}
    </style>
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
		<h1> 采购管理
		<small>款式采购信息</small>
        </h1>
        <ol class="breadcrumb">
        <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">面料采购单管理</li>
        </ol>
		</section>
		<!-- Main content -->
            <section class="content">
            	<div class="container-fluid">
            	<!-- 款式采购信息 -->
            		<div class="row">
            			<div class="col-md-12">
            			
            				<div class="row">
            					<div class="col-md-4">
									<div class="input-group">
									<span>新/老款：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.designNewOld}" readonly>
									</div>
								</div>
								
								<div class="col-md-4">
									<div class="input-group">
									<span>编号：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.purchaseCode}" readonly>
									</div>
								</div>
            				</div>
            				
            				<div class="row">
            					<div class="col-md-4">
									<div class="input-group">
									<span>款号：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.designCode}" readonly>
									</div>
								</div>
									
								<div class="col-md-4">
									<div class="input-group">
									<span>客户姓名：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.customerName}" readonly>
									</div>
								</div>
								
								<div class="col-md-4">
									<div class="input-group">
									<span>制单日期：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.purDocumentDate}" readonly>
									</div>
								</div>
								
            				</div>
            				<div class="row">
            					<div class="col-md-8">
									<div class="input-group">
									<span>名称：</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.designName}" readonly>
									</div>
								</div>
            				</div>
            				
            			</div>
            		</div>
            		
            		<div class="row">
						<div class="col-md-2">
						<span>生产单信息：</span>
						</div>
					</div>
            		<div class="row">
            			<div class="col-md-10">
            				<div class="row">
            					<div class="table-responsive">
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
												<s:iterator value="purchaseVO.orderDetails" var="orderDetailVO">
													<tr>
														<td><s:property value='color'/></td>
														<td><s:property value='XS'/></td>
														<td><s:property value='S'/></td>
														<td><s:property value='M'/></td>
														<td><s:property value='L'/></td>
														<td><s:property value='XL'/></td>
														<td><s:property value='XXL'/></td>
														<td><s:property value='total'/></td>
													</tr>
												</s:iterator>
            						</table>
            					</div>
            					
            				
            				</div>
            			
            			</div>
            		</div>
            		<div class="row">
            		<span>面料信息：</span>
            		</div>
            		<div class="row">
            			<div class="col-md-8">
            				<div class="row">
            					<div class="table-responsive">
            						<table class="table table-striped">
            							<tr>
										<th>部位</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>单价</th>
										<th>主/辅料</th>
										<th>色号</th>
										<th>单件用量</th>
										<th>数量</th>
										</tr>
											<!-- iterator goes here and set data dynamically-->
												<s:iterator value="purchaseVO.materials" var="bomVO">
													<tr>
														<td><s:property value="#bomVO.materialPosition"/></td>
														<td><s:property value="#bomVO.materialCode"/></td>
														<td><s:property value="#bomVO.materialName"/></td>
														<td><s:property value="#bomVO.unitPrice"/></td>
														<td><s:property value="#bomVO.materialType"/></td>
														<td><s:property value="#bomVO.colorCode"/></td>
														<td><s:property value="#bomVO.volPerDesign"/></td>
														<td><s:property value="#bomVO.totalVol"/></td>
													</tr>
												</s:iterator>
            						</table>
            					</div>
            				</div>
            			</div>
            			<div class="col-md-4">
            				<img src="../images/1.png"class="commdity-graph">
            			</div>
            		</div>
            		<div class="row">
            			<span>面料信息：</span>
            		</div>
            		<div class="row">
            			<div class="col-md-12">
            				<div class="row">
            					<div class="col-md-2">
									<div class="input-group">
									<span>计划采购时间</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.scheduledPurchaseDate}" >
									</div>
								</div>
								<div class="col-md-5">
									<div class="input-group">
									<span>供应商|电话</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.vendors}" readonly>
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
									<span>负责人</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.userName}" >
									</div>
								</div>
            				</div>
            				<div class="row">
            					<div class="col-md-8">
									<div class="input-group">
									<span>备注</span> <input id="design_name" type="text"
									class="form-control form-input" maxlength="20"
									value="${purchaseVO.purchaseComment}" >
									</div>
								</div>
            				</div>
            			</div>
            		</div>
            		<div class="row" text-align:center>
            			<button type="button" id="returnPrevPage"class="btn btn-primary" onclick="history.go(-1);">退出</button>
            		</div>
            	</div>
            </section>
		</aside>
	</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

</body>
</html>