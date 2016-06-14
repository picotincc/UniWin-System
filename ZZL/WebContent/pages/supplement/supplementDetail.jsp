<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>

	<style type="text/css">
	.supplement-info {
		text-align: right;
		padding: 15px;
	}

	th {
		text-align: center;
	}
	td {
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
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                   	补料单
                    <small>补料单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Supplement</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            	<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">物料基本信息</h3>
					</div>
					<!-- /.box-header -->
					<div class="row">
						<div class="col-md-10">
							<div class="box-body">
							
								<table style="padding: 15px; margin: 20px">
									<tr>
										<td class="supplement-info">补料类型：</td>
										<td><s:property value="supplementDetailVO.supplementType" /></td>
										<s:if test="supplementType.equals('生产单补料')">
										<td class="supplement-info">生产单号：</td>
										<td><input type="text" name="supplementDetailVO.productionCode"></td>
										</s:if>
										<td class="supplement-info">物料类型：</td>
										<td><s:property value="supplementDetailVO.materialType" /></td>
									</tr>
									<tr>
										<td class="supplement-info">补料单号：</td>
										<td><s:property value="supplementDetailVO.supplementCode" /></td>
										<td class="supplement-info">补料日期：</td>
										<td><s:property value="supplementDetailVO.supplementDate" /></td>
										<td class="supplement-info">补料人：</td>
										<td><s:property value="supplementDetailVO.userName" /></td>
									</tr>
								</table>
						
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2">
							<span size="3px" style="margin: 0px 10px 20px 20px; color: blue">物料信息>></span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive" style="margin: 10px 15px 20px 23px">
								<table class="table table-striped" id="tab-detail">
									<tr>
										
										<th>物料名称</th>
										<th>规格</th>
										<th>数量</th>
										<th>供应商</th>
										<th>补充用途</th>
										
									</tr>
									<tbody id="smList">
									<s:iterator value="supplementDetailVO.smList" var="smItem">
									<tr>
										
										<td id=""><a href="javascript:void(0);" onclick="showMaterialDetail();" style="color:blue;">
											<s:property value="#smItem.supply.material.materialName" />(
											<s:property value="#smItem.supply.material.colorDescription" />&nbsp;
											<s:property value="#smItem.supply.material.colorCode" />
											)
											</a><input type="hidden" name="materialName" id="materialName" value=${smItem.supply.material.materialName}>
											<input type="hidden" name="materialCode" id="materialCode" value=${smItem.supply.material.materialCode}>
											<input type="hidden" name="materialIngredient" id="materialIngredient" value=${smItem.supply.material.materialIngredient}>
											
											<input type="hidden" name="unitPrice" id="unitPrice" value=${smItem.supply.material.unitPrice}>
											<input type="hidden" name="materialType" id="materialType" value=${smItem.supply.material.materialType}>
											<input type="hidden" name="modificationDate" id="modificationDate" value=${smItem.supply.material.modificationDate}>
											
											<input type="hidden" name="colorCode" id="colorCode" value=${smItem.supply.material.colorCode}>
											<input type="hidden" name="colorDescription" id="colorDescription" value=${smItem.supply.material.colorDescription}>
											<input type="hidden" name="outputVol" id="outputVol" value=${smItem.supply.material.outputVol}>
											
											<input type="hidden" name="vendorId" id="vendorId" value=${smItem.supply.vendor.vendorId}>
											<input type="hidden" name="vendorName" id="vendorName" value=${smItem.supply.vendor.vendorName}>
											<input type="hidden" name="vendorPhoneNum" id="vendorPhoneNum" value=${smItem.supply.vendor.vendorPhoneNum}>
											<input type="hidden" name="vendorAddr" id="vendorAddr" value=${smItem.supply.vendor.vendorAddr}>
											</td>
									
										<td><s:property value="#smItem.materialSpecification" /></td>
										<td><s:property value="#smItem.materialVol" /></td>	
										<td><s:property value="#smItem.supply.vendor.vendorName" />:<s:property value="#smItem.supply.vendor.vendorPhoneNum" /></td>
										<td><s:property value="#smItem.supUsage" /></td>				
									</tr>
									</s:iterator>
									</tbody>
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
								<table style="padding:10px; margin:10px">
									<tr>
										<td class="supplement-infoMore">备注信息：</td>
										<td><s:property value="supplementDetailVO.supplementComment" /></td>
										
									</tr>
									
									<tr>
										<td>
											<button type="button" class="btn btn-primary" style="margin-top: 0px" onclick="window.location='<%=request.getContextPath()%>/Supplement/supplementlist'">返回</button>
										</td>
									</tr>

								</table>
							</div>
						</div>
					</div>

				
				
				</div>
				
				<!-- /.box-->
				
			</div>
		</div>
            </section>
        </aside>
    </div>
    
 <!-- 模态框（Modal） -->
	<div class="modal fade" id="changeState" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 900px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">物料基础信息</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						
							<table class="table" rules="none" frame="void">
								<tr>
									<td>物料名称：</td>
									<td><input type="text" id="materialNameS" style="width:170px" disabled="true"></td>
									<td>物料编号：</td>
									<td><input type="text" id="materialCodeS" style="width:170px" disabled="true"></td>
									<td>物料成分：</td>
									<td><input type="text" id="materialIngredientS" style="width:170px" disabled="true"></td>
								</tr>
								<tr>
									<td>物料单价：</td>
									<td><input type="text" id="unitPriceS" style="width:170px" disabled="true"></td>
									<td>物料类型：</td>
									<td><input type="text" id="materialTypeS" style="width:170px" disabled="true"></td>
									<td>修改时间：</td>
									<td><input type="text" id="modificationDateS" style="width:170px" disabled="true"></td>
								</tr>
								<tr>
									<td>色号：</td>
									<td><input type="text" id="colorCodeS" style="width:170px" disabled="true"></td>
									<td>颜色说明：</td>
									<td><input type="text" id="colorDescriptionS" style="width:170px" disabled="true"></td>
									<td>出量：</td>
									<td><input type="text" id="outputVolS" style="width:170px" disabled="true"></td>
								</tr>
								<tr>
									<td>供应商编号：</td>
									<td><input type="text" id="vendorIdS" style="width:170px" disabled="true"></td>
									<td>供应商名称：</td>
									<td><input type="text" id="vendorNameS" style="width:170px" disabled="true"></td>
									<td>联系电话：</td>
									<td><input type="text" id="vendorPhoneNumS" style="width:170px" disabled="true"></td>
								</tr>
								<tr>
									<td>供应商地址：</td>
									<td><input type="text" id="vendorAddrS" style="width:170px" disabled="true"></td>								
								</tr>
								
							</table>
								
							<!-- /.table -->
						
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
        	window.onload = changeTab("10900","10903");
        	$('.date-picker').datetimepicker({
    		 	language:  'zh-CN',
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
        	function showMaterialDetail(){
        		
        		 var materialName = document.getElementById('materialName').value;
        		 $('#materialNameS').val(materialName);
        		 var materialCode = document.getElementById('materialCode').value;
        		 $('#materialCodeS').val(materialCode);
        		 var materialIngredient = document.getElementById('materialIngredient').value;
        		 $('#materialIngredientS').val(materialIngredient);
        		 
        		 var unitPrice = document.getElementById('unitPrice').value;
        		 $('#unitPriceS').val(unitPrice);
        		 var materialType = document.getElementById('materialType').value;
        		 $('#materialTypeS').val(materialType);
        		 var modificationDate = document.getElementById('modificationDate').value;
        		 $('#modificationDateS').val(modificationDate);
        		 
        		 var colorCode = document.getElementById('colorCode').value;
        		 $('#colorCodeS').val(colorCode);
        		 var colorDescription = document.getElementById('colorDescription').value;
        		 $('#colorDescriptionS').val(colorDescription);
        		 var vendorId = document.getElementById('vendorId').value;
        		 $('#vendorIdS').val(vendorId);
        		 
        		 var outputVol = document.getElementById('outputVol').value;
        		 $('#outputVolS').val(outputVol);
        		 var vendorName = document.getElementById('vendorName').value;
        		 $('#vendorNameS').val(vendorName);
        		 var vendorPhoneNum = document.getElementById('vendorPhoneNum').value;
        		 $('#vendorPhoneNumS').val(vendorPhoneNum);
        		 var vendorAddr = document.getElementById('vendorAddr').value;
        		 $('#vendorAddrS').val(vendorAddr);

        		$('#changeState').modal('show');
        			
        	}
 </script>
 	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>