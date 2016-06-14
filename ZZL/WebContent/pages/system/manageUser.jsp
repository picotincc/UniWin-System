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

    <title>智造链-系统管理-用户管理</title>
    
    <script language="javascript">
    	function search(){
    		f.action="<%=request.getContextPath()%>/System/searchUser";
    		document.f.submit();
    	}
    	function update(){
    		if(document.getElementById("select").checked){
    			f.action="<%=request.getContextPath()%>/System/chooseUser";
        		document.f.submit();
    		}
    		else{
    			alert("请选择用户之后再进行修改！");
    		}
    	}
    	function myDelete(){
    		if(document.getElementById("select").checked){
    			f.action="<%=request.getContextPath()%>/System/deleteUser";
        		document.f.submit();
    		}
    		else{
    			alert("请选择用户之后再进行删除！");
    		}
    	}
    </script>
    <script language="text/javascript">
		window.onload = changeTab("11500","11503");
    </script>
    
</head>

<body class="skin-blue">
    <s:if test="#request.session.account!=null">
     <!-- 人物头像 -->
	 <jsp:include page="../../headSculpture.jsp"></jsp:include>
	 <!-- 人物头像 -->

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <s:iterator value="#session.authorityList" id="low">
		<s:if test="#low.highAuthName=='系统管理'&&#low.middleAuthName=='用户管理'&&#low.lowAuthName=='用户管理查询'">
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          系统管理
                    <small>用户管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                    <form role="form" method="post" name="f" action="">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">用户管理</h3>
                            </div><!-- /.box-header -->
                            
                            <!-- 新增与收货按钮  -->
                            <div class="row">
                                <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="box-body">
                                                    <label>账号</label>
                                                    <input type="text" class="form-control" id="userAccount" name="userAccount" value=${userAccount}>
                                                </div>
                                               
                                            </div>
                                            <div class="col-md-5">
                                            	 <div class="box-body">
                                                    <label>姓名</label>
                                                    <input type="text" class="form-control" id="searchedUserName" name="searchedUserName">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" class="btn btn-primary" style="margin-top: 34px" onclick="search()">查询</button>
                                            </div>
                                        </div>
                                </div>

                                <div class="col-md-2">

                                </div>
                                
                                <!-- 新增、修改、删除按钮  -->
                                <div class="col-md-2">
	                                    <div class="row">
	                                         <button type="submit" class="btn btn-warning"
												style="margin: 5px 5px 5px 75px" data-toggle="modal" data-target="#addUser">新增</button>
	                                    </div>
	                                    <div class="row">
	                                    	<button type="submit" class="btn btn-primary" style="margin: 5px 5px 5px 75px" onclick="update()">修改</button>
	                                    </div>
	                                    <div class="row">
	                                        <button type="submit" class="btn btn-primary" style="margin: 5px 5px 5px 75px" onclick="myDelete()">删除</button>
	                                    </div>
                                </div>

                            </div>
                                                        
                            <!-- 表格  -->
                            <div class="row">
                                <div class="table-responsive" style="margin: 0px 50px 50px 23px;overflow-x:scroll;">
                                    <table class="table table-striped">
                                        <tr>
                                            <th></th>
                                            <th>账号</th>
                                            <th>姓名</th>
                                            <th>手机号码</th>
                                            <th>E-mail</th>
                                            <th>微信号</th>
                                            <th>公司名称</th>
                                            <th>部门名称</th>
                                            <th>地址</th>
                                        </tr>                                       
                                        <s:iterator value="PageBean.list" var="userItem">
										<tr>
										    <td><input type="radio" id="select" name="select" value='<s:property value="#userItem.user.userId" />' /></td>						    
											<td><s:property value="#userItem.user.userAccount" /></td>
											<td><s:property value="#userItem.user.userName" /></td>
											<td><s:property value="#userItem.user.userMobileNum" /></td>
											<td><s:property value="#userItem.user.userEMail" /></td>
											<td><s:property value="#userItem.user.userWeChatNum" /></td>
											<td><s:property value="#userItem.user.userComName" /></td>
											<td><s:property value="#userItem.departmentName" /></td>
											<td><s:property value="#userItem.user.userAddr" /></td>
										</tr>
										</s:iterator>
                                        
                                    </table><!-- /.table -->
                                </div><!-- /.table-responsive -->
                            </div><!-- /.table-row -->
                            <jsp:include page="../../page.jsp">
                            <jsp:param name="action" value="userList" />
						    </jsp:include>
                        </div><!-- /.box-->
                        </form>
                    </div>
                </div>           
            </section>
        </aside>
        </s:if>
    	</s:iterator>
    </div>


		<!-- 模态框（Modal） -->
	<div class="modal fade" id="addUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">新增用户</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/System/addUser" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>姓名<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userName"></td>
									<td>手机号码<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userMobileNum"></td>
									<td>微信号<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userWeChatNum"></td>
								</tr>
								<tr>
									<td>账户自编码<span style="color: red">*</span>：
									</td>
									<td><input type="text" readonly="readonly" name="userId"></td>
									<td>地址<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userAddr"></td>
									<td>E-mail<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userEMail"></td>
								</tr>
								<tr>
									<td>备注<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 95%" name="userComment"></td>
									<td>账户名<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userAccount"></td>
								</tr>
								<tr>
									<td>公司名称<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 95%" name="userComName"></td>
									<td>初始密码<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="userPassword"></td>
								</tr>
								<tr>
									<td>所属部门<span style="color: red">*</span>：
									</td>
									<td>
										<select name="department">
										<s:iterator value="departmentList" var="departmentItem">
											<option value='<s:property value="#departmentItem.department.departmentID" />'><s:property value="#departmentItem.department.departmentFullName" /></option>
										</s:iterator>
										</select>
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td><button type="submit" class="btn btn-primary">
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
	
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

</body>
</html>