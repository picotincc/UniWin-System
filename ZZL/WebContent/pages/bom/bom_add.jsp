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
</style>

<title>联胜供应链管理系统</title>
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
			物料管理 <small>款式新增</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 物料管理</a></li>
			<li class="active">款式新增</li>
		</ol>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary" style="height:530px">

					<div class="box-header">
						<h3 class="box-title">款式新增</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form" method="post"
						action="<%=request.getContextPath()%>/Bom/addDesign" enctype="multipart/form-data"><!--注意之后完成UPDAET-->
						<!-- BOM资料修改  -->
						<div class="row">
							<div>

								<div class="table-responsive" style="margin: 0px 50px 50px 23px">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td><label class="my_label">款号</label></td>
												<td><input type="text" class="form-control"
													id="designCode" name="designCode"></td>
												<td><label class="my_label">名称</label></td>
												<td><input type="text" class="form-control"
													id="designName" name="designName"></td>
											</tr>
											<tr>
												<td><label class="my_label">价格</label></td>
												<td><input type="text" class="form-control"
													id="designProcessPrice" name="designProcessPrice"></td>
												<td><label class="my_label">工序</label></td>
												<td><input type="text" class="form-control" id="designTechProcedure" name="designTechProcedure"></td>
											</tr>
											<tr>
												<td><label class="my_label">上架时间</label></td>
												<td><input type="text" class="form-control form-input date" placeholder="yyyy-mm-dd"
													id="designPutawayDate" name="designPutawayDate"></td>
												<td><label class="my_label">颜色说明</label></td>
												<td><input type="text" class="form-control" id="designColorDescription" name="designColorDescription"></td>
											</tr>
											<tr>
												<td><label class="my_label">水洗编号</label></td>
												<td><input type="text" class="form-control"
													id="designsewninCode" name="designsewninCode"></td>
												<td><label class="my_label">主标编号</label></td>
												<td><input type="text" class="form-control"
													id="designMainLabelCode" name="designMainLabelCode"></td>
											</tr>
											<tr>
												<td><label class="my_label">吊牌编号</label></td>
												<td><input type="text" class="form-control"
													id="designHangTagCode" name="designHangTagCode"></td>
												<td><label class="my_label">款式</label></td>
												<td><input type="text" class="form-control"
													id="designType" name="designType"></td>
											</tr>
											<tr>
												<td><label class="my_label">旗舰地址</label></td>
												<td colspan="3"><input type="text" class="form-control"
													id="designFlagShipURL" name="designFlagShipURL"></td>
											</tr>
											<tr>
												<td><label class="my_label">备注</label></td>
												<td colspan="3"><input type="text" class="form-control"
													id="designComment" name="designComment"></td>
											</tr>
											
											<tr>
												<td colspan="2"><label class="my_label">请选择上传的图片或文件</label></td>
												<td colspan="2"><input type="file" name="file"/></td>
											</tr>
											
										</tbody>
									</table>
									<!-- /.table -->
									<button style="float:right" class="btn btn-primary" onclick="">取消</button>
                                    <button type="submit" style="float:right;margin-right:10px" class="btn btn-primary">确定</button>
								</div>
							</div>
						</div>

						<!-- BOM资料修改 end-->


					</form>
				</div>
				<!-- /.box-->
			</div>
		</div>
		</section> </aside>
	</div>

    <script type="text/javascript">
    	window.onload = changeTab("10000","10007");
    	$('#designPutawayDate').datetimepicker({
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

</s:if>
<s:else>
    <jsp:include page="../../login.jsp"></jsp:include>
</s:else>

</body>
</html>