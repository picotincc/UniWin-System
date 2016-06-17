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

<%@ include file="../../header.jsp"%>
<link href="../css/osiStyle.css" rel="stylesheet" type="text/css" />
<link href="../css/inquiry.css" rel="stylesheet" type="text/css" />

<title>智造链-询价单</title>
</head>
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<!-- <header class="header"> <a href="index.jsp" class="logo">
		Add the class icon to your logo image or logo icon to add the margining
		智&nbsp造&nbsp链
	</a> Header Navbar: style can be found in header.less <nav
		class="navbar navbar-static-top" role="navigation"> </nav> </header> -->
	<s:if test="#request.session.account!=null">
     <!-- 人物头像 -->
	 <jsp:include page="../../headSculpture.jsp"></jsp:include>
	 <!-- 人物头像 -->

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- 左边导航栏  -->
		<jsp:include page="../../navigation.jsp"></jsp:include>

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side"> <!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			Dashboard <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
		</section> <!-- Main content --> <section class="content">
		<div class="inquiryDetail">
			<div class="png_area">
				<img src="../images/1.png" id="design_image">
			</div>
			<div class="inquiryInfo">
				<table class="table" id="infoTable">
					<tbody>
						<tr>
							<td style="min-width: 100px;">询价单编码：</td>
							<td><s:property value="inquiry.inquiryCode" /></td>
						</tr>
						<tr>
							<td>款式名称：</td>
							<td><s:property value="inquiry.design.designName" /></td>
						</tr>
						<tr>
							<td>款式类型：</td>
							<td><s:property value="inquiry.design.designType" /></td>
						</tr>
						<tr>
							<td>样衣：</td>
							<td><s:property value="inquiry.inquiryMaterialSample" /></td>
						</tr>
						<tr>
							<td>加工周期：</td>
							<td><s:property value="inquiry.inquiryProcessCycle" />天</td>
						</tr>
						<tr>
							<td>合计件数：</td>
							<td><s:property value="inquiry.inquiryTotal" />件</td>
						</tr>
					</tbody>
				</table>

			</div>
			<ul class="inquiryProgress">
				<s:if test="inquiry.inquiryProgress=='无'">
					<li><img src="../images/point.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a>面料进行中..</a></li>
				</s:if>
				<s:else>
					<li><img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-success">面料OK</button> <a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<s:property value="inquiry.inquiryProgressDate" />
					</a></li>
					<s:if test="inquiry.inquiryProgress!='面料OK'">
						<li><img src="../images/line.jpg" id="lineIcon"></li>
						<li><img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success">辅料OK</button> <a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:property value="inquiry.inquiryProgressDate" />
						</a></li>
						<s:if test="inquiry.inquiryProgress!='辅料OK'">
							<li><img src="../images/line.jpg" id="lineIcon"></li>
							<li><img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-success">花型OK</button> <a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<s:property value="inquiry.inquiryProgressDate" />
							</a></li>
							<s:if test="inquiry.inquiryProgress!='花型OK'">
								<li><img src="../images/line.jpg" id="lineIcon"></li>
								<li><img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-success">版型OK</button> <a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<s:property value="inquiry.inquiryProgressDate" />
								</a></li>
								<s:if test="inquiry.inquiryProgress=='加工OK'">
									<li><img src="../images/line.jpg" id="lineIcon"></li>
									<li><img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-success">加工OK</button> <a>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<s:property value="inquiry.inquiryProgressDate" />
									</a></li>
								</s:if>
							</s:if>
						</s:if>
					</s:if>
				</s:else>
			</ul>
			<div class="table-responsive" style="margin: 0px 50px 50px 23px">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td><label class="my_label">样板码数</label></td>
							<td><s:property value="inquiry.order.orderSampleYardage" /></td>
							<td><label class="my_label">水洗标要求</label></td>
							<td colspan="3"><s:property
									value="inquiry.order.orderSewnInLabelReq" /></td>
						</tr>
						<tr>
							<td><label class="my_label">工艺制作要求</label></td>
							<td colspan="5"><s:property
									value="inquiry.order.orderTechReq" /></td>
						</tr>
						<tr>
							<td><label class="my_label">其他备注</label></td>
							<td colspan="5"><s:property
									value="inquiry.order.orderComment" /></td>
						</tr>
					</tbody>
				</table>
				<!-- /.table -->
			</div>
			<br />
			<div class="table-responsive" style="margin: 0px 50px 50px 23px">
				<table class="table table-striped">
					<tr>
						<th>颜色</th>
						<th>XS</th>
						<th>S</th>
						<th>M</th>
						<th>L</th>
						<th>XL</th>
						<th>XXL</th>
						<th>合计</th>
					</tr>
					<s:iterator value="inquiry.order.orderDetails" var="detail">
						<tr>
							<!--  <td><input type="radio" name="select"></td>	-->
							<!--<td><s:property value="#designItem.designPicURL" /></td>-->
							<td><s:property value="#detail.orderColor" /></td>
							<td><s:property value="#detail.orderXS" /></td>
							<td><s:property value="#detail.orderS" /></td>
							<td><s:property value="#detail.orderM" /></td>
							<td><s:property value="#detail.orderL" /></td>
							<td><s:property value="#detail.orderXL" /></td>
							<td><s:property value="#detail.orderXXL" /></td>
							<td><s:property value="#detail.totalNum" /></td>
						</tr>
					</s:iterator>
				</table>
				<!-- /.table -->
			</div>

			<a>面料费用>></a><br /> <br />
			<div class="table-responsive" style="margin: 0px 50px 50px 23px">
				<table class="table table-striped">
					<tr>
						<th>物料属性</th>
						<th>面／辅料</th>
						<th>色号</th>
						<th>供应商</th>
						<th>联系方式</th>
						<th>订购数量</th>
						<th>备注说明</th>

					</tr>
					<s:iterator value="inquiry.order.orderMaterialDetails" var="orderMaterial">
						<tr>
                          	<td><s:property value="#orderMaterial.orderMaterialAttr"/></td>
                            <td style="min-width:50px;"><s:property value="#orderMaterial.supply.material.materialType"/></td>
                            <td><s:property value="#orderMaterial.supply.material.colorCode"/></td>
                           	<td><s:property value="#orderMaterial.supply.vendor.vendorName"/></td>
                            <td><s:property value="#orderMaterial.supply.vendor.vendorPhoneNum"/></td>
                            <td style="min-width:50px;"><s:property value="#orderMaterial.orderVol"/></td>
                            <td><s:property value="#orderMaterial.orderComment"/></td>
                       	</tr> 
					</s:iterator>
				</table>
				<!-- /.table -->
			</div>
			<div class="inquiry_btn">
				<button type="button" class="btn btn-primary"
					style="margin-top: 34px"
					onclick="window.location='<%=request.getContextPath()%>/Inquiries/show_inquiry_list'">退出</button>
				<button type="button" class="btn btn-primary"
					style="margin-top: 34px" data-toggle="modal" data-target="#myModal">申请修改报价</button>
			</div>


			<!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel" style="color: white;">辅料报价</h4>
						</div>
						<div class="modal-body">
							<h4>辅料核价</h4>
							<form role="form" method="post" id="checkFuliao"
								action="">
								<div class="table-responsive" style="margin: 0px 50px 50px 23px">
									<table class="table" frame="void" id="fuliao_list">
										<tbody>
										<tr id="0">
											<td><label class="my_label">辅料</label></td>
											<td>
											<!-- <input type="text" class="form-control" id="list-0-fuliao"> -->
											<select class="form-control" id="list-0-fuliao" name="list-0-fuliao" onchange="priceChange(0);">
													<s:iterator value="materials" var="material">
														<option value="${material.materialCode }" price="${material.unitPrice }"><s:property value="#material.materialName"></s:property></option>
													</s:iterator>
													</select>
											</td>
											<td><label class="my_label">费用</label></td>
											<td><input type="text" class="form-control" id="list-0-cost" name="list-0-cost" readonly></td>
											<td><label class="my_label">元／米</label>
											</td>
											<td><label class="my_label">用量</label></td>
											<td><input type="text" class="form-control" id="list-0-counter" name="list-0-counter"></td>
											<td><a id="addTable"
												class="btn btn-success" onclick="add_fuliao_list()"><i class="fa fa-plus"></i></a></td>
										</tr>
										</tbody>
									</table>
									<!-- /.table -->
									
									
								</div>
								<div class="table-responsive" style="margin: 0px 50px 50px 23px">
								<table class="table" frame="void">
										<tbody>
										<tr>
											<td><label class="my_label">备注</label></td>
											
											<td><input type="text" class="form-control"></td>
											<td></td>
										</tr>
										<tr>
										<td></td>
										<td></td>
										<td><a class="btn btn-primary" style="float:right;" id="my_button" onclick="submit();">提交</a></td>
										
										</tr>
										</tbody>
									</table>
								</div>
								</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		</section> </aside>
	</div>
	       <script type="text/javascript">
        	window.onload = changeTab("11100","11101");
    	</script>
<script>
	//增加一行
	var add_fuliao_list = function(){
	
	var _len = $("#fuliao_list tr").length-1;
	//换图标
	$("#addTable i").removeClass().addClass("fa fa-minus");
	$("#addTable").attr("onclick","del("+_len+")");
	$("#addTable").attr("id","delete-"+_len);
	var new_len = _len+1;
	$("#fuliao_list").append("<tr id='"+new_len+"'><td><label class='my_label'>辅料</label></td>"
			+"<td><select class='form-control' id='list-"+new_len+"-fuliao' name='list-"+new_len+"-fuliao' onchange='priceChange("+new_len+");'>"
			+"<s:iterator value='materials' var='material'>"
			+"<option value='${material.materialName }' price='${material.unitPrice }'><s:property value='#material.materialName'></s:property></option>"
			+"</s:iterator></select></td>"
			+"<td><label class='my_label'>费用</label></td>"
			+"<td><input type='text' class='form-control' id='list-"+new_len+"-cost' name='list-"+new_len+"-cost' readonly></td>"
			+"<td><label class='my_label'>元／米</label></td>"
			+"<td><label class='my_label'>用量</label></td>"
			+"<td><input type='text' class='form-control'id='list-"+new_len+"-counter' name='list-"+new_len+"-counter'></td>"
			+"<td><a id='addTable' class='btn btn-success' onclick='add_fuliao_list()'><i class='fa fa-plus'></i></a></td></tr>");
}

	//删除一行
	var del = function(index){
	var _len = $("#fuliao_list tr").length-1;
	
	$("tr[id='"+index+"']").remove();
	var nextFuliao,nextCost,newCounter;
	var lastFuliao,lastCost,lastCounter;
	lastCost = $("#list-"+_len+"-cost").val();
	lastCounter = $("#list-"+_len+"-counter").val();
	for(var i=index+1;i<_len;i++){
		nextCost = $("#list-"+i+"-cost").val();
		nextCounter = $("#list-"+i+"-counter").val();
		$("tr[id=\'" + i + "\']")
        			.replaceWith("<tr id='"+(i-1)+"'><td><label class='my_label'>辅料</label></td>"
        					+"<td><select class='form-control' id='list-"+(i-1)+"-fuliao' name='list-"+(i-1)+"-fuliao' onchange='priceChange("+(i-1)+");'>"
        					+"<s:iterator value='materials' var='material'>"
        					+"<option value='${material.materialName }' price='${material.unitPrice }'><s:property value='#material.materialName'></s:property></option>"
        					+"</s:iterator></select></td>"
        					+"<td><label class='my_label'>费用</label></td>"
        					+"<td><input type='text' class='form-control' id='list-"+(i-1)+"-cost' value='"+nextCost+"' name='list-"+(i-1)+"-cost' readonly></td>"
        					+"<td><label class='my_label'>元／米</label></td>"
        					+"<td><label class='my_label'>用量</label></td>"
        					+"<td><input type='text' class='form-control'id='list-"+(i-1)+"-counter' value='"+nextCounter+"' name='list-"+(i-1)+"-counter'></td>"
        					+"<td><a id='delete("+(i-1)+")' class='btn btn-success' onclick='del("+(i-1)+")'><i class='fa fa-plus'></i></a></td></tr>");
	}
	var new_len = _len-1;
	$("tr[id='"+_len+"']").replaceWith("<tr id='"+new_len+"'><td><label class='my_label'>辅料</label></td>"
			+"<td><select class='form-control' id='list-"+new_len+"-fuliao' name='list-"+new_len+"-fuliao' onchange='priceChange("+new_len+");'>"
			+"<s:iterator value='materials' var='material'>"
			+"<option value='${material.materialName }' price='${material.unitPrice }'><s:property value='#material.materialName'></s:property></option>"
			+"</s:iterator></select></td>"
			+"<td><label class='my_label'>费用</label></td>"
			+"<td><input type='text' class='form-control' id='list-"+new_len+"-cost' value='"+lastCost+"' name='list-"+new_len+"-cost' readonly></td>"
			+"<td><label class='my_label'>元／米</label></td>"
			+"<td><label class='my_label'>用量</label></td>"
			+"<td><input type='text' class='form-control'id='list-"+new_len+"-counter' value='"+lastCounter+"' name='list-"+new_len+"-counter'></td>"
			+"<td><a id='addTable' class='btn btn-success' onclick='add_fuliao_list()'><i class='fa fa-plus'></i></a></td></tr>");
}
	var priceChange = function(index){
		var fuliao_id = "list-"+index+"-fuliao";
		var fuliao = document.getElementById(fuliao_id);
		var price = fuliao.options[fuliao.selectedIndex].getAttribute("price");
		var cost_id = "list-"+index+"-cost";
		document.getElementById(cost_id).value=price;
	}
	function submit(){
		var _len = $("#fuliao_list tr").length;
		$("#checkFuliao").attr("action","<%=request.getContextPath()%>/Inquiries/checkFuliao?fuliao_list_size="+_len);
		
		$("#checkFuliao").submit();
	}
	</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>