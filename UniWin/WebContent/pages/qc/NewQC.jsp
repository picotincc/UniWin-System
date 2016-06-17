<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>
    <script type="text/javascript">
  window.onload = changeTab("11000","11001");
  var modify = <%=request.getParameter("modify")%>;
  if(modify=='yes'){
  	alert("提交成功！");
  }
  </script>
    <style type="text/css">
 .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.borderTr{border-bottom:1px #CDCDB4 solid;}
.normal{border-top:0px #CDCDB4 solid;border-bottom:0px #CDCDB4 solid;}
.form-control{float: left;width: 100%;}
#infoTable tbody tr td {border-top:none;}
th{text-align: center;}
td{text-align: center;}
a{color:#008080;}
.commdity-graph{margin-left:80px;width: 35%;height: 35%;}
.row{margin-top:5px;}
.qcStages{position: relative;float: left;margin-left:10px;margin-right:30px;}
.design,.customer{position: relative;float: left;margin-left:20px;margin-right:40px;}
.left,.right{position: relative;float: left;margin-left:20px;}
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
                    QC质检单
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">新增质检单</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
               <form  role="form" id="addForm" name="addForm" method="post" action="<%=request.getContextPath()%>/Qc/addQC">
            <div>
            <div class="row">
         
            <div class="left">
            <div class="row">
                                <div class="design">
					             <table class="table" id="infoTable">
                          <tbody>
                             <tr class="normal">
                                <td>款号：</td>
                                <td><input id="designCode" name="designCode" data-toggle="modal"  onclick="javascript:getAllProduction(1);"
	data-target="#addDesign"
					                            type="text" class="form-control form-input" placeholder="款号" value="<s:property value="qcVO.design.designCode"/>"
					                            maxlength="20"></td>
                             </tr>
                             <tr class="normal">
                                <td>款式名称：</td>
                                <td><input id="designName" name="designName"
					                            type="text" class="form-control form-input" disabled="true"　readOnly="true"  value="<s:property value="qcVO.design.designName"/>"
					                            maxlength="20"></td>
                             </tr>
                          </tbody>
                       </table>
                    </div>
                    <div class="customer">
                   
                    <table class="table" id="infoTable">
                          <tbody>
                             <tr class="normal">
                                <td>客户：</td>
                                <td><input id="customerName" name="customerName"
					                            type="text" class="form-control form-input" disabled="true"　readOnly="true" value="<s:property value="qcVO.customerName"/>"
					                            maxlength="20"></td>
                             </tr>
                             <tr class="normal">
                                <td>备注：</td>
                                <td><input id="QCComment" name="QCComment"
					                            type="text" class="form-control form-input" placeholder="备注"   value="<s:property value="qcVO.qc.QCComment"/>"
					                            maxlength="20"></td>
                             </tr>                             
                          </tbody>
                       </table>
                    </div>    
                    
					<br/>
					</div>
					<div class="row">
					
						<div class="table-responsive">
						
							<table class="table">
								<tr class="borderTr">
									<th>颜色</th>
									<th>XS/90CM</th>
									<th>S/100CM</th>
									<th>M/110CM</th>
									<th>L/120CM</th>
									<th>XL/130CM</th>
									<th>XXL/140CM</th>
									<th>合计</th>
								</tr>
								
								<s:iterator value="qcVO.orderDetails" var="orderDetail">
									<tr class="borderTr">
										<td><s:property value='color'/></td>
										<td><s:property value='XS'/></td>
										<td><s:property value='S'/></td>
										<td><s:property value='M'/></td>
										<td><s:property value='L'/></td>
										<td><s:property value='XL'/></td>
										<td><s:property value='XXL'/></td>
										<td><s:property value='total'/></td>
									</tr>
								</s:iterator>
							</table>
						</div>
						<!-- .table-responsive -->
					</div>   
					</div> 
					<div class="right">
					<div >
                    <img src="../images/1.png" id="design_image" class="commdity-graph">
                    </div>
					</div> 
					</div>
					<br/>
					 <div class="row">
					<a>需质检环节>></a><br/>
					
					<div class="select">
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="检验布料" />检验布料
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="裁剪检验" />裁剪检验
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="工艺检验" />工艺检验
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="外发加工检" />外发加工检
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="收货前检" />收货前检
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="后道检验（含贴标）" />后道检验（含贴标）
					<input id="QCStages" name="QCStages" class="qcStages" type="checkbox" value="包装前全检" />包装前全检
					
					</div>
					 <br/>
					 
					 <br/>
					  <button type="submit"  id="submit_result"
				      class="btn btn-primary">提交</button>
				       <button type="button" id="returnPrevPage" class="btn btn-primary" onclick="history.go(-1);">返回</button><br/>
         
            </div>
            </div> </form>
            </section>
        </aside>
    </div>
    
    
    <!-- 模态框（Modal） -->
	<div class="modal fade" id="addDesign" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">款号</h4>
				</div>
				<div class="modal-body">
					<label for="name" style="float:left;margin-top:10px;">款号：</label>
                    <div class="input-group" id="responser" style="width:30%;">
                     <input type="text" class="form-control" id="search_designCode" placeholder="请输入款号" style="float:left;padding: 2px 10px;" maxlength="20">
                    </div>
                     <button type="submit" id="search-responser" class="btn btn-primary" onclick="javascript:getAllProduction(1)">查询</button>
                    
                     <div class="table-responsive" style="margin-top:50px;">
                     <form name="fo" method="post" action="">
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>生产单编号</th>
                                <th>款号</th>
                                
                                
                                
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            </tbody>
                            
                        </table><!-- /.table -->
                        </form>
					</div>
					
					 <!-- 分页-->
                    <ul class="pager">
					</ul>
                	<!-- 分页-->
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
	<div class="modal fade" id="newQc" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 650px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">质检单作废</h4>
				</div>
				<div class="modal-body" style="height:150px;">
				 <form role="form" method="post" name="f" action="">
					<div class="table" >
						<!-- .table - Uses sparkline charts-->
							<table class="table" rules="none" frame="void" style="margin-top:20px;">
								<tr></tr>
								<tr>
									<td>新建的质检单款式为</td>
									<td><input type="text" id="design_Code" name="design_Code"></input><input type="hidden" id="order_ID" name="order_ID"></td>
									
									<td style="width:200px"></td>
									<td><button type="submit" class="btn btn-danger" onclick="newQC()" style="margin:auto">
											确认</button></td>
								</tr>

							</table>
							<!-- /.table -->
						
					</div>
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
	
<script type="text/javascript">
window.onload = changeTab("11000","11001");
var orderID;
function getAllProduction(page){
	
	var designCode= $("#search_designCode").val();

	params = {
			"page":page,
			"designCode":designCode
	};
	$.post('/ZZL/Qc/getAllDesignByPageAjax', params, function(data) {
		
		obj = eval("("+data+")");
		var orders = obj.orders;
		var tr = '';
		for(i =0;i<orders.length;i++){
			tr += "<tr id='order"+orders[i].orderID+"'  ondblclick=\"javascript:clickTr( "+orders[i].orderID+", '"+orders[i].designCode+"')\"><td>"+orders[i].productionCode+"</td>"+"<td>"+orders[i].designCode+"</td></tr>";
		}
		$("#userTabel").html(tr);
		var currentPage = obj.currentPage;
		var totalPage = obj.totalPage;
		var temp = '';
		if(currentPage==1){
			temp += "<li class='previous disabled'><a>&larr; Prev</a></li>";
		}else{
			temp += "<li class='previous'><a href='javascript:getAllProduction("+(currentPage-1)+")'>&larr; Prev</a></li>";
		}
		temp += "<li><span style='padding:5px;border:none;'>第"+currentPage+"页/共"+totalPage+"页</span></li>";
		if(currentPage==totalPage){
			temp += "<li class='next disabled'><a>Next &rarr;</a></li>";
		}else{
			temp += "<li class='next'><a href='javascript:getAllProduction("+(currentPage+1)+")'>Next &rarr;</a></li>";
		}        		
		$(".pager").html(temp);
    },'json');
}  


function post(URL, PARAMS) {
	  var temp = document.createElement("form");
	  temp.action = URL;
	  temp.method = "post";
	  temp.style.display = "none";
	  for (var x in PARAMS) {
	    var opt = document.createElement("textarea");
	    opt.name = x;
	    opt.value = PARAMS[x];
	    
	    temp.appendChild(opt);
	  }
	  document.body.appendChild(temp);
	  temp.submit();
	  return temp;
	}

function clickTr(){
	   orderID = arguments[0];
	  
	   if(orderID != null){  
			
		   fo.action="<%=request.getContextPath()%>/Qc/newQcByDesign?orderID="+orderID;
	 		document.fo.submit();
		}else{
			alert("请选择");
		}
}
function newQC(){

	f.action="<%=request.getContextPath()%>/Qc/newQcByDesign";
	document.f.submit();
}

</script>
	  <script type="text/javascript">
		formValidate();
		function formValidate() {
			// 在键盘按下并释放及提交后验证提交表单
			$("#addForm").validate({
				"rules" : {
					"designCode" : {
						'required' : true,
					},
					"QCComment" : {
						'required' : true,
					}
				}
			});
		}
	</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>