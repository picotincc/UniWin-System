<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>

    <title>ZZL</title>
    
    <style type="text/css">
        td {
            vertical-align:middle;
            text-align: center;
        }

        th {
            text-align: center;
        }
        
        .detailth {
        	background-color:#C8E3FF ;
        
        }
    </style>
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
                    <small>收货单管理</small>
                </h1>
            </section>

            <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">收货单管理</h3>
                        </div><!-- /.box-header -->
                        <div class="row">
                            <div class="col-md-10" style="margin:20px 0px 0px 0px">
                                <!-- form start -->
                                <form action="queryReceive" method="post">
                                     <div class="box-body">
                                         <table cellspacing=5  cellpadding=5 >
                                         <tr>
                                             <td>加工方名称：</td>
                                             <td><input type="text" name="processorName" value=${processorName}></td>
                                             <td>收货时间：</td>
                                             <td><input type="text" class="date-picker" name="receiveDate" value=${receiveDate}></td>
                                             <td>款号：</td>
                                             <td><input type="text" name="designCode" value=${designCode}></td>
                                             <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                             <td><button type="submit" class="btn btn-primary" style="margin:15px 15px 15px 15px">查询</button></td>
                                         </tr>
                                         </table>
                                     </div>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <div class="row">
                                    <button type="button" class="btn btn-primary" style="margin:0px 5px 5px 75px" onclick="modifyReceive()">修改</button>
                                </div>
                                <div class="row">
                                    <button type="button" class="btn btn-danger" style="margin: 5px 5px 5px 75px" data-toggle="modal" onclick="cancelReceive()">废弃</button>
                                </div>
                                <div class="row">
                                    <button type="button" class="btn btn-default" style="margin: 5px 5px 15px 75px" onclick="printReceive()">打印</button>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-2">
                                <span size="3px" style="margin: 0px 10px 20px 20px;color: blue">收货单列表>></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="table-responsive" style="margin: 10px 50px 50px 23px">
                                <table class="table table-striped" align="center">
                                    <tr>
                                        <th></th>
                                        <th>加工方</th>
                                        <th>收货日期</th>
                                        <th>收货人</th>
                                        <th>数量人</th>
                                        <th>图片</th>
                                        <th>加工方区域</th>
                                        <th>类型</th>
                                    </tr>
                                    <tbody>
                                    <s:iterator value="PageBean.list" var="rItem" status="st">
									<tr onclick="javascript:judgeSelected(this)" ondblclick  = "showDetails()">
                                        <td style="vertical-align:middle;">
                                        	<input type="radio" name="select">
                                        	<input type="hidden" name="selectedID" value=${rItem.receiveID}>
                                        	<input type="hidden" name="selectedIndex" value=${st.index}>
                                        </td>
                                        <td style="vertical-align:middle;">
                                        	<span style="color:blue;"><s:property value="#rItem.processorName" /></span>
                                        </td>
                                        <td style="vertical-align:middle;">
											<s:date name="#rItem.receiveDate" format="yyyy-MM-dd"/>
										</td>								
                                        <td style="vertical-align:middle;"><s:property value="#rItem.userName" /></td>
                                        <td style="vertical-align:middle;"><s:property value="#rItem.sum" /></td>
                                        <td style="vertical-align:middle;"><img alt="" src=${rItem.designImgUrl} style="width: 60px;height: 80px;"></td>
                                        <td style="vertical-align:middle;"><s:property value="#rItem.processorDistrict" /></td>
                                        <td style="vertical-align:middle;"><s:property value="#rItem.deliveryType" /></td>
                                    </tr>
                                    </s:iterator>
                                    </tbody>
                                    
                                </table><!-- /.table -->
                                <jsp:include page="../../page2.jsp">
								<jsp:param name="action" value="receivelist" />
						    	</jsp:include>
                            </div><!-- /.table-responsive -->
                        </div><!-- /.table-row -->
                    </div><!-- /.box-->
                </div>
            </div>
            
            
            
            	<!-- 模态框（Modal） -->
	<div class="modal fade" id="cancelReceive" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 400px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">废弃收货单</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Process/cancelReceive" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>收货单号：</td>
									<td><input type="text" name="cancelID" id="cancelID" ></td>
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
	
	            	<!-- 模态框（Modal） -->
	<div class="modal fade" id="showdetails" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 460px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">收货单详情</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->						
							<table class="table" rules="none" frame="void" id="detail-table">
							   
							   	<tr class="detailth">
							   		<th>颜色</th>
							   		<th>XS</th>
							   		<th>S</th>
							   		<th>M</th>
							   		<th>L</th>
							   		<th>XL</th>
							   		<th>XXL</th>
							   		<th>Total</th>							   								   
							   	</tr>
							   
							   
							   <tbody>
							   		<tr>
							   			<td>黑色加绒</td>
							        	<td>1</td>
							        	<td>2</td>
							        	<td>3</td>
							        	<td>4</td>
							        	<td>5</td>
							        	<td>6</td>
							        	<td>7</td>
							   		</tr>
							   </tbody>
								

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
        </section>
        </aside>
    </div>
		<script type="text/javascript">
        	window.onload = changeTab("10300","10302");
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
    	</script>

   		<script type="text/javascript">
        	function cancelReceive(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		if(selectedID != null){
        			$("#cancelID").val(selectedID);
        			$('#cancelID').attr("readonly",true);
        			$('#cancelReceive').modal('show');
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function modifyReceive(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		if(selectedID != null){        			
        			location.href= getRootPath() + "/Process/getReceive?receiveID="+selectedID;     	       		         
        		}else{
        			alert("请选择");
        		}
        	}
        	
        	function printReceive(){
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		if(selectedID != null){
    				var url=getRootPath()+"/Process/printReceive?receiveID="+selectedID;
    				window.open(url);
        		}else{
        			alert("请选择");
        		}
    		}
        	
        	function showDetails(){
        		$("#detail-table tbody").html("");
        		var url=getRootPath()+"/Process/";
        		var selectedID = $(".checked + input[name='selectedID']").val();
        		var Table = document.getElementById("detail-table");
        		var newTH = Table.insertRow();
        		newTH.className="detailth";
        		newTH.innerHTML="<th>颜色</th><th>XS</th><th>S</th><th>M</th><th>L</th><th>XL</th><th>XXL</th><th>Total</th>";
        		
        		$.ajax({  
                    url : url+"getReceiveDetails",  
                    type:"post",     
                    data:{rid:selectedID},
                    dataType:"json",               
                                         
                    success: function(json){  
                    	var data = eval("("+json+")"); 
                    	for(var detail in data){ //第二层循环取list中的对象

                    		var newRow = Table.insertRow(); //创建新行
                    		
                    		var newColor = newRow.insertCell(); //创建新单元格
                    		newColor.innerHTML = data[detail].receiveColor; 

                    		var newXS = newRow.insertCell(); //创建新单元格
                    		newXS.innerHTML = data[detail].receiveXS; 
                    		
                    		var newS = newRow.insertCell(); //创建新单元格
                    		newS.innerHTML = data[detail].receiveS;
                    		
                    		var newM = newRow.insertCell(); //创建新单元格
                    		newM.innerHTML = data[detail].receiveM; 
                    		
                    		var newL = newRow.insertCell(); //创建新单元格
                    		newL.innerHTML = data[detail].receiveL; 
                    		
                    		var newXL = newRow.insertCell(); //创建新单元格
                    		newXL.innerHTML = data[detail].receiveXL; 
                    		
                    		var newXXL = newRow.insertCell(); //创建新单元格
                    		newXXL.innerHTML = data[detail].receiveXXL; 
                    		
                    		var newTotal = newRow.insertCell(); //创建新单元格
                    		newTotal.innerHTML = data[detail].receiveTotal; 

                    	}  
                    	$('#showdetails').modal('show');
                    },
        		 	error: function(){  
                     	alert("服务器没有返回数据，可能服务器忙，请重试");  
                    }  
                 });                    
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