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
       .input-group{position: relative;float: left;width: 25%;}
       .input-group-1{position: relative;float: left;width: 30%;}
       .search-title{position: relative;float:left;margin-top:2px;}
       .form-control{float: left;width: 100%;}
       .table-responsive{margin-top: 20px;}
       .bc{background-color:#90EE90}
       .btn-right{float:right;width:20%}
       .input-panel{position:relative;float:left;border:1px solid #ccc;border-radius: 3px;padding: 2px 10px;width:60%;}
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
                    <small>大货工艺排单</small>
                </h1>
            </section>
	       <!-- Main Content -->
	       <!-- 工艺排单查询 -->
	       <section class="content">
	       <div class="btn-right">
	       <form id="change" name="f" method="post" action="">
	      
	       <button id="start" type="submit" class="btn btn-primary" style="margin: 5px 5px 5px 75px" data-toggle="modal" onclick="changeSelected()">操作</button> 
	            
	       </form>
	       </div> 
	       <form  role="form" method="post" action="<%=request.getContextPath() %>/listManage/InquireTechniquePhase">
	       <div class="input-group" id="design_id">
	             <a class="search-title">款号：</a>
	            <input type="text" id="designCode" name="designCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group" id="design_Name">
	            <a class="search-title">款名：</a>
	            <input type="text" id="designName" name="designName"  class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group" id="outsource_id">
	            <a class="search-title">订单编号：</a>
	            <input type="text" id="outsourceCode" name="outsourceCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div><br/><br/><br/>
	            
	            <div class="input-group" id="technique">
	            <a class="search-title">工艺：</a>
	            <input type="text" id="technique" name="technique"  class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group-1">
                    <a class="search-title">截止外发时间：</a>
                    <input type="text" id="outSource_date" name="outSource_date" class="input-panel" placeholder="" >                
              </div> 
	             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	           <button type="submit" id="search-outsource" class="btn btn-primary" style="padding:0px 15px;" ">查询</button> 
	            </form>
	            
	            
	       <!-- 工艺排单列表 -->
	          <div class="table-responsive" style="overflow-x:scroll;">
	           <a style="color:#AAAAAA;">共<s:property value="PageBean.allRow"/>条工艺排单</a>
	           <table class="table table-striped">
	                         <tr>
	                               <th></th>
					               <th>图片</th>
					               <th>订单编号</th>
					               <th>款式信息</th>
					               <th>工艺单</th>
					               <th>工艺负责人</th>
					               <th>外发交期</th>
					               <th style="white-space:nowrap;">面料进度</th>
					               <th>操作</th>
					         </tr>  
               <s:iterator value="PageBean.list" var="TechniquePhaseVO">
                              <tr>
                              <td style=" vertical-align:middle;">
                                   <input type="radio" name="select">
                                   <input type="hidden" name="selectedCode" value=${TechniquePhaseVO.outsourceID}>
                                   <input type="hidden" name="selectBeginTime" value=${TechniquePhaseVO.techPhaseStartingTime}>
                                   </td>
                                   <td style=" vertical-align:middle;"><img src="../images/1.png" style="width: 60px;height: 80px;"></td>
                                   <td><s:property value="#TechniquePhaseVO.outsourceCode" />
					                       <br/><font color="red"><s:property value="#TechniquePhaseVO.designTechProcedure_finished"/></font>
					                       <font color="black"><s:property value="#TechniquePhaseVO.designTechProcedure_unfinished"/></font>
					                       <br/><font color="blue">状态：</font><font color="red"><s:property value="#TechniquePhaseVO.orderPriority"/></font>
					                       <s:if test="#TechniquePhaseVO.techPhaseStartingTime!=null">
					                         <br/><a style="white-space:nowrap;"> <label class="bc"><font color="red">&nbsp&nbsp开始时间：<s:property value="#TechniquePhaseVO.techPhaseStartingTime"/>&nbsp&nbsp</font></label></a>
					                       </s:if>
					                     
					               </td>
					                       
					               <td><a style="white-space:nowrap;"><font color="blue">款号：</font><s:property value="#TechniquePhaseVO.designCode" /></a>
					                       <br/><a style="white-space:nowrap;"><font color="blue">款名：</font><s:property value="#TechniquePhaseVO.designName" /></a></td>
					               <td><font color="red"><s:property value="#TechniquePhaseVO.designCode"/></font></td>
					               <td><font color="red"><s:property value="#TechniquePhaseVO.userName"/></font></td>
					               <td><a style="white-space:nowrap;"><s:property value="#TechniquePhaseVO.finishDate"/></a></td>
					               <td><font color="green"><s:property value="#TechniquePhaseVO.isInWarehouse"/></font></td>
					               <td><a style="white-space:nowrap;" href="<%=request.getContextPath() %>/listManage/showOutSourceDetail?outSourceID=<s:property value='#TechniquePhaseVO.outsourceID'/>" id="showDetail" style="color:#7EC0EE;">查看详情</a>
					            </td>
                              </tr>
               </s:iterator>
	           </table>
	       </div>
	        <%@ include file="../../page.jsp"%>
	        </section>
	     </aside>
	 </div>
	 
	  <!-- 模态框（Modal） -->
	<div class="modal fade" id="changeState" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 700px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">工艺进度</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form  name="f"  method="post" action="<%=request.getContextPath()%>/listManage/changeTechniqueState">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>外发单号：</td>
									<td><input type="text" name="changeCode" id="changeCode" ></td>
								    <td ><input type=hidden name="beginTime" id="beginTime"></td>
								    <td>工艺阶段：</td>
								    <td><input type="text" name="techniqueState" id="techniqueState"></td>
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
	 </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>

<script type="text/javascript">
        	window.onload = changeTab("10400","10402");
    	</script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script type="text/javascript">
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
	 
	 var selectedCode;
	 
	 
	 
	 function changeSelected(){
		selectedCode = $(".checked + input[name='selectedCode']").val();
 		var selectedState = $(".checked + input[name='selectedCode'] + input[name='selectBeginTime']").val();
 		if(selectedCode != null){
 			$('#changeCode').val(selectedCode);
 			$('#beginTime').val(selectedState);
 			if(selectedState){
 				$('#techniqueState').val("进行中");
 				document.getElementById("begin_btn").disabled=true;
 				document.getElementById("end_btn").disabled=false;
 			}
 			else{
 				$('#techniqueState').val("未开始");
 				document.getElementById("end_btn").disabled=true;
 				document.getElementById("begin_btn").disabled=false;
 			}
 			$('#changeState').modal('show');
 		}
 		else{
 			alert("请选择");
 		}
	 }
	 
	 	 
	</script>

	       
	       