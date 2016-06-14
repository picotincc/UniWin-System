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
        td {
            text-align: center;
        }

        .out-info > td{
            text-align: right;
            padding: 15px;
        }

        th {
            text-align: center;
        }

        td > input {
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
                    加工管理
                    <small>外发单管理</small>
                </h1>
            </section>

            <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">外发单管理</h3>
                        </div><!-- /.box-header -->
                        <div class="row">
                        	
                            <div class="col-md-10" style="margin:20px 0px 0px 0px">
                                <!-- form start -->
                                <form action="queryOutSource" method="post">
                                    <div class="box-body">
                                        <table>
                                            <tr class="out-info">
                                                <td>外发单号：</td>
                                                <td><input type="text" name="outSourceCode" value=${outSourceCode} ></td>
                                                <td>款号：</td>
                                                <td><input type="text" name="designCode" value=${designCode} ></td>
                                            </tr>
                                            <tr class="out-info">
                                                <td>外发时间：</td>
                                                <td><input type="text"	class="date-picker" name="osDate" value=${osDate} ></td>
                                                <td>预约交期：</td>
                                                <td><input type="text"	class="date-picker" name="finishDate" value=${finishDate} ></td>
                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                <td><button type="submit" class="btn btn-primary" style="margin:15px 15px 15px 15px">查询</button></td>
                                            </tr>
                                        </table>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <div class="row">
                                    <a href=""><button type="button" class="btn btn-warning" style="margin:0px 5px 5px 75px" data-toggle="modal" onclick="changeSelected()">收货</button></a>
                                </div>
                                <div class="row">
                                    <button type="submit" class="btn btn-primary" style="margin: 5px 5px 5px 75px" onclick="modifyOutSource()">修改</button>
                                </div>
                                <div class="row">
                                    <button type="submit" class="btn btn-danger" style="margin: 5px 5px 5px 75px" data-toggle="modal" onclick="cancelOutSource()">废弃</button>
                                </div>
                                <div class="row">
                                    <button type="submit" class="btn btn-default" style="margin: 5px 5px 15px 75px" onclick="printOutSource()">打印</button>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-2">
                                <span size="3px" style="margin: 0px 10px 20px 20px;color: blue">外发单列表>></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="table-responsive" style="margin: 0px 50px 50px 23px">
                                <table class="table table-striped" align="center">
                                    <tr>
                                        <th></th>
                                        <th>图片</th>
                                        <th>外发单号</th>
                                        <th>款式信息</th>
                                        <th>外发信息</th>
                                        <th>加工户</th>
                                        <th>状态</th>
                                    </tr>
                                    <tbody>
                                    <s:iterator value="PageBean.list" var="osItem">
									<tr onclick="javascript:judgeSelected(this)">
										<td style=" vertical-align:middle;"><input type="radio" name="select"><input type="hidden" name="selectedCode" value=${osItem.osCode}><input type="hidden" name="selectedState" value=${osItem.osState}></td>
										<td style=" vertical-align:middle;"><img alt="" src=${osItem.designImg} style="width: 60px;height: 80px;"></td>
										<td>
                                            <a href="" style="color:blue;">单号：</a><s:property value="#osItem.osCode" /><br/>
                                            <a style="color:blue;">数量：<s:property value="#osItem.sum" /></a><br/>
                                            <a href="" style="color: red"><s:property value="#osItem.osPriority" /></a>
                                        </td>
		                                <td>
                                            <a href="" style="color:blue;">款号：</a><s:property value="#osItem.designCode" /><br/>
                                            <a style="color:blue;">名称：</a><s:property value="#osItem.designName" />
                                        </td>
										<td>
                                            <a href="" style="color:blue;">外发时间：</a><s:date name="#osItem.osDate" format="yyyy-MM-dd"/><br/>
                                            <a style="color:blue;">预约交期：</a><s:date name="#osItem.finishDate" format="yyyy-MM-dd"/>
                                        </td>
                                        <td>
                                            <a href="" style="color:blue;">名称：</a><s:property value="#osItem.processorName" /><br/>
                                            <a style="color:blue;">电话：</a><s:property value="#osItem.processorMobile" />
                                        </td>
                                        <td style=" vertical-align:middle;"><s:property value="#osItem.osState" /></td>
									</tr>
								</s:iterator>
                                </tbody>
                                </table><!-- /.table -->
                                <jsp:include page="../../page2.jsp">
								<jsp:param name="action" value="outsourcelist" />
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
		<div class="modal-dialog" style="height: 250px; width: 580px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">外发单收货</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Process/changeState" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>外发单号：</td>
									<td><input type="text" name="changeCode" id="changeCode" ></td>
									<td>状态：</td>
									<td ><select name="outsourceState"  id="outsourceState" style="width:100px;height:28px">
											<option value="待收货">待收货</option>
											<option value="部分收货">部分收货</option>
											<option value="已完结">已完结</option>
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
	<div class="modal fade" id="cancelOutSource" tabindex="-1" role="dialog"
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
						<form action="<%=request.getContextPath()%>/Process/cancelOutSource" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>外发单号：</td>
									<td><input type="text" name="cancelCode" id="cancelCode" ></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											废弃</button></td>
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
        	window.onload = changeTab("10300","10304");
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
        			if( selectedState != "已完结"){
        				$('#changeCode').val(selectedCode);
        				$('#changeCode').attr("readonly",true);
        				$("#outsourceState").val(selectedState) ;
        				$('#changeState').modal('show');
        			}else{
        				alert("已完结无法修改")
        			}
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function cancelOutSource(){
        		var selectedCode = $(".checked + input[name='selectedCode']").val();
        		if(selectedCode != null){
        			$("#cancelCode").val(selectedCode);
        			$('#cancelCode').attr("readonly",true);
        			$('#cancelOutSource').modal('show');
        		}else{
        			alert("请选择");
        		}
        	}
        	
    	</script>
    	
    	<script type="text/javascript">
    	function modifyOutSource(){
    		var selectedCode = $(".checked + input[name='selectedCode']").val();
    		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectedState']").val();
    		if(selectedCode != null){
    			if( selectedState != "已完结"){
    				location.href= getRootPath() + "/Process/getOutSource?codeID="+selectedCode;     	       		         
    			}else{
    				alert("已完结无法修改")
    			}
    		}else{
    			alert("请选择");
    		}
    	}
    	
    	function printOutSource(){
    		var selectedCode = $(".checked + input[name='selectedCode']").val();
    		if(selectedCode != null){
				var url=getRootPath()+"/Process/printOutSource?codeID="+selectedCode;
				window.open(url);
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