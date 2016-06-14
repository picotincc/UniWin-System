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
       .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.input-group,.form-group{position: relative;float: left;width: 15%;}
.form-control{float: left;width: 100%;}
label {color: #555555;font-size: 12px; margin-left: 10px;}
#search-purchaselist{position: relative;float: left;width: 8%;height:34px;margin-left: 15px;margin-top: 23px;}
.table-responsive{margin-top: 10px;}
.table{border-top: 3px solid #7D9EC0;}
th{font-size: 12px;color: #4F4F4F;text-align: center;}
td{text-align: center;font-size:14px;}
tr{background-color:transpare}
.item-name{color:#0000ff;}
.purchaseCode{color:#008080;}
.commdity-graph{width: 60px;height: 80px;}
.modal-body{height: 400px;}
.modal-header{background-color: #3c8dbc;}
    </style>
    
    <title>ZZL-采购单管理</title>
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
                                                      采购管理
         <small>面料采购单管理</small>
     </h1>
     <ol class="breadcrumb">
         <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
         <li class="active">面料采购单管理</li>
     </ol>

 	</section>
 <!-- Main content -->
 <section class="content">
 	<div class="row">
         <div class="col-md-12">
               <div class="box box-primary">
 				<!-- 查询 -->
                     <form role="form" action="<%=request.getContextPath()%>/Purchase/searchPurchaseList"  method="post">
                    		<div class="row col-md-12">
                                     <div class="input-group">
                         <label for="name">款号</label> 
                         <input name="designCode" type="text" class="form-control form-input" value=${designCode}>
                            </div>
                            <div class="input-group">
                         <label for="name">供应商</label> 
                         <input name="vendor" type="text" class="form-control form-input" value=${vendor}>
                            </div>
                                    
                      <div class="form-group">
                      <label for="purchaseState">待操作状态</label> 
                      <select type="text" name="purchaseState" class="form-control">
		                   <option></option>
		                   <option>待审核</option>
		                   <option>待库存审核</option>
		                   <option>待电话订购</option>
		                   <option>待传码单</option>
		                   <option>待财务核对</option>
		                   <option>待核对面料</option>
		                   <option>采购完成（自有）</option>
		                   <option>审核不通过</option>
                      </select>
                      </div>
                      <div class="form-group">
                      <label for="oldOrNew">新或者老款</label> 
                      <select type="text" name="oldOrNew" class="form-control">
		                   <option></option>
		                   <option>新款</option>
		                   <option>老款</option>
                      </select>
                      </div>
                        <div class="input-group">
                         <label for="name">计划采购时间</label> <input name="scheduledPurchaseDate" 
                      type="text" class="form-control form-input date" 
                      maxlength="20">
                            </div>
                            <div class="input-group">
                         <label for="name">预计到货时间</label> <input name="eta" 
                      type="text" class="form-control form-input date" 
                      maxlength="20">
                            </div>
                                 
                                     <button type="submit"  id="search-purchaselist"
                         class="btn btn-primary">查询</button>
                     </div>
                     </form>
 
							 <div class="row col-md-12">
							 <div class="box-body">
								
								<table style="padding: 15px; margin: 20px">
									<tr>
										<td>
                                    	<button type="button" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="materialExamine()">用料审核</button>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	<button type="button" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="warehouseCheck()">库存审核</button>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="phoneOrder()">电话订购</button>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="fax()">传码单</button>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="financeCheck()">财务对账</button>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="materialCheck()">核对物料</button>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	<button type="submit" class="btn btn-danger" style="margin-top: 0px" data-toggle="modal" onclick="cancelPurchase()">作废</button>
                                    	</td>
									</tr>
								</table>
							</div>
 </div>
 
          <div class="row">
                          <div class="table-responsive" style="margin: 0px 50px 50px 23px">
                              <table class="table table-striped">
                                  <tr>
                                      <th></th>
                                      <th>图片</th>
                                      <th>采购单信息</th>
                                      <th>款式信息</th>
                                      <th>采购日期</th>
                                      <th>供应商</th>
                                      <th>状态</th>
                                      <th>待操作</th>
                                  </tr>     
                                  <tbody>                                  
                                  <s:iterator value="PageBean.list" var="pur">
                                  <tr onclick="javascript:judgeSelected(this)">
                                  	<td><input type="radio" name="select">
                                  	<input type="hidden" name="selectedID" value=${pur.purchaseID}>
                                  	<input type="hidden" name="selectedState" value=${pur.purchaseState}>
                                  	<input type="hidden" name="selectedMaterialCode" value=${pur.bom1.materialCode}>
                                  	<input type="hidden" name="selectedMaterialName" value=${pur.bom1.materialName}>
                                  	<input type="hidden" name="selectedMaterialType" value=${pur.bom1.materialType}>
                                  	<input type="hidden" name="selectedColorCode" value=${pur.bom1.colorCode}>
                                  	<input type="hidden" name="selectedUnitPrice" value=${pur.bom1.unitPrice}>
                                  	<input type="hidden" name="selectedVolPerDesign" value=${pur.bom1.volPerDesign}>
                                  	<input type="hidden" name="selectedTotalVol" value=${pur.bom1.totalVol}>
                                  	<input type="hidden" name="selectedVendorId" value=${pur.bom1.vendorId}>
                                  	<input type="hidden" name="selectedVendor" value=${pur.bom1.vendor}>
                                  	<input type="hidden" name="selectedPurchaseVol" value=${pur.bom1.purchaseVol}>
                                  	<input type="hidden" name="selectedAvailable" value=${pur.bom1.available}>
                                  	<input type="hidden" name="selectedWidth" value=${pur.bom1.width}>
                                  	<input type="hidden" name="selectedOrderCode" value=${pur.orderCode}>
                                  	<input type="hidden" name="selectedDesignCode" value=${pur.designCode}>
                                  	<input type="hidden" name="selectedPurchaseComment" value=${pur.purchaseComment}>
                                  	<input type="hidden" name="selectedEta" value=${pur.eta}>
                                  	<input type="hidden" name="selectedFaxTime" value=${pur.faxTime}>
                                  	<input type="hidden" name="selectedFinanceCheckTime" value=${pur.financeCheckTime}>
                                  	<input type="hidden" name="selectedMaterialPosition" value=${pur.bom1.materialPosition}>
                                  	<input type="hidden" name="selectedOutputVol" value=${pur.bom1.outputVol}>
                                  	</td>
                                      <td><img src="../images/1.png"class="commdity-graph"></td>                   
                                      <td><a href="<%=request.getContextPath()%>/Purchase/purchaseDetail?purchaseID=<s:property value="#pur.purchaseID" />"><s:property value="#pur.purchaseCode" /></a>
                                      <br/>
                                      <s:property value="#pur.orderPriority"/>
                                      </td>
                                      <td>款号：<s:property value="#pur.designCode"/>
                                      <br/>
                                      <s:property value="#pur.designNewOld"/>
                                      </td>
                                      <td><s:property value="#pur.scheduledPurchaseDate" />
                                      <br/>负责人：<s:property value="#pur.userName" />
                                      </td>
                                      <td><s:property value="#pur.vendors"/></td>
                                      <td><!-- 根据状态显示图片 -->
												<p >
												<s:if test="#pur.purchaseState.equals('待库存审核')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
												</s:if>
												<s:if test="#pur.purchaseState.equals('待电话订购')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/warehousecheck.png">
												</s:if>
												<s:if test="#pur.purchaseState.equals('待传码单')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/warehousecheck.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
												</s:if>
												<s:if test="#pur.purchaseState.equals('待财务对账')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/warehousecheck.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/fax.png">
												</s:if>
												<s:if test="#pur.purchaseState.equals('待核对面料')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/warehousecheck.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/fax.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/finance.png">
												</s:if>
												<s:if test="#pur.purchaseState.equals('采购完成（自有）')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/warehousecheck.png">
													
												</s:if>
												<s:if test="#pur.purchaseState.equals('采购完成（订购）')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/warehousecheck.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/fax.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/finance.png">
												</s:if>
												</p></td>
                                      <td><s:property value="#pur.purchaseState" /></td>
                                  </tr>
                                  </s:iterator>
                                  </tbody>
                              </table>
                              <jsp:include page="../../page2.jsp">
									<jsp:param name="action" value="purchaselist" />
						   			</jsp:include>
                          </div>
                      </div>
                      </div>
                      </div>
                      </div>
            </section>
	
	</aside>

</div>

<!-- 模态框（Modal） -->
	<div class="modal fade" id="materialExamine" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">用料审核</h4>
				</div>
				<div class="modal-body">
                    <div style="word-break:break-all">
                     <div class="table-responsive" style="margin-top:50px;">
                     <table class="table table-striped" id="materialExamineTable">
                            <thead>
                            <tr>
                                <th>物料编号</th>
                                <th>物料名称</th>
                                <th>主/辅料</th>
                                <th>色号</th>
                                <th>单价</th>
                                <th>单件用量</th>
                                <th>数量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <td id="td1"></td>
                            <td id="td2"></td>
                            <td id="td3"></td>
                            <td id="td4"></td>
                            <td id="td5"></td>
                            <td id="td6"></td>
                            <td id="td7"></td>
                            </tbody>
                            
                        </table><!-- /.table -->
						</div>
						</div>
						
						<form action="<%=request.getContextPath()%>/Purchase/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购单号：</td>
									<td><input type="text" name="changeCode" id="changeCode1"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><input type="text" name="changeState" id="changeState1"  style="width:170px" readonly="true"></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
						
						</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
					</button>
					</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- /.modal -->
	<div class="modal fade" id="warehouseCheck" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">库存审核</h4>
				</div>
				<div class="modal-body">
                    <div style="word-break:break-all">
                     <div class="table-responsive" style="margin-top:50px;">
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>物料编号</th>
                                <th>物料名称</th>
                                <th>主/辅料</th>
                                <th>色号</th>
                                <th>单价</th>
                                <th>供应商编号</th>
                                <th>供应商</th>
                                <th>单件用量</th>
                                <th>计划采购</th>
                                <th>可用库存</th>
                                <th>门幅</th>
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            <td id="td8"></td>
                            <td id="td9"></td>
                            <td id="td10"></td>
                            <td id="td11"></td>
                            <td id="td12"></td>
                            <td id="td13"></td>
                            <td id="td14"></td>
                            <td id="td15"></td>
                            <td id="td16"></td>
                            <td id="td17"></td>
                            <td id="td18"></td>
                            </tbody>
                            
                        </table><!-- /.table -->
						</div>
						</div>
						<form action="<%=request.getContextPath()%>/Purchase/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购号：</td>
									<td><input type="text" name="changeCode" id="changeCode2"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><input type="text" name="changeState" id="changeState2"  style="width:170px" readonly="true"></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
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
	
	<div class="modal fade" id="phoneOrder" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">电话订购</h4>
				</div>
				<div class="modal-body">
                    <div style="word-break:break-all">
                     <div class="table-responsive" style="margin-top:50px;">
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>物料名称</th>
                                <th>色号</th>
                                <th>涉及的订单号</th>
                                <th>涉及的款号</th>
                                <th>用量</th>
                                <th>供应商</th>
                                <th>备注</th>
                                
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            <td id="td19"></td>
                            <td id="td20"></td>
                            <td id="td21"></td>
                            <td id="td22"></td>
                            <td id="td23"></td>
                            <td id="td24"></td>
                            <td id="td25"></td>
                            </tbody>
                            
                        </table><!-- /.table -->
						</div>
						</div>
						<form action="<%=request.getContextPath()%>/Purchase/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购单号：</td>
									<td><input type="text" name="changeCode" id="changeCode3"  style="width:70px" readonly="true"></td>
									<td>状态：</td>
									<td ><input type="text" name="changeState" id="changeState3"  style="width:100px" readonly="true"></td>
									<td>供应商：</td>
									<td ><input type="text" name="vendorID3" id="vendorID3"  style="width:70px" readonly="true"></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
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
	
	<div class="modal fade" id="fax" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">传码单</h4>
				</div>
				<div class="modal-body">
                    <div style="word-break:break-all">
                     <div class="table-responsive" style="margin-top:50px;">
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>部位</th>
                                <th>物料编号/名称</th>
                                <th>色号</th>
                                <th>出量</th>
                                <th>单价</th>
                                <th>供应商信息</th>
                                <th>预计到达时间</th>
                                <th>计划数量</th>
                                <th>实际数量</th>
                                <th>码单</th>
                                <th>财务核对</th>
                                <th>面料核对</th>
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            <td id="td26"></td>
                            <td id="td27"></td>
                            <td id="td28"></td>
                            <td id="td29"></td>
                            <td id="td30"></td>
                            <td id="td31"></td>
                            <td id="td32"></td>
                            <td id="td33"></td>
                            <td id="td34"></td>
                            <td>待传码单</td>
                            <td>待财务对账</td>
                            <td>待面料核对</td>
                            </tbody>
                            
                        </table><!-- /.table -->
						</div>
						</div>
						<form action="<%=request.getContextPath()%>/Purchase/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购单号：</td>
									<td><input type="text" name="changeCode" id="changeCode4"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><input type="text" name="changeState" id="changeState4"  style="width:170px" readonly="true"></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
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
	
	<div class="modal fade" id="financeCheck" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">财务核对</h4>
				</div>
				<div class="modal-body">
                    <div style="word-break:break-all">
                     <div class="table-responsive" style="margin-top:50px;">
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>部位</th>
                                <th>物料编号/名称</th>
                                <th>色号</th>
                                <th>出量</th>
                                <th>单价</th>
                                <th>供应商信息</th>
                                <th>预计到达时间</th>
                                <th>计划数量</th>
                                <th>实际数量</th>
                                <th>码单</th>
                                <th>财务核对</th>
                                <th>面料核对</th>
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            <td id="td35"></td>
                            <td id="td36"></td>
                            <td id="td37"></td>
                            <td id="td38"></td>
                            <td id="td39"></td>
                            <td id="td40"></td>
                            <td id="td41"></td>
                            <td id="td42"></td>
                            <td id="td43"></td>
                            <td id="td44"></td>
                            <td>待财务核对</td>
                            <td>待面料核对</td>
                            </tbody>
                            
                        </table><!-- /.table -->
						</div>
						</div>
						<form action="<%=request.getContextPath()%>/Purchase/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购单号：</td>
									<td><input type="text" name="changeCode" id="changeCode5"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><input type="text" name="changeState" id="changeState5"  style="width:170px" readonly="true"></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
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
	
	<div class="modal fade" id="materialCheck" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">面料核对</h4>
				</div>
				<div class="modal-body">
                    <div style="word-break:break-all">
                     <div class="table-responsive" style="margin-top:50px;">
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>部位</th>
                                <th>物料编号/名称</th>
                                <th>色号</th>
                                <th>出量</th>
                                <th>单价</th>
                                <th>供应商信息</th>
                                <th>预计到达时间</th>
                                <th>计划数量</th>
                                <th>实际数量</th>
                                <th>码单</th>
                                <th>财务核对</th>
                                <th>面料核对</th>
                                <th>门幅</th>
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            <td id="td45"></td>
                            <td id="td46"></td>
                            <td id="td47"></td>
                            <td id="td48"></td>
                            <td id="td49"></td>
                            <td id="td50"></td>
                            <td id="td51"></td>
                            <td id="td52"></td>
                            <td id="td53"></td>
                            <td id="td54"></td>
                            <td id="td55"></td>
                            <td>待面料核对</td>
                            <td id="td56"></td>
                            </tbody>
                            
                        </table><!-- /.table -->
						</div>
						</div>
						<form action="<%=request.getContextPath()%>/Purchase/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购单号：</td>
									<td><input type="text" name="changeCode" id="changeCode6"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><input type="text" name="changeState" id="changeState6"  style="width:170px" readonly="true"></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
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
	<div class="modal fade" id="cancel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 400px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">废弃外发单</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Purchase/cancelPurchase" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>采购单号：</td>
									<td><input type="text" name="cancelCode" id="cancelCode" ></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											作废</button></td>
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
    $('.scheduledPurchaseDate').datetimepicker({
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
    $('.eta').datetimepicker({
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
    
    
    
    
        	function materialExamine(){
        		var selectedID =	$(".checked + input[name='selectedID']").val();
        		var selectedState = $(".checked + input[name='selectedID'] + input[name='selectedState']").val();
        		var selectedMaterialCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']").val();
        		var selectedMaterialName = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']").val();
        		var selectedMaterialType = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']").val();
        		var selectedColorCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']").val();
        		var selectedUnitPrice = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']").val();
        		var selectedVolPerDesign = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']").val();
        		var selectedTotalVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']").val();
        		var selectedVendorId = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']").val();
        		var selectedVendor = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']").val();
        		var selectedPurchaseVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']").val();
        		var selectedAvailable = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']").val();
        		var selectedWidth = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']").val();
        		var selectedOrderCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']").val();
        		var selectedDesignCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']").val();
        		var selectedPurchaseComment = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']").val();
        		var selectedEta = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']").val();
        		var selectedFaxTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']").val();
        		var selectedFinanceCheckTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']").val();
        		
        		
        		if(selectedID != null){
        			if( selectedState == "待审核"){
        				$('#changeCode1').val(selectedID);
        				$("#changeState1").val(selectedState);
        				document.getElementById("td1").innerHTML = selectedMaterialCode;
        				document.getElementById("td2").innerHTML = selectedMaterialName;
        				document.getElementById("td3").innerHTML = selectedMaterialType;	
        				document.getElementById("td4").innerHTML = selectedColorCode;
        				document.getElementById("td5").innerHTML = selectedUnitPrice;
        				document.getElementById("td6").innerHTML = selectedVolPerDesign;
        				document.getElementById("td7").innerHTML = selectedTotalVol;
        				$('#materialExamine').modal('show');
        			}else{
        				alert("该补料单并非待审核状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function warehouseCheck(){
        		var selectedID =	$(".checked + input[name='selectedID']").val();
        		var selectedState = $(".checked + input[name='selectedID'] + input[name='selectedState']").val();
        		var selectedMaterialCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']").val();
        		var selectedMaterialName = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']").val();
        		var selectedMaterialType = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']").val();
        		var selectedColorCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']").val();
        		var selectedUnitPrice = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']").val();
        		var selectedVolPerDesign = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']").val();
        		var selectedTotalVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']").val();
        		var selectedVendorId = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']").val();
        		var selectedVendor = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']").val();
        		var selectedPurchaseVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']").val();
        		var selectedAvailable = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']").val();
        		var selectedWidth = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']").val();
        		var selectedOrderCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']").val();
        		var selectedDesignCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']").val();
        		var selectedPurchaseComment = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']").val();
        		var selectedEta = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']").val();
        		var selectedFaxTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']").val();
        		var selectedFinanceCheckTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']").val();
        		if(selectedID != null){
        			if( selectedState == "待库存审核"){
        				$('#changeCode2').val(selectedID);
        				$("#changeState2").val(selectedState);
        				document.getElementById("td8").innerHTML = selectedMaterialCode;
        				document.getElementById("td9").innerHTML = selectedMaterialName;
        				document.getElementById("td10").innerHTML = selectedMaterialType;	
        				document.getElementById("td11").innerHTML = selectedColorCode;
        				document.getElementById("td12").innerHTML = selectedUnitPrice;
        				document.getElementById("td13").innerHTML = selectedVendorId;
        				document.getElementById("td14").innerHTML = selectedVendor;
        				document.getElementById("td15").innerHTML =selectedVolPerDesign;
        				document.getElementById("td16").innerHTML =selectedPurchaseVol;
        				document.getElementById("td17").innerHTML =selectedAvailable;
        				document.getElementById("td18").innerHTML =selectedWidth;
        				$('#warehouseCheck').modal('show');
        			}else{
        				alert("该补料单并非待库存审核状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function phoneOrder(){
        		var selectedID =	$(".checked + input[name='selectedID']").val();
        		var selectedState = $(".checked + input[name='selectedID'] + input[name='selectedState']").val();
        		var selectedMaterialCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']").val();
        		var selectedMaterialName = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']").val();
        		var selectedMaterialType = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']").val();
        		var selectedColorCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']").val();
        		var selectedUnitPrice = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']").val();
        		var selectedVolPerDesign = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']").val();
        		var selectedTotalVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']").val();
        		var selectedVendorId = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']").val();
        		var selectedVendor = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']").val();
        		var selectedPurchaseVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']").val();
        		var selectedAvailable = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']").val();
        		var selectedWidth = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']").val();
        		var selectedOrderCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']").val();
        		var selectedDesignCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']").val();
        		var selectedPurchaseComment = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']").val();
        		var selectedEta = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']").val();
        		var selectedFaxTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']").val();
        		var selectedFinanceCheckTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']").val();
        		if(selectedID != null){
        			if( selectedState == "待电话订购"){
        				$('#changeCode3').val(selectedID);
        				$("#changeState3").val(selectedState);
        				$("#vendorID3").val(selectedVendorId);
        				document.getElementById("td19").innerHTML = selectedMaterialName;
        				document.getElementById("td20").innerHTML = selectedColorCode;
        				document.getElementById("td21").innerHTML = selectedOrderCode;	
        				document.getElementById("td22").innerHTML = selectedDesignCode;
        				document.getElementById("td23").innerHTML = selectedTotalVol;
        				document.getElementById("td24").innerHTML = selectedVendor;
        				document.getElementById("td25").innerHTML = selectedPurchaseComment;
        				
        				$('#phoneOrder').modal('show');
        			}else{
        				alert("该补料单并非电话订购状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function fax(){
        		var selectedID =	$(".checked + input[name='selectedID']").val();
        		var selectedState = $(".checked + input[name='selectedID'] + input[name='selectedState']").val();
        		var selectedMaterialCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']").val();
        		var selectedMaterialName = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']").val();
        		var selectedMaterialType = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']").val();
        		var selectedColorCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']").val();
        		var selectedUnitPrice = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']").val();
        		var selectedVolPerDesign = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']").val();
        		var selectedTotalVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']").val();
        		var selectedVendorId = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']").val();
        		var selectedVendor = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']").val();
        		var selectedPurchaseVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']").val();
        		var selectedAvailable = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']").val();
        		var selectedWidth = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']").val();
        		var selectedOrderCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']").val();
        		var selectedDesignCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']").val();
        		var selectedPurchaseComment = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']").val();
        		var selectedEta = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']").val();
        		var selectedFaxTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']").val();
        		var selectedFinanceCheckTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']").val();
        		var selectedMaterialPosition = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']+input[name='selectedMaterialPosition']").val();
        		var selectedOutputVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']+input[name='selectedMaterialPosition']+input[name='selectOutputVol']").val();
        		if(selectedID != null){
        			if( selectedState == "待传码单"){
        				$('#changeCode4').val(selectedID);
        				$("#changeState4").val(selectedState);
        				document.getElementById("td26").innerHTML = selectedMaterialPosition;
        				document.getElementById("td27").innerHTML = selectedMaterialCode+"/"+selectedMaterialName;
        				document.getElementById("td28").innerHTML = selectedColorCode;	
        				document.getElementById("td29").innerHTML = selectedOutputVol;
        				document.getElementById("td30").innerHTML = selectedUnitPrice;
        				document.getElementById("td31").innerHTML = selectedVendor;
        				document.getElementById("td32").innerHTML = selectedEta;
        				document.getElementById("td33").innerHTML = selectedTotalVol;
        				document.getElementById("td34").innerHTML = selectedTotalVol;
        				$('#fax').modal('show');
        			}else{
        				alert("该补料单并非待传码单状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function financeCheck(){
        		var selectedID =	$(".checked + input[name='selectedID']").val();
        		var selectedState = $(".checked + input[name='selectedID'] + input[name='selectedState']").val();
        		var selectedMaterialCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']").val();
        		var selectedMaterialName = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']").val();
        		var selectedMaterialType = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']").val();
        		var selectedColorCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']").val();
        		var selectedUnitPrice = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']").val();
        		var selectedVolPerDesign = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']").val();
        		var selectedTotalVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']").val();
        		var selectedVendorId = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']").val();
        		var selectedVendor = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']").val();
        		var selectedPurchaseVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']").val();
        		var selectedAvailable = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']").val();
        		var selectedWidth = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']").val();
        		var selectedOrderCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']").val();
        		var selectedDesignCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']").val();
        		var selectedPurchaseComment = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']").val();
        		var selectedEta = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']").val();
        		var selectedFaxTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']").val();
        		var selectedFinanceCheckTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']").val();
        		var selectedMaterialPosition = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']+input[name='selectedMaterialPosition']").val();
        		var selectedOutputVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']+input[name='selectedMaterialPosition']+input[name='selectOutputVol']").val();
        		if(selectedID != null){
        			if( selectedState == "待财务对账"){
        				$('#changeCode5').val(selectedID);
        				$("#changeState5").val(selectedState);
        				document.getElementById("td35").innerHTML = selectedMaterialPosition;
        				document.getElementById("td36").innerHTML = selectedMaterialCode+"/"+selectedMaterialName;
        				document.getElementById("td37").innerHTML = selectedColorCode;	
        				document.getElementById("td38").innerHTML = selectedOutputVol;
        				document.getElementById("td39").innerHTML = selectedUnitPrice;
        				document.getElementById("td40").innerHTML = selectedVendor;
        				document.getElementById("td41").innerHTML = selectedEta;
        				document.getElementById("td42").innerHTML = selectedTotalVol;
        				document.getElementById("td43").innerHTML = selectedTotalVol;
        				document.getElementById("td44").innerHTML = selectedFaxTime;
        				$('#financeCheck').modal('show');
        			}else{
        				alert("该补料单并非待财务对账状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function materialCheck(){
        		var selectedID =	$(".checked + input[name='selectedID']").val();
        		var selectedState = $(".checked + input[name='selectedID'] + input[name='selectedState']").val();
        		var selectedMaterialCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']").val();
        		var selectedMaterialName = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']").val();
        		var selectedMaterialType = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']").val();
        		var selectedColorCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']").val();
        		var selectedUnitPrice = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']").val();
        		var selectedVolPerDesign = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']").val();
        		var selectedTotalVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']").val();
        		var selectedVendorId = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']").val();
        		var selectedVendor = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']").val();
        		var selectedPurchaseVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']").val();
        		var selectedAvailable = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']").val();
        		var selectedWidth = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']").val();
        		var selectedOrderCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']").val();
        		var selectedDesignCode = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']").val();
        		var selectedPurchaseComment = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']").val();
        		var selectedEta = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']").val();
        		var selectedFaxTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']").val();
        		var selectedFinanceCheckTime = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']").val();
        		var selectedMaterialPosition = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']+input[name='selectedMaterialPosition']").val();
        		var selectedOutputVol = $(".checked+input[name='selectedID']+input[name='selectedState']+input[name='selectedMaterialCode']+input[name='selectedMaterialName']+input[name='selectedMaterialType']+input[name='selectedColorCode']+input[name='selectedUnitPrice']+input[name='selectedVolPerDesign']+input[name='selectedTotalVol']+input[name='selectedVendorId']+input[name='selectedVendor']+input[name='selectedPurchaseVol']+input[name='selectedAvailable']+input[name='selectedWidth']+input[name='selectedOrderCode']+input[name='selectedDesignCode']+input[name='selectedPurchaseComment']+input[name='selectedEta']+input[name='selectedFaxTime']+input[name='selectedFinanceCheckTime']+input[name='selectedMaterialPosition']+input[name='selectOutputVol']").val();
        		if(selectedID != null){
        			if( selectedState == "待核对面料"){
        				$('#changeCode6').val(selectedID);
        				$("#changeState6").val(selectedState);
        				document.getElementById("td45").innerHTML = selectedMaterialPosition;
        				document.getElementById("td46").innerHTML = selectedMaterialCode+"/"+selectedMaterialName;
        				document.getElementById("td47").innerHTML = selectedColorCode;
        				document.getElementById("td48").innerHTML = selectedOutputVol;
        				document.getElementById("td49").innerHTML = selectedUnitPrice;
        				document.getElementById("td50").innerHTML = selectedVendor;
        				document.getElementById("td51").innerHTML = selectedEta;
        				document.getElementById("td52").innerHTML = selectedTotalVol;
        				document.getElementById("td53").innerHTML = selectedTotalVol;
        				document.getElementById("td54").innerHTML = selectedFaxTime;
        				document.getElementById("td55").innerHTML = selectedFinanceCheckTime;
        				document.getElementById("td56").innerHTML = selectedWidth;
        				$('#materialCheck').modal('show');
        			}else{
        				alert("该补料单并非待核对面料状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function cancelPurchase(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		alert(selectedID);
        		if(selectedID != null){
        			$("#cancelCode").val(selectedID);
        			$('#cancelCode').attr("readonly",true);
        			$('#cancel').modal('show');
        		}else{
        			alert("请选择");
        		}
        	}
    	</script>
    	
    	<script type="text/javascript">
    	window.onload = changeTab("10500","10501");
    	</script>
    	
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

</body>
</html>