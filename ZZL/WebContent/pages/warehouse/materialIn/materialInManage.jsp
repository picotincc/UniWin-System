<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../../header.jsp"></jsp:include>
<title>智造链-入库管理</title>

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
                                          入库管理
                    <small>入库单管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">物料入库</h3>
                            </div>
                            <form class="form-horizontal" role="form" method="post" action="materialInManage">
							   <div class="form-group row">
							   		<div class="col-md-1" style="margin-left:15px">
							   			<label class="control-label">入库时间:</label>
							   		</div>
							   		<div class="col-md-2">
							   			<input type="text" class="date form-control" id="date" name="date">
							   		</div>
								  	<button type="submit" class="btn btn-primary">查询</button>
							   </div>
							</form>
					        <div class="row">
					        	<div class="col-md-5" style="margin-left:10px">
					        		<label style="margin-left:5px;color:" class="control-label">每日入库表></label>
					        		<table  class="table-striped table table-hover table-bordered">
					        			<thead>
					        				<tr>
					        					<th>入库时间</th>
					        					<th>入库总数</th>
					        				</tr>
					        			</thead>
					        			<tbody id = "inputList">
					        				<s:iterator value="pageBean.list" id="m">
						        				<tr>
						        					<td><s:property value="#m[0]"/></td>
						        					<td><s:property value="#m[1]"/></td>
						        				</tr>
					        				</s:iterator>
					        			</tbody>
					        		</table>
								    <%@include file="../../../page.jsp" %>    
					        	</div>
					        	<div class="col-md-6" style="margin-left:10px">
					        		<label style="margin-left:5px;color:" class="control-label">每日入库详情></label>
					        		<div style="width:100%;height:500px;overflow-y:auto">
						        		<table style="width:100%;"  class="table-responsive table-striped table table-hover table-bordered">
						        			<thead style="width:100%">
						        				<tr style="width:100%">
						        					<th>面料名</th>
						        					<th>负责人</th>
						        					<th>入库数量</th>
													<th>库存数</th>
						        				</tr>
						        			</thead>
						        			<tbody id="inputDetail">
						        			</tbody>
						        		</table>
					        		</div>
					        	</div>
					        </div>
                        </div>
                    </div>
                </div>
                <s:iterator value="#session.authorityList" id="low">
					<s:if test="#low.highAuthName=='入库管理'&&#low.middleAuthName=='入库单管理'&&#low.lowAuthName=='入库单管理'">
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
</script>
	
<script type="text/javascript">
	window.onload = changeTab("10100","10102");
	$("#inputList tr").click(function(){
		var date = $(this).children().first().html();
		var params = {
			"dateAjax":date
		};
		jQuery.post("http://localhost:8080/ZZL/Warehouse/materialInDetail",params,function(data){
			var objs= eval(data);  
			var content = "";
			for(var i=0;i<objs.length;i++){
				var mo = objs[i];
				content+=("<tr onclick='fillDetailInfo(\""+mo.material.materialCode+"\","+mo.warehouse.warehouseid+")' data-toggle='modal' data-target='#detailModel'><td>"+mo.material.materialName+"</td><td>"+mo.user.userName+"</td><td>"+mo.materialInputVol+"</td><td>"+mo.store.remainVol+"</td></tr>");
			}
			$("#inputDetail").html(content);
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