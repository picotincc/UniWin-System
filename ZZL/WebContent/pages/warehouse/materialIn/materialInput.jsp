<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../../header.jsp"></jsp:include>
<title>智造链-入库</title>

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
                    <small>入库</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">面辅料入库</h3>
                            </div>
                                <form class="form-horizontal" role="form" method="post" action="searchMaterial">
									<div class="form-group">
										   <label  class="col-md-2 control-label">物料编号：</label>
										   <div class="col-md-3">
										       <input type="text" class="form-control" name="materialCode">
										    </div>
										    <label class="col-md-2 col-md-offset-1 control-label">款号：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" name="designCode">
	                                        </div>
									           <br/><br/>
										    <label class="col-md-2 control-label">入库类型：</label>
	                                        <div class="col-md-3">
	                                            <select class="form-control" name="materialType">
	                                            	<option value="面料">面料</option>
	                                            	<option value="辅料">辅料</option>
	                                            </select>
	                                        </div>
	                                        <label class="col-md-2 col-md-offset-1 control-label">采购单号：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" name="purchaseCode">
	                                        </div>
	                                        <br/><br/><br/>
	                                        <div class="col-md-offset-10 col-md-1">
	                                           <button style="width:100%;" class="btn btn-primary" type="submit">查询</button>
	                                        </div>
									</div>
							     </form>
					                <div class="row">
					                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
					                                    <table class="table" onselectstart="return false">
					                                        <tr >
					                                            <th>物料编码</th>
					                                            <th>物料名称</th>
					                                            <th>物料类型</th>
					                                            <th>供应商</th>
					                                            <th>颜色</th>
					                                        </tr>                                       
					                                        <s:iterator value="pageBean.list" id="mnv">
					                                        <tr class="click" style="cursor:pointer">
					                                            <td><s:property value="#mnv.materialCode" /></td>
					                                            <td><s:property value="#mnv.materialName" /></td>
					                                            <td><s:property value="#mnv.materialType" /></td>
																<td><s:property value="#mnv.vendor.vendorName" /></td>
					                                            <td><s:property value="#mnv.colorDescription" /></td>
					                                           
					                                        </tr>
					                                        </s:iterator>
					                                        
					                                    </table>
					                                </div>
					                            </div>
					                            <div class="row" style="margin-left:10px">
								                        <%@include file="../../../page.jsp" %>    
					                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                	<div class="col-md-12">
                			<h3 style="color:#0066CC" class="box-title" id="message">基础信息 >></h3>
 							<form class="form-horizontal" role="form" method="post" action="addInMaterial">
									<div class="form-group">
										   <label  class="col-md-2 control-label" >物料名称：</label>
										   <div class="col-md-3">
										       <input type="text" class="form-control" readonly="readonly" id="materialName">
										    </div>
										    <label class="col-md-2 col-md-offset-1 control-label">物料编号：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" readonly="readonly" id="materialCode" name="materialCodeA">
	                                        </div>
									           <br/><br/>
										    <label class="col-md-2 control-label">色号：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" disabled="disabled" id="colorCode">
	                                        </div>
	                                        <label class="col-md-2 col-md-offset-1 control-label">入库时间：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" disabled="disabled" id="modificationDate">
	                                        </div>
	                                        <br/><br/>
										    <label class="col-md-2 control-label">供应商名称：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" readonly="readonly" id="vendorName" name="vendorName">
	                                        </div>
	                                        <label class="col-md-2 col-md-offset-1 control-label">联系电话：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" disabled="disabled" id="vendorMobile">
	                                        </div>
	                                        <br/><br/>
	                                        <label class="col-md-2 control-label">供应商地址：</label>
	                                        <div class="col-md-9">
	                                            <input type="text" class="form-control" disabled="disabled" id="vendorAddr">
	                                        </div>
	                                        
									</div>
							     	

                
							<s:iterator value="#session.authorityList" id="low">
							<s:if test="#low.highAuthName=='入库管理'&&#low.middleAuthName=='入库'&&#low.lowAuthName=='确认入仓'">
							
                			<h3 style="color:#0066CC" class="box-title">库存信息 >></h3>
 							
									<div class="form-group">
											<label  class="col-md-2 control-label">仓储位置：</label>
										   	<div class="col-md-3">
										        <select class="form-control" id="location" onchange='showstoreinfo(this)' name="location">

	                                            </select>
										    </div>
										    <label class="col-md-2 col-md-offset-1 control-label">库存数量：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" disabled="disabled" id="remainVol">
	                                        </div>
									           <br/><br/>
									           
									        <label  class="col-md-2 control-label">入库数量：</label>
										   	<div class="col-md-3">
										       <input type="text" class="form-control" name="materialInputVol">
										    </div>
										    <label class="col-md-2 col-md-offset-1 control-label">可用库存：</label>
	                                        <div class="col-md-3">
	                                            <input type="text" class="form-control" disabled="disabled" id="remain">
	                                        </div>
	                                        <br/><br/><br/>
	                                        <div class="col-md-offset-10 col-md-1">
	                                           <button style="width:100%;" class="btn btn-primary" type="submit">确定</button>
	                                        </div>
									</div>
									</s:if>
									</s:iterator>
									
							</form>  	
                	</div>
                </div>
            </section>
        </aside>
    </div>
    	</s:if>
		<s:else>
			<jsp:include page="../../../login.jsp"></jsp:include>
		</s:else>
    <script type="text/javascript">
    	window.onload = changeTab("10100","10101");
    	$(".click").click(function(){    	
    		var trlist=document.getElementsByTagName("tr");   		
    		for(i=0;i<trlist.length;i++){
    			trlist[i].bgColor="white";
    		}
    		this.bgColor="#99CCFF";
    		
    		window.location.hash="#message";
    		
    		var materialCodeAjax=$(this).children().eq(0).html();
    		var vendorNameAjax=$(this).children().eq(3).html();
    		
    		var params = {
    				"materialCodeAjax":materialCodeAjax,
    				"vendorNameAjax":vendorNameAjax
    			};
			jQuery.post("http://localhost:8080/ZZL/Warehouse/materialDetail",params,function(data){ 

				var obj=eval("("+data+")");
				$("#materialName").val(obj[0].material.materialName);
				$("#materialCode").val(obj[0].material.materialCode);
				$("#colorCode").val(obj[0].material.colorCode);
				$("#modificationDate").val(obj[0].material.modificationDate);
				$("#vendorName").val(obj[0].vendor.vendorName);
				$("#vendorMobile").val(obj[0].vendor.vendorMobile);
				$("#vendorAddr").val(obj[0].vendor.vendorAddr);
				
				$("#remainVol").val(obj[0].remainVol);
				$("#remain").val(obj[0].remain);
				
				var location=obj[0].location;
				var content="";
				for(i=0;i<location.length;i++){
					content+="<option value='"+location[i]+"'>"+location[i]+"</option>";
				}
				$("#location").html(content);
			},"json");

    	});
    	
    	function showstoreinfo(obj){
    		var locationAjax=obj.options[obj.selectedIndex].text;
    		var materialCodeAjax=document.getElementById("materialCode").value;
    		var params = {
    			"materialCodeAjax":materialCodeAjax,
				"locationAjax":locationAjax				
    			};
			jQuery.post("http://localhost:8080/ZZL/Warehouse/locationAjax",params,function(data){ 
				var obj=eval("("+data+")");
				$("#remainVol").val(obj[0].remainVol);
				$("#remain").val(obj[0].remain);
			},"json");
    	}
    	
    	
    </script>
</body>
</html>