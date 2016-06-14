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
                                          补料单管理
                    <small></small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">物料补料单管理</h3>
                            </div><!-- /.box-header -->
                            
                      
                            
                            <!-- 详细查询 -->
                            <div class="row">
						<div class="col-md-12">
							<div class="box-body">
								<form role="form" method="post" action="<%=request.getContextPath()%>/Supplement/showSearchedSupplements">
								<table style="padding: 15px; margin: 20px">
									<tr>
										<td class="supplement-info">款号：</td>
										<td><input type="text" name="designCode"></td>
										<td class="supplement-info">补料日期：</td>
										<td><input type="text" class="date-picker" name="supplementDate"></td>
										<td class="supplement-info">物料类型：</td>
										<td><select name="materialType">
											<option value="">请选择</option>
											<option value="面料">面料</option>
											<option value="辅料">辅料</option>
											</select></td>
									</tr>
									<tr>
										<td class="supplement-info">供应商：</td>
										<td><input type="text" name="vendorName"></td>
										<td class="supplement-info">待操作状态：</td>
										<td><select name="supplementState">
											<option value="">请选择</option>
											<option value="待审核">待审核</option>
											<option value="待电话订购">待电话订购</option>
											<option value="待核对传码单">待核对传码单</option>
											<option value="待财务对账">待财务对账</option>
											<option value="待核对物料">待核对物料</option>
											<option value="核对完成">核对完成</option>
											<option value="审核不通过">审核不通过</option>
											
											</select></td>
										<td>&nbsp;</td>	
										<td>
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px">查询</button>
                                    	</td>
									</tr>
									
								</table>
								</form>
							</div>
						</div>
					</div>
                                <!-- 对补料单状态操作 -->
                            <div class="row">
						<div class="col-md-12">
							<div class="box-body">
								
								<table style="padding: 15px; margin: 20px">
									<tr>
										<td>
										<s:iterator value="#session.authorityList" id="low">
										<s:if test="#low.highAuthName=='补料单'&&#low.middleAuthName=='物料补料单'&&#low.lowAuthName==’操作状态’">										
                                    	<button type="button" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="changeSelected()">操作</button>
                                    	</s:if>
										</s:iterator>
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
										<td>
										
                                    	<button type="button" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="examine()">审核</button>
                                    	
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="phoneOrder()">电话订购</button>
                                    	
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="fax()">核对传码单</button>
                                    	
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="finance()">财务对账</button>
                                    	
                                    	</td>
                                    	<td>&nbsp;&nbsp;</td>
                                    	<td>
                                    	
                                    	<button type="submit" class="btn btn-primary" style="margin-top: 0px" data-toggle="modal" onclick="materialExamine()">核对物料</button>
                                    	
                                    	</td>
									</tr>
								</table>
							</div>
						</div>
					</div>    
                                   
                                                        
                            <!-- 表格  -->
                            <div class="row">
                                <div class="table-responsive" style="overflow-x:scroll;">
                                    <table class="table table-striped">
                                        <tr>
                                            <th></th>
                                            <th>补料单号</th>
                                            <th>款式信息</th>
                                            <th>补料日期</th>
                                            <th>供应商</th>
                                            <th>状态</th>
                                            <th>待操作</th>
                                        </tr> 
                                        <tbody>                                      
                                        <s:iterator value="PageBean.list" var="supplementItem">
										<tr onclick="javascript:judgeSelected(this)">
											<td style=" vertical-align:middle;">
												<input type="radio" name="select">
												<input type="hidden" name="selectedCode" value=${supplementItem.supplementCode}>
												<input type="hidden" name="selectedState" value=${supplementItem.supplementState}>
											</td>	
											<td>
											<a href="<%=request.getContextPath() %>/Supplement/supplementDetail?supplementCode=<s:property value='#supplementItem.supplementCode'/>" style="color:blue;">
											<s:property value="#supplementItem.supplementCode" /></a>
											</td>
											<td>
												<s:if test="#supplementItem.designCode==null">
													<a style="color:red;">此单为常规性补料，无款式信息</a>
												</s:if>
												<s:else>
												<a style="color:blue;">款号：</a><s:property value="#supplementItem.designCode" /><br/>
												<a style="color:blue;">款名：</a><s:property value="#supplementItem.designName" />
												</s:else>
											</td>
											<td>
												<s:property value="#supplementItem.supplementDate" /><br/>
												<a style="color:blue;">负责人：</a><s:property value="#supplementItem.userName" />												
											</td>
											<td>
												<s:property value="#supplementItem.vendorName" />:<s:property value="#supplementItem.vendorPhoneNum" />
													</td>
											<td class="tc5">
												<!-- 根据状态显示图片 -->
												<p >
												<s:if test="#supplementItem.supplementState.equals('待电话订购')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
												</s:if>
												<s:if test="#supplementItem.supplementState.equals('待核对传码单')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
												</s:if>
												<s:if test="#supplementItem.supplementState.equals('待财务对账')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/fax.png">
												</s:if>
												<s:if test="#supplementItem.supplementState.equals('待核对物料')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/fax.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/finance.png">
												</s:if>
												<s:if test="#supplementItem.supplementState.equals('核对完成')">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/examine.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/phoneorder.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/fax.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/finance.png">
													<img class="purchase-graph" src="<%=request.getContextPath()%>/images/materialExamine.png">
												</s:if>
												</p>
											</td>
											<td><s:property value="#supplementItem.supplementState" /></td>
										</tr>
										</s:iterator>
                                        </tbody>
                                    </table><!-- /.table -->
                                    <jsp:include page="../../page2.jsp">
									<jsp:param name="action" value="supplementlist" />
						   			</jsp:include>
                                </div><!-- /.table-responsive -->                     
                            </div><!-- /.table-row -->
                        </div><!-- /.box-->
                    </div>
                </div>           
            </section>
        </aside>
    </div>
 
 <!-- 模态框（Modal） -->
	<div class="modal fade" id="changeState" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">补料单审核</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Supplement/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>补料单号：</td>
									<td><input type="text" name="changeCode" id="changeCode"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><select name="supplementState"  id="supplementState" style="width:100px;height:28px">
											<option value="待审核">待审核</option>
											<option value="待电话订购">待电话订购</option>
											<option value="待核对传码单">待核对传码单</option>
											<option value="待财务对账">待财务对账</option>
											<option value="待核对物料">待核对物料</option>
											<option value="核对完成">核对完成</option>
											<option value="审核不通过">审核不通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
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
	<div class="modal fade" id="examine" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">补料单操作</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Supplement/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>补料单号：</td>
									<td><input type="text" name="changeCode" id="changeCode1"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><select name="supplementState"  id="supplementState1" style="width:100px;height:28px">
											<option value="待审核">待审核</option>
											<option value="待电话订购">通过审核</option>
											<option value="审核不通过">不通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											保存</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	 <!-- 模态框（Modal） -->
	<div class="modal fade" id="phoneOrder" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">补料单操作</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Supplement/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>补料单号：</td>
									<td><input type="text" name="changeCode" id="changeCode2"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><select name="supplementState"  id="supplementState2" style="width:100px;height:28px">
											<option value="待电话订购">待电话订购</option>
											<option value="待核对传码单">通过电话订购</option>
											<option value="审核不通过">不通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											保存</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	 <!-- 模态框（Modal） -->
	<div class="modal fade" id="fax" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">补料单操作</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Supplement/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>补料单号：</td>
									<td><input type="text" name="changeCode" id="changeCode3"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><select name="supplementState"  id="supplementState3" style="width:100px;height:28px">
											<option value="待核对传码单">待核对传码单</option>
											<option value="待财务对账">通过核对传码单</option>
											<option value="审核不通过">不通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											保存</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	 <!-- 模态框（Modal） -->
	<div class="modal fade" id="finance" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">补料单操作</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Supplement/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>补料单号：</td>
									<td><input type="text" name="changeCode" id="changeCode4"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><select name="supplementState"  id="supplementState4" style="width:100px;height:28px">
											<option value="待财务对账">待财务对账</option>
											<option value="待核对物料">通过财务对账</option>
											<option value="审核不通过">不通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											保存</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	 <!-- 模态框（Modal） -->
	<div class="modal fade" id="materialExamine" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">补料单操作</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Supplement/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>补料单号：</td>
									<td><input type="text" name="changeCode" id="changeCode5"  style="width:170px" readonly="true"></td>
									<td>状态：</td>
									<td ><select name="supplementState"  id="supplementState5" style="width:100px;height:28px">
											<option value="待核对物料">待核对物料</option>
											<option value="核对完成">核对完成</option>
											<option value="审核不通过">不通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											保存</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消
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
        	
        	function changeSelected(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
        		if(selectedCode != null){
        			if(( selectedState != "核对完成")&&(selectedState != "审核不通过")){
        				$('#changeCode').val(selectedCode);
        				$("#supplementState").val(selectedState) ;
        				$('#changeState').modal('show');
        			}
        			if(selectedState == "核对完成"){
        				alert("已完成无法修改");
        			}
        			if(selectedState == "审核不通过"){
        				alert("未通过审核无法修改");
        			}
        			
        		}else{
        			alert("请选择");
        		}
        	}
        	function examine(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
        		if(selectedCode != null){
        			if( selectedState == "待审核"){
        				$('#changeCode1').val(selectedCode);
        				$("#supplementState1").val(selectedState) ;
        				$('#examine').modal('show');
        			}else{
        				alert("该补料单并非待审核状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	function phoneOrder(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
        		if(selectedCode != null){
        			if( selectedState == "待电话订购"){
        				$('#changeCode2').val(selectedCode);
        				$("#supplementState2").val(selectedState) ;
        				$('#phoneOrder').modal('show');
        			}else{
        				alert("该补料单并非待电话订购状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	function fax(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
        		if(selectedCode != null){
        			if( selectedState == "待核对传码单"){
        				$('#changeCode3').val(selectedCode);
        				$("#supplementState3").val(selectedState) ;
        				$('#fax').modal('show');
        			}else{
        				alert("该补料单并非待核对传码单状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	function finance(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
        		if(selectedCode != null){
        			if( selectedState == "待财务对账"){
        				$('#changeCode4').val(selectedCode);
        				$("#supplementState4").val(selectedState) ;
        				$('#finance').modal('show');
        			}else{
        				alert("该补料单并非待财务对账状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
        	function materialExamine(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
        		if(selectedCode != null){
        			if( selectedState == "待核对物料"){
        				$('#changeCode5').val(selectedCode);
        				$("#supplementState5").val(selectedState) ;
        				$('#materialExamine').modal('show');
        			}else{
        				alert("该补料单并非待核对物料状态");
        			}       			        			
        		}else{
        			alert("请选择");
        		}
        	}
    	</script>
    	
    	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

    	
	
</body>
</html>