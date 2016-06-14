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

        th {
            text-align: center;
        }

        td {
            text-align: center;
        }
    </style>

    <title>ZZL</title>
    
</head>

<body class="skin-blue"
     onload="setDefault();">
     <!--
    <header class="header">
        <a href="index.html" class="logo">
            智&nbsp造&nbsp链
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
        </nav>
    </header>
     -->
     
     <s:if test="#request.session.account!=null">
     <!-- 人物头像 -->
	 <jsp:include page="../../headSculpture.jsp"></jsp:include>
	 <!-- 人物头像 -->
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
	    <s:iterator value="#session.authorityList" id="low">
		<s:if test="#low.highAuthName=='客户管理'&&#low.middleAuthName=='客户管理列表'&&#low.lowAuthName=='客户管理列表查询'">
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          客户管理
                    <small>客户资料管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                       <!--  <form role="form" method="post" name="f" action=""> -->
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">客户资料管理</h3>
                            </div><!-- /.box-header -->
                            
                            <!-- 查询按钮  -->
                            <div class="row">
                                <!-- 查询   -->
                                 <div class="col-md-10">
                                    <!-- form start -->
                                      <form  role="form" method="post" action="<%=request.getContextPath()%>/Customer/showSearchedCustomers">                    
                                        <div class="row" >
                                            
                                                <div class="col-md-3">                         
                                                     <label>主联系人：</label>
                                                </div>
                                                
                                                <div class="col-md-3">                                                   
                                                     <label>品牌：</label>
                                                </div>
                                                
                                                <div class="col-md-3">                                                   
                                                     <label>类型：</label>
                                                </div>                                            
                                        </div>
                                        <div class="row" >
                                            
                                                <div class="col-md-3">                         
                                                     <input type="text" class="form-control" id="customerContactName" name="customerContactName" value="<s:property value='customerContactName'/>">
                                                </div>
                                                
                                                <div class="col-md-3">                                                   
                                                     <input type="text" class="form-control" id="customerBrandName" name="customerBrandName" value="<s:property value='customerBrandName'/>">
                                                </div>
                                                
                                                <div class="col-md-3">                                                   
                                                     <select id="customer_Type" class="form-control" name="customerType" >
                                                     <option selected="selected" value="0">---请选择类型--- </option> 
                                                     <option value="线上品牌">线上品牌</option>
                                                     <option value="线下品牌">线下品牌</option>
                                                     </select>
                                                </div>
                                            
                                               <div class="col-md-2">
                                                     <button type="submit" class="btn btn-primary" style="margin-top: -6px ">查询</button>
                                               </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-md-1">
                                </div>
                                
                                <!-- 审核与作废按钮 --> 
                                <div class="col-md-2">
                                	<s:iterator value="#session.authorityList" id="low">
									<s:if test="#low.highAuthName=='客户管理'&&#low.middleAuthName=='客户管理列表'&&#low.lowAuthName=='审核'">
                                    <div class="row">
                                         <a href=""><button type="submit" class="btn btn-warning" style="margin:-7px 5px 5px 75px"
                                            data-toggle="modal" onclick="examineCustomer()">审核</button></a>
                                    </div>
                                    </s:if>
                                    </s:iterator>
                                    
                                    <s:iterator value="#session.authorityList" id="low">
									<s:if test="#low.highAuthName=='客户管理'&&#low.middleAuthName=='客户管理列表'&&#low.lowAuthName=='作废'">
                                    <div class="row">
                                        <button type="submit" class="btn btn-primary" style="margin: -2px 5px 15px 75px"
                                            data-toggle="modal" onclick="deleteCustomer()">作废</button>
                                    </div>  
                                    </s:if>
                                    </s:iterator>                               
                                </div>
                                
                            </div>
                                                        
                            <!-- 表格  -->
                            <div class="row">
                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
                                <a style="color:#AAAAAA;">共<s:property value="PageBean.allRow"/>条用户记录</a>
                                    <table class="table table-striped">
                                        <tr>
                                            <th></th>
                                            <th>客户ID</th>
                                            <th>主联系人</th>
                                            <th>品牌名</th>
                                            <th>类型</th>
                                            <th>电话</th>
                                            <th>邮箱</th>
                                            <th>状态</th>   
                                            <!-- <th>操作</th> -->                                      
                                        </tr> 
                                        <tbody>                                                                             
                                        <s:iterator value="PageBean.list" var="customerItem">
                                        <s:if test="#customerItem.customerState!='已删除'">
										<tr onclick="javascript:judgeSelected(this)">
										    <td style=" vertical-align:middle;"><input type="radio" name="select" />
										        <input type="hidden" name="selectedCustomerID" value=${customerItem.customerID}>
										        <input type="hidden" name="selectedCustomerState" value=${customerItem.customerState}></td>
										    					    
											<td><s:property value="#customerItem.customerID" /></td>
											<td><s:property value="#customerItem.customerContactName" /></td>
											<td><s:property value="#customerItem.customerBrandName" /></td>
											<td><s:property value="#customerItem.customerType" /></td>
											<td><s:property value="#customerItem.customerPhone" /></td>
											<td><s:property value="#customerItem.customerEMail" /></td>
											<td><s:property value="#customerItem.customerState" /></td>
											<!-- 
											<s:if test="#customerItem.customerState=='已审核'">
											<td><s:property value="#customerItem.customerState" /></td>
											</s:if>
											<s:else>
											<td><a href="<%=request.getContextPath()%>/Customer/examineCustomer">审核</a></td>
											</s:else>
											<td><a href="<%=request.getContextPath()%>/Customer/deleteCustomer">删除</a></td>
											 -->
										</tr>
										</s:if>
										</s:iterator> 
										</tbody>                                       
                                    </table><!-- /.table -->
                                </div><!-- /.table-responsive -->
                            </div><!-- /.table-row -->
                        </div><!-- /.box-->
                        <!-- </form> -->
                    </div>
                </div>    
                <!-- 分页 -->
            	<jsp:include page="../../page.jsp"/>       
            </section>
        </aside>
        </s:if>
    	</s:iterator>
    </div>
    
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="examineCustomer" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 580px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">审核客户</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Customer/examineCustomer" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>ID：</td>
									<td><input type="text" name="examineID" id="examineID" ></td>
									<td>状态：</td>
									<td ><select name="examineState"  id="examineState" style="width:100px;height:28px">
											<option value="未通过">未通过</option>
											<option value="已通过">已通过</option>
									</select></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											审核</button></td>
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
	
	<div class="modal fade" id="deleteCustomer" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 400px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">删除客户</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/Customer/deleteCustomer" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>ID：</td>
									<td><input type="text" name="deleteID" id="deleteID" ></td>
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-danger" style="margin:auto">
											删除</button></td>
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

	<script src="<%=request.getContextPath()%>/js/setDefaultSelect.js"
		type="text/javascript"></script>
    <script type="text/javascript">
         windows.onload = changeTab("11400","11401");
         
         function examineCustomer(){
        	 var selectedID = $(".checked + input[name='selectedCustomerID']").val();
        	 var selectedState = $(".checked + input[name='selectedCustomerID'] + input[name='selectedCustomerState']").val();
        	 if(selectedID != null){
        		 if(selectedState !="已通过"){
        			 $('#examineID').val(selectedID);
     				$('#examineID').attr("readonly",true);
     				$("#examineState").val(selectedState) ;
     				$('#examineCustomer').modal('show');
        		 }else{
        			 alert("已通过审核无法修改")
        		 }
        	 }else{
        		 alert("请选择");
        	 }
         }
         
         function deleteCustomer(){
        	 var selectedID = $(".checked + input[name='selectedCustomerID']").val();
        	 if(selectedID != null){
        		 $("#deleteID").val(selectedID);
     			$('#deleteID').attr("readonly",true);
     			$('#deleteCustomer').modal('show');
        	 }else{
        		 alert("请选择");
        	 }
         }
         
         function setDefault() {
        	 var cusType = value="<s:property value='customerType'/>";
        	 var selectForCusType = document.getElementById("customer_Type");
        	 setSelectDefault(selectForCusType, cusType);
         }
    </script>
   
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
    
</body>
</html>