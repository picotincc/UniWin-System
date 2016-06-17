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
<style type="text/css">
.error {
	color: #FF3030;
	font-family: "Arial";
	font-size: 8px;
}

th {
	text-align: center;
}

td {
	text-align: center;
}
</style>

<title>ZZL</title>
</head>

<body class="skin-blue">
	<!--  
	<header class="header"> 
		<a href="index.html" class="logo">
		智&nbsp造&nbsp链
		</a>
		<nav class="navbar navbar-static-top" role="navigation"> 
		</nav> 
	</header>
	-->

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
				加工管理 <small>加工方管理</small>
			</h1>
			</section> <!-- Main content --> <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">

						<div class="box-header">
							<h3 class="box-title">加工方管理</h3>
						</div>
						<!-- /.box-header -->

						<!-- 查询与按钮  -->
						<div class="row">
							<!-- 查询   -->
							<div class="col-md-8">
								<!-- form start -->
								<form
									action="<%=request.getContextPath()%>/Process/queryProcessor"
									method="post">
									<div class="row">
										<div class="col-md-6">
											<div class="box-body">
												<label>加工方名称： </label> <input type="text"
													class="form-control" name="processorName"
													value=${processorName}>
											</div>
										</div>
										<div class="col-md-2">
											<button type="submit" class="btn btn-primary"
												style="margin-top: 34px">查询</button>
										</div>
									</div>
								</form>
							</div>

							<div class="col-md-2"></div>

							<!-- 新增与收货按钮  -->
							<div class="col-md-2">
								<div class="row">
									<button type="button" class="btn btn-warning"
										style="margin: 5px 5px 5px 75px" data-toggle="modal"
										data-target="#addProcessor">新增</button>
								</div>
								<div class="row">
									<button type="button" class="btn btn-primary"
										style="margin: 5px 5px 15px 75px" data-toggle="modal"
										onclick="receiveModel()">收货</button>
								</div>
							</div>

						</div>

						<!-- 表格  -->
						<div class="row">
							<div class="table-responsive" style="margin: 0px 50px 50px 23px">
								<table class="table table-striped">
									<tr>
										<th></th>
										<th>加工方名称</th>
										<th>加工方编号</th>
										<th>等级</th>
										<th>状态</th>
										<th>手机</th>
										<th>加工方地址</th>
										<th>加工方区域</th>
										<th>送货类型</th>
									</tr>
									<tbody>
										<s:iterator value="PageBean.list" var="processorItem">
											<tr onclick="javascript:judgeSelected(this)">
												<td><input type="radio" name="select"> <input
													type="hidden" name="selectedCode"
													value=${processorItem.processorCode} ></td>
												<td><s:property value="#processorItem.processorName" /></td>
												<td><s:property value="#processorItem.processorCode" /></td>
												<td><s:property value="#processorItem.processorRank" /></td>
												<td><s:property value="#processorItem.processorState" /></td>
												<td><s:property
														value="#processorItem.processorMobileNum" /></td>
												<td><s:property value="#processorItem.processorAddr" /></td>
												<td><s:property
														value="#processorItem.processorDistrict" /></td>
												<td><s:property value="#processorItem.deliveryType" /></td>
											</tr>
										</s:iterator>
									</tbody>
								</table>
								<!-- /.table -->
								<jsp:include page="../../page.jsp">
									<jsp:param name="action" value="processorlist" />
								</jsp:include>
							</div>
							<!-- /.table-responsive -->
							<!-- 分页 -->
						</div>

						<!-- /.table-row -->
					</div>
					<!-- /.box-->
				</div>
			</div>
			</section> </aside>

		</div>


		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addProcessor" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: 300px; width: 820px">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #00c0ef">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="color: white">新增加工方</h4>
					</div>
					<div class="modal-body">
						<div class="table" style="margin-top: 10px;">
							<!-- .table - Uses sparkline charts-->
							<form id="addForm" action="<%=request.getContextPath()%>/Process/addProcessor"
								method="post">
								<table class="table" rules="none" frame="void">
									<tr>
										<td>加工方编号<span style="color: red">*</span>：
										</td>
										<td><input type="text" id="new_Code" name="new_Code"></td>
										<td>加工方名称<span style="color: red">*</span>：
										</td>
										<td><input type="text" id="new_Name" name="new_Name"></td>
										<td>状态<span style="color: red">*</span>：
										</td>
										<td><select name="new_State">
												<option value="启用">启用</option>
												<option value="停用">停用</option>
										</select></td>
									</tr>
									<tr>
										<td>初始密码<span style="color: red">*</span>：
										</td>
										<td><input type="text" id="new_Password" name="new_Password"></td>
										<td>加工方手机<span style="color: red">*</span>：
										</td>
										<td><input type="text" id="new_Mobile" name="new_Mobile"></td>
										<td>等级<span style="color: red">*</span>：
										</td>
										<td><select name="new_Rank">
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="E">E</option>
										</select></td>
									</tr>
									<tr>
										<td>加工方地址<span style="color: red">*</span>：
										</td>
										<td colspan="3"><input type="text" style="width: 95%"
											id="new_Addr" name="new_Addr"></td>
										<td>加工人数<span style="color: red">*</span>：
										</td>
										<td><input type="text" style="width: 50%"
											id="new_WorkerNum" name="new_WorkerNum"></td>
									</tr>
									<tr>
										<td>加工方区域<span style="color: red">*</span>：
										</td>
										<td colspan="3"><input type="text" style="width: 95%"
											id="new_District" name="new_District"></td>
										<td>送货类型<span style="color: red">*</span>：
										</td>
										<td><select name="new_DeliveryType">
												<option value="送货">送货</option>
												<option value="自提">自提</option>
										</select></td>
									</tr>
									<tr>
										<td>起始时间<span style="color: red">*</span>：
										</td>
										<td><input type="text" name="new_StartingDate"></td>
										<td>备注：</td>
										<td><input type="text" name="new_Comment"></td>
										<td></td>
										<td><button type="submit" class="btn btn-primary">
												保存</button></td>
									</tr>

								</table>
								<!-- /.table -->
							</form>
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


		<!-- 模态框（Modal） -->
		<div class="modal fade" id="newReceive" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: 250px; width: 650px">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #00c0ef">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" style="color: white">加工方收货</h4>
					</div>
					<div class="modal-body">
						<div class="table" style="margin-top: 10px;">
							<!-- .table - Uses sparkline charts-->
							<table class="table" rules="none" frame="void">
								<tr>
									<td>加工方编号：</td>
									<td><input type="text" id="processor_Code"></td>
									<td>外发单号：</td>
									<td><input type="text" id="outsource_Code" value="outcode001"></td>
									<td style="width: 40px"></td>
									<td><button type="button" class="btn btn-danger"
											onclick="newReceive()" style="margin: auto">收货</button></td>
								</tr>

							</table>
							<!-- /.table -->
							</form>
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

		<script type="text/javascript">
			window.onload = changeTab("10300", "10301");
		</script>

		<script type="text/javascript">
			function receiveModel() {
				var selectedCode = $(".checked + input[name='selectedCode']")
						.val();
				if (selectedCode != null) {
					$("#processor_Code").val(selectedCode);
					$('#processor_Code').attr("readonly", true);
					$('#newReceive').modal('show');
				} else {
					alert("请选择");
				}
			}

			function newReceive() {
				var p_code = $("#processor_Code").val()
				var os_code = $("#outsource_Code").val();
				if (os_code != null) {
					location.href = getRootPath()
							+ "/pages/process/receive_new.jsp?pcode=" + p_code
							+ "&oscode=" + os_code;
				}
			}

			function getRootPath() {
				var curWwwPath = window.document.location.href;
				var pathName = window.document.location.pathname;
				var pos = curWwwPath.indexOf(pathName);
				var localhostPath = curWwwPath.substring(0, pos);
				var projectName = pathName.substring(0, pathName.substr(1)
						.indexOf('/') + 1);
				return (localhostPath + projectName);
			}
		</script>

		<script type="text/javascript">
			formValidate();
			function formValidate() {
				// 在键盘按下并释放及提交后验证提交表单
				$("#addForm").validate({
					"rules" : {
						"new_Code" : {
							'required' : true,
						},
						"new_Name" : {
							'required' : true,							
						},
						"new_Password" : {
							'required' : true,							
						},
						"new_Mobile" : {
							'required' : true,							
						},
						"new_Addr" : {
							'required' : true,							
						},
						"new_WorkerNum" : {
							'required' : true,							
						},
						"new_District" : {
							'required' : true,							
						}
					}
				});
			}
		</script>



	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>


</body>
</html>