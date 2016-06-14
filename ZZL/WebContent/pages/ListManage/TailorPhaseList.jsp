<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <%@ include file="../../header.jsp"%>

    <style type="text/css">
       a,label{color: #737373;}
       a:hover{color: #737373;}
       #inquiryProgress{height:26px;padding:0px 12px;} 
       #isInStore{height:26px;padding:0px 12px;}  
       #tailModel{height:26px;padding:0px 12px;}   
       #tailor {height:26px;padding:0px 12px;}  
       .input-group{position: relative;float: left;width: 20%;}
       .input-group-1{position: relative;float: left;width: 30%;}
       .search-title{position: relative;float:left;margin-top:2px;}
       .form-control{float: left;width: 90%;}
       .table-responsive{margin-top: 50px;}
       .table{border-top: 3px solid #7D9EC0;}
       .bc{background-color:#90EE90}
       .btn-right{float:right;width:20%}
       .modal-body{height: 400px;}
       .modal-header{background-color: #3c8dbc;}
       .input-panel{position:relative;float:left;border:1px solid #ccc;border-radius: 3px;padding: 2px 10px;width:60%;}
    
     th {
            text-align: center;
        }

        td {
            text-align: center;
        }
    
    </style>
</head>
<body class="skin-blue">
 <!-- header logo: style can be found in header.less -->
     <s:if test="#request.session.account!=null">
	<!-- 人物头像 -->
	<jsp:include page="../../headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- 左边导航栏  -->
        <jsp:include page="../../navigation.jsp"></jsp:include>
        
        <!-- Right side column. Contains the navbar and content of the page -->
   
		<aside class="right-side">
	       <!-- Content Header (Page header) -->
	       <section class="content-header">
                <h1>
                        排单管理
                    <small>大货裁剪排单</small>
                </h1>
            </section>
	       <!-- Main Content -->
	       <section class="content">
	       <div class="btn-right">
	       <form id="change" name="f" method="post" action="">
	       
	       <button id="start" type="submit" class="btn btn-primary" style="margin: 5px 5px 5px 75px" data-toggle="modal" onclick="changeSelected()">操作</button> 
	       
	       </form>
	       </div> 
	       <!-- 裁剪查询 -->
	        <form  role="form" method="post" action="<%=request.getContextPath() %>/listManage/InquireTaiorPhase"">
	       <div class="input-group" id="design_id">
	             <a class="search-title">款号：</a>
	            <input type="text" id="designCode" name="designCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	       </div>
	       
	      <div class="input-group" id="outsource_id">
	            <a class="search-title">订单编号：</a>
	            <input type="text" id="outsourceCode" name="outsourceCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	       </div>
	       
	           <a class="search-title">排版：</a>  
               <div class="input-group-1" style="width:10%;" >   
                                   
	               <select id="tailModel" name="tailModel" class="form-control">
	                <option>请选择</option>
	                <option>已排版</option>
	                <option>未排版</option>
	               </select>
	           </div>
	           
	         <a class="search-title">      面料进度：</a>
               <div class="input-group-1" style="width:10%;" > 
                                         
	               <select id="isInStore" name="isInStore" class="form-control">
	                <option>请选择</option>
	                <option>已到货</option>
	                <option>部分到货</option>
	                <option>未到货</option>
	               </select>
	        </div><br/><br/>
	        
	        <div class="input-group-1">
                    <a class="search-title">截止外发时间：</a>
                    <input type="text" id="outSource_date" name="outSource_date" class="input-panel" placeholder="" >                
              </div> 
              
              <a class="search-title">状态：</a>     
               <div class="input-group" style="width:10%;" >
	                        
	               <select id="inquiryProgress" name="inquiryProgress" class="form-control">
	                <option>请选择</option>
	                <option>第一时间</option>
	                <option>普通</option>
	               </select>
	           </div>
	           <a class="search-title">&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp裁剪：</a>     
               <div class="input-group" style="width:10%"; >
	                        
	               <select id="tailor" name="tailor" class="form-control">
	                <option>请选择</option>
	                <option>已裁剪</option>
	                <option>未裁剪</option>
	               </select>
	           </div>       &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp
	           
	       <button type="submit" id="search-outsource" class="btn btn-primary" style="padding:0px 15px;" ">查询</button>
	       </form>
	       
	       
	       <!-- 裁剪单列表 -->
	       <div class="table-responsive" style="overflow-x:scroll;" >
	           <a style="color:#AAAAAA;">共<s:property value="PageBean.allRow"/>条裁剪排单</a>
	           <table class="table table-striped">
	           <tr>
	                               <th></th>
					               <th>图片</th>
					               <th>外发订单编号</th>
					               <th>款式信息</th>
					               <th>来源</th>
					               <th>外发时间</th>
					               <th >进度</th>
					               <th style="white-space:nowrap;">面料进度</th>
					               <th style="white-space:nowrap;">操作</th>
				</tr>
				<s:iterator value="PageBean.list" var="TailorManageVO">
				<tr>
				 <td style=" vertical-align:middle;">
                                   <input type="radio" name="select">
                                   <input type="hidden" name="selectedCode" value=${TailorManageVO.outsourceID}>
                                   <input type="hidden" name="selectBeginTime" value=${TailorManageVO.tailorStartingTime}>
                                   </td>
                                   <td style=" vertical-align:middle;"><img src="../images/1.png" style="width: 60px;height: 80px;" class="commdity-graph"></td>
                                   <td><s:property value="#TailorManageVO.outsourceCode" />
					                    <br/><font color="red"><s:property value="#TailorManageVO.designTechProcedure_finished"/></font>
					                         <font color="black"><s:property value="#TailorManageVO.designTechProcedure_unfinished"/></font>
					                    <br/>
					                    <s:if test="#TailorManageVO.tailorStartingTime!=null">
					                    <a style="white-space:nowrap;"><label class="bc"><font color="red">开始时间：<s:property value="#TailorManageVO.tailorStartingTime"/></font></label></a>
					                    </s:if>
					                    </td>
					               <td><a style="white-space:nowrap;"><font color="blue">款号：</font><s:property value="#TailorManageVO.designCode" /></a>
					               <br/><a style="white-space:nowrap;"><font color="blue">款名：</font><s:property value="#TailorManageVO.designName" /></a></td>
					               <td><s:property value="#TailorManageVO.source"/></td>
					               <td><font color="blue">状态：</font><font color="red"><s:property value="#TailorManageVO.orderPriority"/></font>
					               <br/><a style="white-space:nowrap;"><font color="blue">预约外发：</font><s:property value="#TailorManageVO.referenceOutDate"/></a> </td>
					               <td>
					               <a style="white-space:nowrap;"><font color="blue">排版：</font>
					               <font color="green">
					               <a href=""  data-toggle="modal"  onclick="javascript:getAllCharge(1,<s:property value="#TailorManageVO.outsourceID"/>,'排版');"
	data-target="#addProcessor"><s:property value="#TailorManageVO.tailorModelName" /></a>
	                                </font></a>
					               <br/><a style="white-space:nowrap;"><font color="blue">裁剪：</font><font color="green">
					                <a href=""  data-toggle="modal"  onclick="javascript:getAllCharge(1,<s:property value="#TailorManageVO.outsourceID"/>,'裁剪');"
	data-target="#addProcessor"><s:property value="#TailorManageVO.tailorTailorName" /></a></font></a>
	                               </td>
					               <td><font color="green"><s:property value="#TailorManageVO.isInWarehouse"/></font></td>
					                <td><a style="white-space:nowrap;" href="<%=request.getContextPath() %>/listManage/showOutSourceDetail?outSourceID=<s:property value='#TailorManageVO.outsourceID'/>" id="showDetail" style="color:#7EC0EE;">查看详情</a></td>
                </tr>
				</s:iterator>
	           </table>
	       </div>
	        <%@ include file="../../page.jsp"%>
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
					<h4 class="modal-title" style="color: white">裁剪部</h4>
				</div>
				<div class="modal-body">
					<label for="name" style="float:left;margin-top:10px;">指派人：</label>
                    <div class="input-group" id="responser" style="width:30%;">
                     <input type="text" class="form-control" id="chargeuserName" placeholder="请输入姓名" style="float:left;padding: 2px 10px;" maxlength="20">
                    </div>
                     <button type="button" id="search-responser" class="btn btn-primary" onclick="javascript:getAllCharge(1,outsourceId,Role)">查询</button>
                    
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
	<div class="modal fade" id="changeState" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 700px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">裁剪进度</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form  name="f"  method="post" action="<%=request.getContextPath()%>/listManage/changeTailorState">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>外发单号：</td>
									<td><input type="text" name="changeCode" id="changeCode" ></td>
								    <td ><input type=hidden name="beginTime" id="beginTime"></td>
								    <td>裁剪阶段：</td>
								    <td><input type="text" name="tailorState" id="tailorState"></td>
								    <td><button type="submit" name="begin_btn" id="begin_btn" class="btn btn-danger" style="margin:auto" ">开始</button></td>
								    <td><button type="submit" name="end_btn" id="end_btn" class="btn btn-danger" style="margin:auto" ">完成</button></td>
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
        	window.onload = changeTab("10400","10403");
    	</script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script type="text/javascript">
 
    function changeSelected(){
		selectedCode = $(".checked + input[name='selectedCode']").val();
 		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectBeginTime']").val();
 		if(selectedCode != null){
 			$('#changeCode').val(selectedCode);
 			$('#beginTime').val(selectedState);
 			if(selectedState){
 				$('#tailorState').val("进行中");
 				document.getElementById("begin_btn").disabled=true;
 				document.getElementById("end_btn").disabled=false;
 			}
 			else{
 				$('#tailorState').val("未开始");
 				document.getElementById("end_btn").disabled=true;
 				document.getElementById("begin_btn").disabled=false;
 			}
 			$('#changeState').modal('show');
 		}
 		else{
 			alert("请选择");
 		}
	 }
    
    var outsourceId;    
    var Role;
	 $('#outSource_date').datetimepicker({
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
	 
	 function getAllCharge(page,outsourceID,role){
			outsourceId = outsourceID;
		    Role = role;
			var userName = $("#chargeuserName").val();
			params = {
					"page":page,
					"userName":userName
			};
			$.post('/ZZL/listManage/ShowUser', params, function(data) {
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
						"outsourceID":outsourceId,
						"role":Role,
						"userId":userId
				};
				$.post('/ZZL/listManage/tailorAppoint', params, function(data) {
	        		location.reload(); 
	            });
				
		        return true;
		     }else{
		        
		        return false;
		    }
	 }
	 
	</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	</body>
</html>