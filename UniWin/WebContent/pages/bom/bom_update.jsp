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
			物料管理 <small>BOM资料修改</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 物料管理</a></li>
			<li class="active">BOM资料修改</li>
		</ol>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">BOM资料修改</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form" method="post"
						action="<%=request.getContextPath()%>/Bom/showDesignList"><!--注意之后完成UPDAET-->
						<!-- BOM资料修改  -->
						<img src="../upload/${design.designPicURL}" style="float:right;margin-right:50px;width:265px;height:380px">
						<div class="row">
							<div class="col-md-8">

								<div class="table-responsive" style="margin: 0px 50px 50px 23px">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td><label class="my_label">款号</label></td>
												<td><input type="text" class="form-control"
													name="designCode" value=${design.designCode} disabled="disabled"></td>
												<td><label class="my_label">名称</label></td>
												<td><input type="text" class="form-control"
													name="designName" value=${design.designName}></td>
											</tr>
											<tr>
												<td><label class="my_label">价格</label></td>
												<td><input type="text" class="form-control"
													name="designProcessPrice" value=${design.designProcessPrice}></td>
												<td><label class="my_label">工序</label></td>
												<td><input type="designTechProcedure" class="form-control" value=${design.designTechProcedure}></td>
											</tr>
											<tr>
												<td><label class="my_label">上架时间</label></td>
												<td><input type="text" class="form-control"
													name="designPutawayDate" value=${design.designPutawayDate}></td>
												<td><label class="my_label">颜色说明</label></td>
												<td><input type="designColorDescription" class="form-control" value=${design.designColorDescription}></td>
											</tr>
											<tr>
												<td><label class="my_label">水洗编号</label></td>
												<td><input type="text" class="form-control"
													name="designsewninCode" value=${design.designsewninCode}></td>
												<td><label class="my_label">主标编号</label></td>
												<td><input type="text" class="form-control"
													name="designMainLabelCode" value=${design.designMainLabelCode}></td>
											</tr>
											<tr>
												<td><label class="my_label">吊牌编号</label></td>
												<td><input type="text" class="form-control"
													name="designHangTagCode" value=${design.designHangTagCode}></td>
												<td><label class="my_label">款式</label></td>
												<td><input type="text" class="form-control"
													name="designType" value=${design.designType}></td>
											</tr>
											<tr>
												<td><label class="my_label">备注</label></td>
												<td colspan="3"><input type="text" class="form-control"
													name="designComment" value=${design.designComment}></td>
											</tr>
										</tbody>
									</table>
									<!-- /.table -->
									<button style="float:right" class="btn btn-primary" onclick="">取消</button>
                                    <button type="submit" id="confirmAdd" style="float:right;margin-right:10px" class="btn btn-primary">确定</button>
								</div>
							</div>
						</div>

						<!-- BOM资料修改 end-->

					<div class="box-header" style="margin-top:50px;width:670px">
							<h3 class="box-title">面料信息>></h3>
							<button  type="button" class="btn btn-primary"
											style="margin-top: 5px;float:right" data-toggle="modal" onclick="showMaterialList()">增加</button>
						</div>
            		<div class="row">
            			<div class="col-md-8">
            				<div class="row">
            					<div class="table-responsive" style="margin: 0px 50px 50px 23px">

            						<div class="col-md-2">
									</div>

            						<table class="table table-striped">
            							<tr>
										<th>部位</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>单价</th>
										<th>主/辅料</th>
										<th>色号</th>
										<th>单件用量</th>
										<th>操作</th>
										</tr>
											<!-- iterator goes here and set data dynamically-->
												<s:iterator value="materialMes">
													<tr>
														<td><s:property value="materialPosition"/></td>
														<td><s:property value="materialCode"/></td>
														<td><s:property value="materialName"/></td>
														<td><s:property value="unitPrice"/></td>
														<td><s:property value="materialType"/></td>
														<td><s:property value="colorCode"/></td>
														<td><s:property value="volPerDesign"/></td>
														<td><button type='button' class='btn btn-danger' onclick="deleteBom('<s:property  value="materialCode"/>')">删除</button></td>
												</s:iterator>

            						</table>
            					</div>
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


	<!-- 模态框（Modal） -->
	<div class="modal fade" id="MaterialList" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">物料选择</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
					</div>

					<!-- 查询按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form>
								<div class="row">
									<div class="col-md-6">
										<div class="box-body">
											<label>物料名称：</label> <input type="text" class="form-control"
												name="materialName">
										</div>
									</div>
									<div class="col-md-2">
										<button type="button" class="btn btn-primary"
											style="margin-top: 34px" onclick="showMaterialList()">查询</button>
									</div>
									<div class="col-md-2" style="margin:5px float:right">
										<label class="my_label">单件用量</label>
										<input type="text" class="form-control"
													name="vol" id="vol">
									</div>
									<div class="col-md-2" style="margin:5px float:right">
										<label class="my_label">用料部位</label>
										<select name="position" id="position">
											<option>大身</option>
											<option>里布</option>
											<option>配料</option>
											<option>别布</option>
											<option>花边</option>
											<option>蕾丝</option>
											<option>其他</option>
										</select>
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 50px 50px 50px 23px" >
							<table class="table table-striped"  id="detail-table">
								<tr>
									<th>物料编号</th>
									<th>物料名称</th>
									<th>类型</th>
									<th>成分</th>
									<th>操作</th>
								</tr>
							<tbody id="table-detail">
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
									</tr>
							</tbody>
							</table>
							<!-- /.table -->
						</div>
						<!-- /.table-responsive -->
						<!-- 分页 -->
					</div>
					<!-- /.table-row -->


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
   			window.onload = changeTab("10000","10008");

        	function showMaterialList(){
        		$("#detail-table tbody").html("");
        		var Table = document.getElementById("detail-table");
        		var newTH = Table.insertRow();
        		newTH.className="detailth";
        		newTH.innerHTML="<th>物料编号</th><th>物料名称</th><th>类型</th><th>成分</th><th>操作</th>";


        			var content = "";
        			var material = $("input[name='materialName']").val();
        		    params = {
						"materialName":material
					};

					jQuery.post(getRootPath+"/Bom/getMaterialList",params,function(json){
						var data = eval("("+json+")"); 
						for(var detail in data){
							var code = data[detail].materialCode;
							var name = data[detail].materialName;
							var type = data[detail].materialType;
							var ingredient = data[detail].materialIngredient;
							// content+="<tr><td>"+code+"</td><td>"+name+"</td><td>"+type+"</td><td>"+ingredient+"</td><td>"+"<button type='button' class='btn btn-danger' onclick='addBom(\""+code+"\")'>添加</button></td></tr>";
							var newRow = Table.insertRow(); 
							var newCode = newRow.insertCell(); //创建新单元格
                    		newCode.innerHTML = code; 
                    		var newName = newRow.insertCell(); //创建新单元格
                    		newName.innerHTML = name; 
                    		var newType = newRow.insertCell(); //创建新单元格
                    		newType.innerHTML = type; 
                    		var newIngredient = newRow.insertCell();
                    		newIngredient.innerHTML = ingredient;
                    		var button = newRow.insertCell();
                    		button.innerHTML = "<button type='button' class='btn btn-danger' onclick='addBom(\""+code+"\")'>添加</button>";
						}
					},"json");

					// alert(content);
				// $("#table-detail").html(content);
        		$('#MaterialList').modal('show');
        	}
        	

        	function addBom(materialCode){
        		var vol = $("input[name='vol']").val();

        		var s = document.getElementById('position');
        		var position = s.options[s.selectedIndex].text;

        		var designCode = $("input[name='designCode']").val();

        			var url=getRootPath()+"/Bom/";
	
				$.ajax({
					url:url+"addBom",
					data:{designCode:designCode,materialCode:materialCode,volPerDesign:vol,materialPosition:position},
					type:"post",
					success:function(){
						alert("提交成功");
						 location.reload();
					},
					error:function(){
						alert("提交失败");
					}
					
				})
        	}

        	function deleteBom(materialCode){

        		var designCode = $("input[name='designCode']").val();

        		var url=getRootPath()+"/Bom/";
	
				$.ajax({
					url:url+"deleteBom",
					data:{designCode:designCode,materialCode:materialCode},
					type:"post",
					success:function(){
						alert("提交成功");
						location.reload();
					},
					error:function(){
						alert("提交失败");
					}
					
				})
        	}

        	function updateMaterial(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		if(selectedID != null){        			
        			location.href= getRootPath() + "/Material/getMaterial?materialCode="+selectedID;     	       		         
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