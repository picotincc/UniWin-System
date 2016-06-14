<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<jsp:include page="../../header.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/technique.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
th {
	text-align: center;
}

td {
	text-align: center;
}

tr {
	background-color: transparent;
}
.tdLabel{
	color: #555555;
    font-size: 12px;
    margin-top: 8px;
}
</style>

<title>ZZL</title>
</head>

<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<!-- <header class="header"> <a href="index.html" class="logo">
		Add the class icon to your logo image or logo icon to add the margining
		智&nbsp造&nbsp链
	</a> Header Navbar: style can be found in header.less <nav
		class="navbar navbar-static-top" role="navigation"> </nav> </header> -->
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
			工艺管理 <small>新增款式工艺单</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Technique</li>
		</ol>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">新增款式工艺单</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form" method="post"
						action="" id="addTechnique" onsubmit="return submit()">
						<!-- 新增款式工艺单  -->
						<div class="row">
							<div class="col-md-8">

								<div class="table-responsive" style="margin: 0px 50px 50px 23px">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td><label class="my_label">编号</label></td>
												<td><input type="text" class="form-control"
													name="techCode" id="techCode" required="required" placeholder="请输入任2位字母加数字" onblur="checkDesignCode()"></td>
												<td><label class="my_label">款号</label></td>
												<td><select class="form-control" id="designCode" name="designCode" onchange="priceChange(this[selectedIndex].innerHTML);">
													<s:iterator value="designList" var="design">
														<option value="${design.designCode }" price="${design.designProcessPrice}" designName="${design.designName }"><s:property value="#design.designCode"></s:property></option>
													</s:iterator>
													</select>
													
												</td>
											</tr>
											<tr>
												<td><label class="my_label">制单日期</label></td>
												<td><input type="text" class="form-control" readonly
													name="techDate" value="${NowDay }"></td>
												<td><label class="my_label">参考外发价</label></td>
												<td><input type="text" class="form-control" readonly id="price" name="price"></td>
											</tr>
											<tr>
												<td><label class="my_label">名称</label></td>
												<td colspan="3"><input type="text" class="form-control" readonly id="tech_name"
													name="tech_name"></td>
											</tr>
											<tr>
												<td><label class="my_label">加工方姓名</label></td>
												<td>
												<select class="form-control" id="processorName" name="processorName" >
													<s:iterator value="processList" var="processor">
														<option value="${processor.processorID }"><s:property value="#processor.processorName"></s:property></option>
													</s:iterator>
												</select></td>
												<td><label class="my_label">工艺技术</label></td>
												<td><input type="text" class="form-control"
													name="technique" required="required"></td>
											</tr>
											<tr>
												<td><label class="my_label">面料分类</label></td>
												<td><input type="text" class="form-control"
													name="techShellType" required="required"></td>
												<td><label class="my_label">样板尺寸</label></td>
												<td><input type="text" class="form-control"
													name="techSampleSize" required="required"></td>
											</tr>
										</tbody>
									</table>
									<!-- /.table -->
								</div>
							</div>
						</div>

						<!-- 新增款式工艺单 end-->

						<!-- 工艺清单 -->
						<div class="box-header">
							<h3 class="box-title">工艺清单>></h3>
						</div>
						<!-- /.box-header -->
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<table class="table table-striped" id="tech_list">
								<thead>
									<tr>
										<th></th>
										<th><label class="my_label">部位名称</label></th>
										<th><label class="my_label">M码</label></th>
										<th><label class="my_label">公差（厘米）</label></th>
									</tr>
								</thead>
								<tbody >
									<tr id="0">
										<td><a id="addTable"
											class="btn btn-success" onclick="add_tech_list()"><i class="fa fa-plus"></i></a></td>
										<td><input type="text" class="form-control" id="list-0-partName" name="list-0-partName" required="required"></td>
										<td><select class="form-control" id="list-0-MCode" name="list-0-MCode">
												<option>XS</option>
												<option>S</option>
												<option>M</option>
												<option>L</option>
												<option>XL</option>
												<option>XXL</option>
										</select></td>
										<td><input type="text" class="form-control" id="list-0-InTolerance" name="list-0-InTolerance" required="required"></td>
									</tr>
								</tbody>
							</table>
							<!-- /.table -->
						</div>
						<!-- /.table-responsive -->
						<!-- 工艺清单  end-->

						<!-- 缝纫工艺 -->
						<div class="box-header">
							<h3 class="box-title">缝纫工艺流程>></h3>
						</div>
						<!-- /.box-header -->
						<div class="row">
							<div class="col-md-8">
								<div class="table-responsive" style="margin: 0px 50px 50px 23px">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td><label class="my_label">作缝大小</label></td>
												<td><input type="text" class="form-control"
													name="techJointSize" required="required"></td>
												<td><label class="my_label">线距</label></td>
												<td><input type="text" class="form-control"
													name="techLineDistance" required="required"></td>
											</tr>
											<tr>
												<td><label class="my_label">整烫要求</label></td>
												<td colspan="3"><input type="text" class="form-control"
													name="techPressingReq" required="required"></td>
											</tr>
											<tr>
												<td><label class="my_label">注意</label></td>
												<td colspan="3"><input type="text" class="form-control"
													name="techComment" required="required"></td>
											</tr>
										</tbody>
									</table>
									<!-- /.table -->
								</div>
							</div>

							<div class="table-responsive" style="margin: 0px 50px 50px 23px">
								<table class="table table-striped" id="tech_inventory">
									<tr>
										<th><label class="my_label">工艺部位</label></th>
										<th><label class="my_label">具体工艺</label></th>
										<th><label class="my_label">操作</label></th>
									</tr>
									<tr>
										<td><input type="text" class="form-control" id="tech_apart" name="tech_apart" required="required"></td>
										<td><input type="text" class="form-control" id="specific_tech" name="specific_tech" required="required"></td>
										<td><input type="button" value="添加" id="addTech"
											class="btn btn-primary" onclick="confirm();"><small>(点击添加后数据生效)</small></td>
									</tr>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- 缝纫工艺  end-->
						<button class="btn btn-primary" type="submit" style="display:none" id="sub">提交</button>
						<a class="btn btn-primary"  onclick="submit()"
											style="margin-bottom: 34px;margin-left:13px;" >提交</a> 
					</form>
				</div>
				<!-- /.box-->
			</div>
		</div>
		</section> </aside>
	</div>

	<script type="text/javascript">
		window.onload = changeTab("10600", "10601");
	</script>
	<script>
		//增加一行
		var add_tech_list = function(){
			
			var _len = $("#tech_list tr").length-2;
			
			//换图标
			$("#addTable i").removeClass().addClass("fa fa-minus");
			$("#addTable").attr("onclick","del("+_len+")");
			$("#addTable").attr("id","delete-"+_len);
			var new_len = _len+1;
			$("#tech_list").append("<tr id="+new_len+">"
					+"<td><a id='addTable' class='btn btn-success' onclick='add_tech_list()'><i class='fa fa-plus'></i></a></td>"
					+"<td> <input type='text' class='form-control' id='list-"+new_len+"-partName' name='list-"+new_len+"-partName' required></td>"
					+ "<td><select class='form-control' id='list-"+new_len+"-MCode' name='list-"+new_len+"-MCode'>"
					+ "<option>XS</option>"
					+ "<option>S</option>"
					+ "<option>M</option>"
					+ "<option>L</option>"
					+ "<option>XL</option>"
					+ "<option>XXL</option>"
					+ "</select></td>"
					+ "<td> <input type='text' class='form-control' id='list-"+new_len+"-InTolerance' name='list-"+new_len+"-InTolerance' required></td></tr>");
		}
		
		//删除一行
		var del = function(index){
			var _len = $("#tech_list tr").length-2;
			
			$("tr[id='"+index+"']").remove();
			var nextPartName,nextMCode,newInTolerance;
			var lastPartName,lastMCode,lastInTolerance;
			lastPartName = $("#list-"+_len+"-partName").val();
			lastMCode = $("#list-"+_len+"-MCode").val();
			lastInTolerance = $("#list-"+_len+"-InTolerance").val();
			for(var i=index+1;i<_len;i++){
				nextPartName = $("#list-"+i+"-partName").val();
				nextMCode = $("#list-"+i+"-MCode").val();
				nextInTolerance = $("#list-"+i+"-InTolerance").val();
				$("tr[id=\'" + i + "\']")
                			.replaceWith("<tr id="+(i-1)+">"
                					+"<td><a id='delete-'"+(i-1)+"' class='btn btn-success' onclick='del("+(i-1)+")'><i class='fa fa-minus'></i></a></td>"
                					+"<td> <input type='text' class='form-control' id='list-"+(i-1)+"-partName' value='"+nextPartName+"' name='list-"+(i-1)+"-partName' required></td>"
                					+ "<td><select class='form-control' id='list-"+(i-1)+"-MCode' name='list-"+(i-1)+"-MCode'>"
                					+ "<option>XS</option>"
                					+ "<option>S</option>"
                					+ "<option>M</option>"
                					+ "<option>L</option>"
                					+ "<option>XL</option>"
                					+ "<option>XXL</option>"
                					+ "</select></td>"
                					+ "<td> <input type='text' class='form-control' id='list-"+(i-1)+"-InTolerance' value='"+nextInTolerance+"' name='list-"+(i-1)+"-InTolerance' required></td></tr>");
				$("#list-"+(i-1)+"-MCode").val(nextMCode);
			}
			var new_len = _len-1;
			$("tr[id='"+_len+"']").replaceWith("<tr id="+new_len+">"
					+"<td><a id='addTable' class='btn btn-success' onclick='add_tech_list()'><i class='fa fa-plus'></i></a></td>"
					+"<td> <input type='text' class='form-control' id='list-"+new_len+"-partName' value='"+lastPartName+"'  name='list-"+new_len+"-partName' required></td>"
					+ "<td><select class='form-control' id='list-"+new_len+"-MCode' name='list-"+new_len+"-MCode'>"
					+ "<option>XS</option>"
					+ "<option>S</option>"
					+ "<option>M</option>"
					+ "<option>L</option>"
					+ "<option>XL</option>"
					+ "<option>XXL</option>"
					+ "</select></td>"
					+ "<td> <input type='text' class='form-control' id='list-"+new_len+"-InTolerance' value='"+lastInTolerance+"' name='list-"+new_len+"-InTolerance' required></td></tr>");
			$("#list-"+new_len+"-MCode").val(lastMCode);
		}
		
		function priceChange(val){
			var designCode = document.getElementById("designCode");
			var price = designCode.options[designCode.selectedIndex].getAttribute("price");
			var tech_name = designCode.options[designCode.selectedIndex].getAttribute("designName");
			document.getElementById("price").value=price;
			document.getElementById("tech_name").value = tech_name;
		}
		
		function confirm(){
			$("#tech_apart").attr("readonly","readonly");
			$("#specific_tech").attr("readonly","readonly");
		}
		
		function submit(){
			var _len = $("#tech_list tr").length-1;
			$("#addTechnique").attr("action","<%=request.getContextPath()%>/Technique/addTechnique?tech_list_size="+_len);
			$("#sub").click ();
		}
		function checkDesignCode(){
			var designCode = $("#techCode").val();
			var Regx = /^[A-Za-z0-9]{2}$/i;
			if(Regx.test(designCode)!=true){
				$("#techCode").focus().select();
				alert("请输入两位字母或数字");
			}
		}
		
	</script>
	
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>