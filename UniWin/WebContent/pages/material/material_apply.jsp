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
			物料管理 <small>物料申请查询</small>
		</h1>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">物料预定查询</h3>
					</div>
					<!-- /.box-header -->

					<!-- 查询与按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form action="showApplyList" method="post">
								<div class="row">
									<div class="col-md-5">
										<div class="box-body">
											<label>预定单号</label> <input type="text" class="form-control"
												id="materialApplyCode" name="materialApplyCode" value=${materialApplyCode} >
										</div>
									</div>
									<div class="col-md-5">
										<div class="box-body">
											<label>预定时间</label> <input type="text"
												class="form-control form-input date" id="materialApplyDate" placeholder="yyyy-mm-dd" name="materialApplyDate"
												value=${materialApplyDate}> 
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

						<!-- 查看详情按钮  -->
						<div class="col-md-2">
							<div class="row">
								<button type="button" class="btn btn-warning"
									style="margin: 5px 5px 5px 75px" data-toggle="modal" onclick="showMaterial()">详情</button>
							</div>
						</div>

					</div>

					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<table class="table table-striped">
								<tr>
									<th></th>
									<th>预定时间</th>
									<th>负责人</th>
									<th>预定单号</th>
									<th>物料名称</th>
									<th>申请数量</th>
									<th>备注</th>
								</tr>
								<s:iterator value="PageBean.list" var="applyItem">
									<tr>
										<td>
											<input type="radio" name="select">
											<!--input type="hidden" name="selectedID" value=${applyItem.materialApplyID}-->
											<input type="hidden" name="material" value=${applyItem.material.materialCode}>
										</td>
										<td><s:date name="#applyItem.matrialApplyDate" format="yyyy-MM-dd" /></td>
										<td><s:property value="#applyItem.user.userName" /></td>
										<td><s:property value="#applyItem.materialApplyCode" /></td>
										<td><s:property value="#applyItem.material.materialName" /></td>
										<td><s:property value="#applyItem.materialApplyVol" /></td>
										<td><s:property value="#applyItem.applyComment" /></td>
									</tr>
								</s:iterator>
							
							</table>
							<!-- /.table -->
							<jsp:include page="../../page.jsp">
							<jsp:param name="action" value="showApplyList" />
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
	<div class="modal fade" id="MaterialDetail" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">物料详情</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
					</div>

								<div class="table-responsive" style="margin: 0px 50px 50px 25px;">
                                    <table class="table table-striped">
                                    	<input type="hidden" name="detail" id="detail">
                                        <tbody>
                                        <tr>
                                            <td><label>物料编号</label></td>
                                            <td><input type="text" class="form-control" id="materialCode" name="materialCode" disabled="true"></td>
                                            <td><label>物料名称</label></td>
                                            <td><input type="text" class="form-control" id="materialName" name="materialName" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>物料类型</label></td>
                                            <td><input type="text" class="form-control" id="materialType" name="materialType" disabled="true"></td>
                                            <td><label>色号</label></td>
                                            <td><input type="text" class="form-control" id="colorCode" name="colorCode" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>颜色说明</label></td>
                                            <td><input type="text" class="form-control" id="colorDescription" name="colorDescription" disabled="true"></td>
                                            <td><label>物料成分</label></td>
                                            <td><input type="text" class="form-control" id="materialIngredient" name="materialIngredient" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>单价</label></td>
                                            <td><input type="text" class="form-control" id="unitPrice" name="unitPrice" disabled="true"></td>
                                            <td><label>单位</label></td>
                                            <td><input type="text" class="form-control" id="unit" name="unit" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td><label>门幅</label></td>
                                            <td><input type="text" class="form-control" id="width" name="width" disabled="true"></td>
                                            <td><label>出量</label></td>
                                            <td><input type="text" class="form-control" id="outputVol" name="outputVol" disabled="true"></td>
                                        </tr>
                                        </tbody>
                                    </table>
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

        window.onload = changeTab("10000","10005");
        
		$('#materialApplyDate').datetimepicker({
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


        	
        	function showMaterial(){
        		//var selectedID = $(".checked + input[name='selectedID']").val();
        		var material = $(".checked + input[name='material']").val();
        		if(material != null ){	
        			params = {
						"materialCodeAjax":material
					};

					jQuery.post("http://localhost:8080/ZZL/Material/showMaterialDetail",params,function(data){
						obj = eval("("+data+")");
						$("#materialName").val(obj.materialName);
						$("#materialCode").val(obj.materialCode);
						$("#materialType").val(obj.materialType);
						$("#colorCode").val(obj.colorCode);
						$("#colorDescription").val(obj.colorDescription);
						$("#materialIngredient").val(obj.materialIngredient);
						$("#unitPrice").val(obj.unitPrice);
						$("#unit").val(obj.unit);
						$("#width").val(obj.width);
						$("#outputVol").val(obj.outputVol);
					},"json");

        			$('#MaterialDetail').modal('show');

        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function getRootPath(){
                var curWwwPath = window.document.location.href;
                var pathName = window.document.location.pathname;
                var pos = curWwwPath.indexOf(pathName);
                var localhostPath = curWwwPath.substring(0, pos);
                var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
                return(localhostPath + projectName);
        	}
    	</script>

</s:if>
<s:else>
    <jsp:include page="../../login.jsp"></jsp:include>
</s:else>

</body>
</html>