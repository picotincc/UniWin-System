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
			物料管理 <small>供应商管理</small>
		</h1>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">供应商管理</h3>
					</div>
					<!-- /.box-header -->

					<!-- 查询与按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form action="<%=request.getContextPath()%>/Vendor/showVendorList" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="box-body">
											<label>供应商名称： </label> <input type="text" class="form-control"
												name="vendorName"> 
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

						<!-- 按钮  -->
						<div class="col-md-2">
							<div class="row">
								<button type="submit" class="btn btn-primary"
									style="margin: 5px 5px 5px 75px" data-toggle="modal" data-target="#addVendor">新增</button>
							</div>
							<div class="row">
								<button type="submit" class="btn btn-warning"
									style="margin: 5px 5px 5px 75px" onclick="showUpdateVendor()">修改</button>
							</div>							
						</div>

					</div>

					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<table class="table table-striped">
								<tr>
									<th></th>
									<th>供应商名称</th>
									<th>供应商编号</th>
									<th>供应商电话</th>
									<th>供应商手机</th>
									<th>供应商地址</th>
								</tr>
								<s:iterator value="PageBean.list" var="vendorItem">
									<tr>
										<td><input type="radio" name="select"><input type="hidden" name="selectedID" value=${vendorItem.vendorId}></td>
										<td><s:property value="#vendorItem.vendorName" /></td>
										<td><s:property value="#vendorItem.vendorId" /></td>
										<td><s:property value="#vendorItem.vendorPhoneNum" /></td>
										<td><s:property value="#vendorItem.vendorMobileNum" /></td>
										<td><s:property value="#vendorItem.vendorAddr" /></td>
								</s:iterator>
							
							</table>
							<!-- /.table -->
							<jsp:include page="../../page.jsp">
							<jsp:param name="action" value="showVendorList" />
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
	<div class="modal fade" id="addVendor" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">新增供应商</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Vendor/addVendor" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>供应商编号<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="new_Code"></td>
									<td>供应商名称<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="new_Name"></td>
								</tr>
								<tr>
									<td>供应商电话<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="new_Tel"></td>
									<td>供应商手机<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="new_Mobile"></td>
								</tr>
								<tr>
									<td>供应商地址<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 90%" name="new_Addr"></td>
								</tr>
								<tr>
									<td>供应商等级<span style="color: red">*</span>：
									</td>
									<td><select name="new_VendorLevel">
											<option value="新进供应商">新进供应商</option>
											<option value="劣质供应商">劣质供应商</option>
											<option value="优质供应商">优质供应商</option>

									</select></td>
									<td>供应商区域<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="new_Area"></td>
								</tr>
								<tr>
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
	<div class="modal fade" id="updateVendor" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">供应商信息</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Vendor/updateVendor" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>供应商编号<span style="color: red">*</span>：
									</td>
									<td><input type="text" id="update_Code" name="update_Code" readonly="true"></td>
									<td>供应商名称<span style="color: red">*</span>：
									</td>
									<td><input type="text" id="update_Name" name="update_Name"></td>
								</tr>
								<tr>
									<td>供应商电话<span style="color: red">*</span>：
									</td>
									<td><input type="text" id="update_Tel" name="update_Tel"></td>
									<td>供应商手机<span style="color: red">*</span>：
									</td>
									<td><input type="text" id="update_Mobile" name="update_Mobile"></td>
								</tr>
								<tr>
									<td>供应商地址<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 90%" id="update_Addr" name="update_Addr"></td>
								</tr>
								<tr>
									<td>供应商等级<span style="color: red">*</span>：
									</td>
									<td><select id="update_VendorLevel" name="update_VendorLevel">
											<option value="新进供应商">新进供应商</option>
											<option value="劣质供应商">劣质供应商</option>
											<option value="优质供应商">优质供应商</option>

									</select></td>
									<td>供应商区域<span style="color: red">*</span>：
									</td>
									<td><input type="text" id="update_Area" name="update_Area"></td>
								</tr>
								<tr>
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

    <script type="text/javascript">
    	window.onload = changeTab("10000","10006");
       	
        	function showUpdateVendor(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		if(selectedID != null){

        			params = {
						"vendorId":selectedID
					};
					jQuery.post(getRootPath+"/Vendor/getVendorById",params,function(data){
						obj = eval("("+data+")");
						$("#update_Code").val(obj.vendorId);
						$("#update_Name").val(obj.vendorName);
						$("#update_Tel").val(obj.vendorPhoneNum);
						$("#update_Mobile").val(obj.vendorMobileNum);
						$("#update_Addr").val(obj.vendorAddr);
						document.getElementById("update_VendorLevel").value=obj.vendorRank;
						$("#update_Area").val(obj.vendorArea);
					},"json");

        			$('#updateVendor').modal('show');

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