<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../../header.jsp"></jsp:include>
<title>智造链-出库管理</title>

    <style type="text/css">
        
    </style>


</head>
<body class="skin-blue">
    <s:if test="#request.session.account!=null">
	<!-- 人物头像 -->
	<jsp:include page="../../../headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->
    
    
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../../navigation.jsp"></jsp:include> 
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          出库管理
                    <small>出库单管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">物料出库</h3>
                            </div>
                            <form class="form-horizontal" method="get" role="form" action="/ZZL/Warehouse/materialOut_showMaterialOutputs">
							   <div class="form-group row">
							   		<div class="col-md-2" style="margin-left:15px">
							   			<label class="control-label">出库时间：</label>
							   		</div>
							   		<div class="col-md-3">
										<input type="text"	class="date form-control" name="date" id="date" />
							   		</div>
								  	<button type="submit" class="btn btn-primary">查询</button>
							   </div>
							</form>
					        <div class="row">
					        	<div class="col-md-3" style="margin-left:10px">
					        		<label style="margin-left:5px;color:" class="control-label">每日出库表></label>
					        		<table  class="table-striped table table-hover table-bordered">
					        			<thead>
					        				<tr>
					        					<th>出库时间</th>
					        					<th>出库总数</th>
					        				</tr>
					        			</thead>
					        			<tbody id = "outputList">
					        				<s:iterator value="pageBean.list" id="m">
						        				<tr style="cursor:pointer">
						        					<td><s:property value="#m[0]"/></td>
						        					<td><s:property value="#m[1]"/></td>
						        				</tr>
					        				</s:iterator>
					        			</tbody>
					        		</table>
								      
					        	</div>
					        	<div class="col-md-8" style="margin-left:10px">
					        		<label style="margin-left:5px;color:" class="control-label">每日出库详情></label>
					        		<div style="width:100%;height:400px;overflow-y:auto">
						        		<table style="width:100%;"  class="table-responsive table-striped table table-hover table-bordered">
						        			<thead style="width:100%">
						        				<tr style="width:100%">
						        					<th>面料名</th>
						        					<th>负责人</th>
						        					<th>出库数量</th>
						        					<th style="width:30%">出库位置</th>
						        					<th>实际库存</th>
						        					<th>可用库存</th>
						        				</tr>
						        			</thead>
						        			<tbody id="outputDetail">
						        			</tbody>
						        		</table>
					        		</div>
					        	</div>
					        </div>
					        <div class="row">
					        	<div class="col-md-12">
    								<%@include file="../../../page.jsp" %>  
					        	</div>
					        </div>
                        </div>
                    </div>
                </div>
                
                
                <s:iterator value="#session.authorityList" id="low">
<s:if test="#low.highAuthName=='出库管理'&&#low.middleAuthName=='出库单管理'&&#low.lowAuthName=='出库单管理查询'">
                <%@include file="../public/storeDetailModal.jsp" %>
                </s:if>
                </s:iterator>
            </section>
        </aside>
    </div>
    
	</s:if>
	<s:else>
		<jsp:include page="../../../login.jsp"></jsp:include>
	</s:else>


<script type="text/javascript">
	//导航栏设置
	window.onload = changeTab("10200","10202");
	
	//时间选择器设置
	$('#date').datetimepicker({
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

	
	$("#outputList tr").click(function(){
		date = $(this).children().first().html();
		params = {
			"dateAjax":date
		};
		jQuery.post("/ZZL/Warehouse/materialOutputAjax_getOutputDetailByDate",params,function(data){
			objs= eval(data);  
			content = "";
			for(i=0;i<objs.length;i++){
				mo = objs[i];
				content+=("<tr style='cursor:pointer' onclick='fillDetailInfo(\""+mo.material.materialCode+"\","+mo.warehouse.warehouseid+")' data-toggle='modal' data-target='#detailModel'><td>"+mo.material.materialName+"</td><td>"+mo.user.userName+"</td><td>"+mo.materialOutputVol+"</td><td style='word-wrap:break-word;word-break:break-all'>"+mo.warehouse.location+"</td><td>"+mo.store.remainVol+"</td><td>"+mo.warehouse.remain+"</td></tr>");
			}
			$("#outputDetail").html(content);
		},"json");
	});
	function fillDetailInfo(material,warehouse){
		params = {
				"materialCode":material,
				"warehouseid":warehouse
		};
		jQuery.post("/ZZL/Warehouse/warehousePublicAjax_getStoreDetailInfoAjax",params,function(data){
			obj = eval("("+data+")");
			$("#materialName").html(obj.material.materialName);
			$("#materialCode").html(obj.material.materialCode);
			$("#materialType").html(obj.material.materialType);
			$("#unitPrice").html(obj.material.unitPrice);
			$("#colorCode").html(obj.material.colorCode);
			$("#colorDescription").html(obj.material.colorDescription);
			$("#materialIngredient").html(obj.material.materialIngredient);
			$("#remain").html(obj.warehouse.remain);
			$("#remainVol").html(obj.store.remainVol);
			$("#unit").html(obj.material.unit);
			$("#location").html(obj.warehouse.location);
			vendors = obj.vendors;
			content = "";
			for(i =0;i<vendors.length;i++){
				content += ("<tr><td>"+vendors[i].vendorId+"</td><td>"+vendors[i].vendorName+"</td><td>"+vendors[i].vendorMobileNum+"</td><td>"+vendors[i].vendorAddr+"</td></tr>");
			}
			$("#vendors").html(content);
		},"json");
	}
</script>
</body>
</html>