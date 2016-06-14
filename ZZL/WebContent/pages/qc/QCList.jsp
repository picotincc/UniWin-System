<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8 ">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

  <jsp:include page="../../header.jsp"></jsp:include>
 
 <style type="text/css">
.content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.input-group,.form-group{position: relative;float: left;width: 15%;}
.form-control{float: left;width: 100%;}
label {color: #555555;font-size: 12px; margin-left: 10px;}
#search-qclist{position: relative;float: left;width: 8%;height:34px;margin-left: 15px;margin-top: 23px;}
.table-responsive{margin-top: 10px;}
.table{border-top: 3px solid #7D9EC0;}
th{font-size: 12px;color: #4F4F4F;text-align: center;}
td{text-align: center;font-size:14px;}
tr{background-color:transpare}
.item-name{color:#0000ff;}
.qcCode{color:#008080;}
.commdity-graph{width: 60px;height: 80px;}
.modal-body{height: 400px;}
.modal-header{background-color: #3c8dbc;}
 .delete{float:right;width:10%;}
 </style>
 
 <script type="text/javascript">

var qcID;
function getAllCharge(page,qcId){
	
	
	qcID = qcId;
	var userName = $("#chargeuserName").val();
	
	params = {
			"user_page":page,
			"userName":userName
	};
	$.post('/ZZL/Qc/getAllChargeByPageAjax', params, function(data) {
		//alert("result");alert(data);
		//$("#userName").val(userName);
		obj = eval("("+data+")");
		var users = obj.users;
		var tr = '';
		for(i =0;i<users.length;i++){
			tr += "<tr id='user"+users[i].userId+"' ondblclick='clickTr("+users[i].userId+")'><td>"+users[i].userName+"</td>"+"<td>"+users[i].userMobileNum+"</td>"+"<td>"+users[i].userAddr+"</td></tr>";
			//tr += "<tr id='user"+users[i].userId+"' onclick='confirm("+users[i].userId+","+users[i].userName+")'><td>"+users[i].userName+"</td>"+"<td>"+users[i].userMobileNum+"</td>"+"<td>"+users[i].userAddr+"</td></tr>";
		}
		$("#userTabel").html(tr);
		var currentPage = obj.currentPage;
		var totalPage = obj.totalPage;
		var temp = '';
		if(currentPage==1){
			temp += "<li class='previous disabled'><a>&larr; Prev</a></li>";
		}else{
			temp += "<li class='previous'><a href='javascript:getAllCharge("+(currentPage-1)+")'>&larr; Prev</a></li>";
		}
		temp += "<li><span style='padding:5px;border:none;'>第"+currentPage+"页/共"+totalPage+"页</span></li>";
		if(currentPage==totalPage){
			temp += "<li class='next disabled'><a>Next &rarr;</a></li>";
		}else{
			temp += "<li class='next'><a href='javascript:getAllCharge("+(currentPage+1)+")'>Next &rarr;</a></li>";
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
function clickTr(id){
	
	if(window.confirm('确认指派?')){
		var userId = id;
		params = {
				"qcID":qcID,
				"userId":userId
		};
		/* document.getElementById("addProcessor").style.display="none"; */
        
		$.post('/ZZL/Qc/setCharge_qclist', params,function(data){
			location.reload(); 
			}) ;
		 
        return true;
     }else{
        
        return false;
    }
	
	
}
function checkSelected(){
	var selectedCode = $(".checked + input[name='selectedCode']").val();
	
	if(selectedCode != null){  
		$("#qc_Code").val(selectedCode);
		$('#qc_Code').attr("readonly",true);
		$('#newReceive').modal('show');    	       		         
	}else{
		alert("请选择");
	}
}
function deleteQC(){
	var qc_code = $("#qc_Code").val();
	/* params = {
			"selectedCode":qc_code,
	};
	$.post('/ZZL/Qc/deleteQC', params, function(data) {
		location.reload(); 
    }); */
	f.action="<%=request.getContextPath()%>/Qc/deleteQC";
	document.f.submit();
}


</script>
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
                                                                        质检单列表
                    <small>QC质检单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">质检单列表</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            <!-- 查询与按钮  -->
                            <form  role="form" method="post" action="<%=request.getContextPath()%>/Qc/search_qclist">
                            <div class="row col-md-12">
                                                <div class="col-md-10">
                                                <div class="input-group">
				                                <label for="name">款号</label> <input id="designCode" name="designCode"
					                            type="text" class="form-control form-input" placeholder="款号"
					                            maxlength="20">
			                                    </div>
			                                    <div class="input-group">
				                                <label for="name">下单时间</label> <input id="pQCTime" name="pQCTime"
					                            type="text" class="form-control form-input" placeholder=""
					                            maxlength="20">
			                                    </div>
                                                <div class="input-group">
				                                <label for="name">委派</label> <input id="userName" name="userName"
					                            type="text" class="form-control form-input" placeholder="委派"
					                            maxlength="20">
			                                    </div>
                                                <div class="form-group">
					                            <label for="name">业务状态</label> <select id="qCState" name="qCState"
						                        class="form-control">
						                        <option>未进行</option>
						                        <option>已完结</option>
						                       
					                            </select>
				                                </div>
                                  
                                            
                                                <button type="submit"  id="search-qclist"
				                                class="btn btn-primary">查询</button>
				                                </div>
				                               <div class="col-md-2" >
				                               <div class="row">
				                               <button id="delete_button" type="button" class="btn btn-danger" style="margin: 22px 5px 15px 115px" data-toggle="modal" onclick="checkSelected()">作废</button>
				                               </div>
				                               </div> 
				                                
                                </div> 
                                
                                </form>
                                <div class="row">
					                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
					                                    <table class="table table-striped">
                                <tr> 
                                <th></th>
                                <th >图片</th> 
                                <th >编号</th> 
                                <th >信息</th> 
                                <th >委派</th>
                                 <th >业务状态</th>
                                 <th >备注</th>
                                </tr> 
                                <tbody>
                                 <s:iterator value="pageBean.list" var="qcvo">
                              
                                 <tr onclick="javascript:judgeSelected(this)">
                                 <td><input type="radio" name="select">
                                  <input type="hidden" name="selectedCode" value=${qcvo.qc.QCCode}>
                                 
                                 </td> 
                                 
                                <%--  <td><img src="<s:property value="#qcvo.design.designPicURL" />"
								class="commdity-graph"></td> --%>
								 <td><img src="../images/1.png"
								class="commdity-graph"> 
                                 <td>
                                 <p>
									<span class="item-name">质检单号：</span>
									<span class="qcCode"><a href="<%=request.getContextPath() %>/Qc/qcdetail?qcID=<s:property value='#qcvo.qc.QCID'/>" style="color:#008080;"><s:property  value="#qcvo.qc.QCCode" /></a></span>
								</p>
								<p>
									<span class="item-name">生产单号：</span>
									<s:property value="#qcvo.production.productionCode" />
								</p></td>
								<td>
								<s:if test="#qcvo.design.designCode!=''">
                                 <p>
									<span class="item-name">款号：</span>
									<s:property value="#qcvo.design.designCode" />
								</p>
								<p>
									<span class="item-name">款名：</span>
									<s:property value="#qcvo.design.designName" />
								</p>
								</s:if>
								<s:else>
								<p>
									<span class="item-name">款号：</span>
									 暂无
								</p>
								<p>
									<span class="item-name">款名：</span>
									暂无
								</p>
								</s:else>
								</td>
								<s:if test="#qcvo.user.userName!=''">
								
                                 <td>
                                 
                                 <p><a href=""  data-toggle="modal"  onclick="javascript:getAllCharge(1,<s:property value="#qcvo.qc.QCID"/>);"
	data-target="#addProcessor"><s:property value="#qcvo.user.userName" /></a></p>
	                             <p><s:property value="#qcvo.qc.QCDesignateTime" /></p>
	</td>
                               </s:if>
                               <s:else>
                                 <td><a href="" style="color:red" data-toggle="modal"  onclick="javascript:getAllCharge(1,<s:property value="#qcvo.qc.QCID"/>);"
	data-target="#addProcessor">未指派</a></td>
                                 </s:else>
                                  <td><s:property value="#qcvo.qc.qCState" /></td>
                                 <td><s:property value="#qcvo.qc.qCComment" /></td>
                             
                                 </tr>
                                </s:iterator>
                                </tbody>
                                </table> 
                                 </div>
					             </div>
					             <div class="row" style="margin-left:10px">
								                        <%@include file="../../page.jsp" %>    
					                            </div>
            </div>
            </section>
        </aside>
    </div>
    <!-- 模态框（Modal） -->
	<div class="modal fade" id="addProcessor" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3c8dbc">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">质检部</h4>
				</div>
				<div class="modal-body" >
					<label for="name" style="float:left;margin-top:10px;">指派人：</label>
                    <div class="input-group" id="responser" style="width:30%;">
                     <input type="text" class="form-control" id="chargeuserName" placeholder="请输入姓名" style="float:left;padding: 2px 10px;" maxlength="20">
                    </div>
                     <button type="button" id="search-responser" class="btn btn-primary" onclick="javascript:getAllCharge(1,qcID)">查询</button>
                    
                     <div class="table-responsive" style="margin-top:50px;">
                     
                     <table class="table table-striped" id="chargetable">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>联系方式</th>
                                <th>地址</th>
                                
                                
                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            </tbody>
                            
                        </table><!-- /.table -->
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
	<div class="modal fade" id="newReceive" tabindex="-1" role="dialog"
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
									<td>确认作废质检单</td>
									<td><input type="text" id="qc_Code" name="qc_Code"></input></td>
									
									<td style="width:200px"></td>
									<td><button type="submit" class="btn btn-danger" onclick="deleteQC()" style="margin:auto">
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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>	
<script src="<%=request.getContextPath() %>/js/radio.js" type="text/javascript"></script>
  <script type="text/javascript">
  window.onload = changeTab("11000","11002");
  $('#pQCTime').datetimepicker({
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

</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>