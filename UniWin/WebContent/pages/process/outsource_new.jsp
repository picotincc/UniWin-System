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

.out-info {
	text-align: right;
	padding: 15px;
}

th {
	text-align: center;
}

td>input {
	width: 108px;
}
</style>

<title>ZZL</title>
</head>

<body class="skin-blue">
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
				加工管理 <small>新增外发单</small>
			</h1>
			</section> <!-- Main content --> <section class="content">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<div class="box box-primary">
						<form id="addForm" action="<%=request.getContextPath()%>/Process/addOutSource"
							method="post">
							<div class="box-header">
								<h3 class="box-title">新增外发单</h3>
							</div>
							<!-- /.box-header -->
							<div class="row">
								<div class="col-md-10">
									<div class="box-body">

										<table style="padding: 15px; margin: 20px">
											<tr>
												<td class="out-info">外发单号：</td>
												<td><input type="text" id="outSourceCode" name="outSourceCode"
													placeholder="outsourceCode"></td>
												<td class="out-info">生产单号：</td>
												<td><input type="text" id="productionCode" name="productionCode"
													placeholder="productionCode"></td>
											</tr>
											<tr>
												<td class="out-info">款号：</td>
												<td><input type="text" id="designCode" name="designCode"
													placeholder="designCode"></td>
												<td class="out-info">款式名称：</td>
												<td><input type="text" name="designName"></td>
											</tr>
											<tr>
												<td class="out-info">约定完成日期：</td>
												<td><input type="text" class="date-picker" id="finishDate"
													name="finishDate"></td>
												<td class="out-info">排单时间：</td>
												<td><input type="text" class="date-picker" id="osScheduleDate"
													name="osScheduleDate"></td>
											</tr>
											<tr>
												<td class="out-info">订单优先级：</td>
												<td><input type="text" name="outSourceRank"></td>
												<td class="out-info">订单状态：</td>
												<td><select name="outSourceState">
														<option value="待收货">待收货</option>
														<option value="部分收货">部分收货</option>
														<option value="已收货">已收货</option>
												</select></td>
											</tr>
										</table>

									</div>


								</div>

							</div>

							<div class="row">
								<div class="col-md-2">
									<span size="3px"
										style="margin: 0px 10px 20px 20px; color: blue">外发信息>></span>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="table-responsive"
										style="margin: 10px 15px 20px 23px">
										<table class="table table-striped" id="tab-detail">
											<tr>
												<th>颜色</th>
												<th>XS</th>
												<th>S</th>
												<th>M</th>
												<th>L</th>
												<th>XL</th>
												<th>XXL</th>
												<th>合计</th>
												<th>操作</th>
											</tr>
											<tr id="0">
												<td><input type="text"
													name="details_add[0].outsourceColor" id="detail-0-color"></td>
												<td><input type="text"
													name="details_add[0].outsourceXS" id="detail-0-xs"
													value="0"></td>
												<td><input type="text" name="details_add[0].outsourceS"
													id="detail-0-s" value="0"></td>
												<td><input type="text" name="details_add[0].outsourceM"
													id="detail-0-m" value="0"></td>
												<td><input type="text" name="details_add[0].outsourceL"
													id="detail-0-l" value="0"></td>
												<td><input type="text"
													name="details_add[0].outsourceXL" id="detail-0-xl"
													value="0"></td>
												<td><input type="text"
													name="details_add[0].outsourceXXL" id="detail-0-xxl"
													value="0"></td>
												<td><input type="text"
													name="details_add[0].outsourceTotal" id="detail-0-sum"
													value="0" disabled></td>
												<td><a class="btn btn-success" id="add"
													onclick="addDetail()"> <i class="fa fa-plus"></i>
												</a></td>
											</tr>

										</table>
										<!-- /.table -->
									</div>
									<!-- /.table-responsive -->
								</div>
							</div>
							<!-- /.table-row -->


							<div class="row">
								<div class="col-md-10">
									<div class="box-body">
										<table style="padding: 10px; margin: 10px">
											<tr>
												<td class="out-info">实际工价：</td>
												<td><input type="text" id="labourCost" name="labourCost"></td>
												<td class="out-info">加工方：</td>
												<td><input type="text" id="processorCode" name="processorCode" 
													placeholder="processorCode"></td>
												<td class="out-info">实际外发时间：</td>
												<td><input type="text" class="date-picker" id="actualOutDate"
													name="actualOutDate"></td>
											</tr>
											<tr>
												<td class="out-info">实际数量：</td>
												<td><input type="text" name="sum" disabled></td>
												<td class="out-info">联系电话：</td>
												<td><input type="text" name="mobile" disabled></td>
												<td class="out-info">外发负责人：</td>
												<td><input type="text" id="userName" name="userName" 
													placeholder="userAccount"></td>
											</tr>

											<tr>
												<td>
													<button class="btn btn-primary" type="submit">保存</button>
												</td>
											</tr>

										</table>
									</div>


								</div>

							</div>

						</form>
					</div>
					<!-- /.box-->
				</div>
			</div>
			</section> </aside>
		</div>

		<script type="text/javascript">
			window.onload = changeTab("10300", "10303");
			$('.date-picker').datetimepicker({
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


		<script>
			var addDetail = function() {
				var _len = $("#tab-detail tr").length - 2;

				//禁用输入
				$("#detail-" + _len + "-color").attr("readonly", "readonly");
				$("#detail-" + _len + "-xs").attr("readonly", "readonly");
				$("#detail-" + _len + "-s").attr("readonly", "readonly");
				$("#detail-" + _len + "-m").attr("readonly", "readonly");
				$("#detail-" + _len + "-l").attr("readonly", "readonly");
				$("#detail-" + _len + "-xl").attr("readonly", "readonly");
				$("#detail-" + _len + "-xxl").attr("readonly", "readonly");

				//求总和
				var sum = parseInt($("#detail-" + _len + "-xs")[0].value)
						+ parseInt($("#detail-" + _len + "-s")[0].value)
						+ parseInt($("#detail-" + _len + "-m")[0].value)
						+ parseInt($("#detail-" + _len + "-l")[0].value)
						+ parseInt($("#detail-" + _len + "-xl")[0].value)
						+ parseInt($("#detail-" + _len + "-xxl")[0].value);
				$("#detail-" + _len + "-sum").val(sum);

				$('#add i').removeClass().addClass("fa fa-minus");
				$('#add').attr('onclick', "deltr(" + _len + ")");
				$('#add').attr('id', 'delete-' + _len);

				var nlen = _len + 1;
				$("#tab-detail")
						.append(
								"<tr id="+nlen+" align='center'>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceColor' id='detail-"+ nlen +"-color' ></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceXS' id='detail-"+ nlen +"-xs' value='0'></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceS' id='detail-"+ nlen +"-s' value='0'></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceM' id='detail-"+ nlen +"-m' value='0'></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceL' id='detail-"+ nlen +"-l' value='0'></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceXL' id='detail-"+ nlen +"-xl' value='0'></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceXXL' id='detail-"+ nlen +"-xxl' value='0'></td>"
										+ "<td><input type='text' name='details_add["+ nlen +"].outsourceTotal' id='detail-"+ nlen +"-sum'value='0' disabled></td>"
										+ "<td><a class='btn btn-success' id='add' onclick='addDetail()'><i class='fa fa-plus'></i></a></td>"
										+ "</tr>");
			}

			//删除<tr/>
			var deltr = function(index) {
				var _len = $("#tab-detail tr").length - 2;

				$("tr[id='" + index + "']").remove();//删除当前行
				var nextColor, nextXS, nextS, nextM, nextL, nextXL, nextXXL, nextSUM;
				for (var i = index + 1, j = _len; i < j; i++) {
					nextColor = $("#detail-" + i + "-color").val();
					nextXS = $("#detail-" + i + "-xs").val();
					nextS = $("#detail-" + i + "-s").val();
					nextM = $("#detail-" + i + "-m").val();
					nextL = $("#detail-" + i + "-l").val();
					nextXL = $("#detail-" + i + "-xl").val();
					nextXXL = $("#detail-" + i + "-xxl").val();
					nextSUM = $("#detail-" + i + "-sum").val();
					$("tr[id=\'" + i + "\']")
							.replaceWith(
									"<tr id="
											+ (i - 1)
											+ " align='center'>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceColor' value='"
											+ nextColor
											+ "' id='detail-"
											+ (i - 1)
											+ "-color' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceXS' id='detail-"
											+ (i - 1)
											+ "-xs' value='"
											+ nextXS
											+ "' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceS' id='detail-"
											+ (i - 1)
											+ "-s' value='"
											+ nextS
											+ "' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceM' id='detail-"
											+ (i - 1)
											+ "-m' value='"
											+ nextM
											+ "' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceL' id='detail-"
											+ (i - 1)
											+ "-l' value='"
											+ nextL
											+ "' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceXL' id='detail-"
											+ (i - 1)
											+ "-xl' value='"
											+ nextXL
											+ "' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceXXL' id='detail-"
											+ (i - 1)
											+ "-xxl' value='"
											+ nextXXL
											+ "' readonly></td>"
											+ "<td><input type='text' name='details_add["
											+ (i - 1)
											+ "].outsourceTotal' id='detail-"
											+ (i - 1)
											+ "-sum' value='"
											+ nextSUM
											+ "' readonly></td>"
											+ "<td><a class='btn btn-success' onclick=\'deltr("
											+ (i - 1)
											+ ")\' id='delete-'"
											+ (i - 1)
											+ "><i class='fa fa-minus'></i></a></td>"
											+ "</tr>");
				}

				$("tr[id=\'" + (_len) + "\']")
						.replaceWith(
								"<tr id="
										+ (_len - 1)
										+ " align='center'>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceColor'  id='detail-"
										+ (_len - 1)
										+ "-color'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceXS' id='detail-"
										+ (_len - 1)
										+ "-xs' value='0'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceS' id='detail-"
										+ (_len - 1)
										+ "-s' value='0'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceM' id='detail-"
										+ (_len - 1)
										+ "-m' value='0'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceL' id='detail-"
										+ (_len - 1)
										+ "-l' value='0'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceXL' id='detail-"
										+ (_len - 1)
										+ "-xl' value='0'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceXXL' id='detail-"
										+ (_len - 1)
										+ "-xxl' value='0'></td>"
										+ "<td><input type='text' name='details_add["
										+ (_len - 1)
										+ "].outsourceTotal' id='detail-"
										+ (_len - 1)
										+ "-sum' value='0' readonly></td>"
										+ "<td><a class='btn btn-success' onclick='addDetail()' id='add'><i class='fa fa-plus'></i></a></td>"
										+ "</tr>");

			}
		</script>

	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>


	<script type="text/javascript">
		formValidate();
		function formValidate() {
			// 在键盘按下并释放及提交后验证提交表单
			$("#addForm").validate({
				"rules" : {
					"outSourceCode" : {
						'required' : true,
					},
					"productionCode" : {
						'required' : true,
					},
					"designCode" : {
						'required' : true,
					},
					"finishDate" : {
						'required' : true,
					},
					"osScheduleDate" : {
						'required' : true,
					},
					"labourCost" : {
						'required' : true,
					},
					"processorCode" : {
						'required' : true,
					},
					"actualOutDate" : {
						'required' : true,
					},
					"userName" : {
						'required' : true,
					}
				}
			});
		}
	</script>

</body>
</html>