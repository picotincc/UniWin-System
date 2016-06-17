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

    <title>智造链-系统管理-角色分配</title>
    
    <script language="javascript">
    	function test(id){
    		document.getElementById("selectedUserId").value = id;
    		f.action="<%=request.getContextPath()%>/System/showRoleOfUser";
    		document.f.submit();
    	}
    	
    	function search(){
    		f.action="<%=request.getContextPath()%>/System/searchUserInRole";
    		document.f.submit();
    	}
    	
    	function save(){
    		f.action="<%=request.getContextPath()%>/System/saveRoleOfUser";
    		document.f.submit();
    	}
    </script>
    <script language="text/javascript">
		window.onload = changeTab("11500","11502");
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
		<s:if test="#low.highAuthName=='系统管理'&&#low.middleAuthName=='角色分配'&&#low.lowAuthName=='角色新增'">
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          系统管理
                    <small>角色分配</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                    <form role="form" method="post" name="f" action="">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">角色分配</h3>
                            </div><!-- /.box-header -->
                            
                            
                            <div class="row">
                                <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="box-body">
                                                    <label>用户名</label>
                                                    <input type="text" class="form-control" id="searchedUserName" name="searchedUserName">
                                                </div>
                                               
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" class="btn btn-primary" style="margin-top: 34px" onclick="search()">查询</button>
                                                <button type="submit" class="btn btn-primary" style="margin-top: 34px" onclick="save()">保存</button>
                                            </div>
                                        </div>
                                </div>

                                <div class="col-md-2">

                                </div>
                            </div>
                            
                            
                            
                            <div class="row">
                                <div class="col-md-7">
                                	<div class="box-header">
                                	
                                	    <div class="row">
                                            <div class="col-md-2">
                                                <h3 class="box-title" style="color:blue;">用户>></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <input type="text" class="form-control" readonly="readonly" id="selectedUserId" name="selectedUserId" value="${selectedUserId}">
                                            </div>
                                        </div>
                               
                            		</div><!-- /.box-header -->
	                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
	                                    <table class="table table-striped" id="userTable">
	                                        <tr>
	                                            <th>用户id</th>
	                                            <th>用户账号</th>
	                                            <th>用户名</th>
	                                        </tr>                                       
	                                        <s:iterator value="PageBean.list" var="userItem">
											<tr onclick="test(<s:property value="#userItem.userId" />)">
												<td><s:property value="#userItem.userId" /></td>
												<td><s:property value="#userItem.userAccount" /></td>
												<td><s:property value="#userItem.userName" /></td>
											</tr>
											</s:iterator>
	                                        
	                                    </table><!-- /.table -->
	                                </div><!-- /.table-responsive -->
	                                <jsp:include page="../../page.jsp">
                            		<jsp:param name="action" value="userList" />
						    		</jsp:include>
                                </div>
                                
                                
                                <div class="col-md-5">
                                	<div class="box-header">
                                		<h3 class="box-title" style="color:blue;">角色>></h3>
                            		</div><!-- /.box-header -->
                            		
                            		<div class="table-responsive" style="margin: 0px 50px 0px 23px">
		                            	<table class="table table-striped">
	                                        <tr>
	                                            <th></th>
	                                            <th>角色名称</th>
	                                            <th>角色描述</th>
	                                        </tr>
	                                    </table>
	                                </div><!-- /.table-responsive -->
                            		
		                            <div class="table-responsive" style="margin: 0px 50px 50px 23px;height:370px;overflow-y:scroll;">
	                                    <table class="table table-striped">
	                                        <s:iterator value="roleList" var="roleItem">
											<tr>
											    <td>
											      <input type="checkbox" name="role" value='<s:property value="#roleItem.role.roleID" />'
											           <s:if test='#roleItem.checked'>checked="checked"</s:if>
											           />
											    </td>						    
												<td><s:property value="#roleItem.role.roleName" /></td>
												<td><s:property value="#roleItem.role.roleDescription" /></td>
											</tr>
											</s:iterator>
	                                        
	                                    </table><!-- /.table -->
	                                </div><!-- /.table-responsive -->
                                </div>

                            </div>
                            
                            
                                                        
                        </div><!-- /.box-->
                        </form>
                    </div>
                </div>           
            </section>
        </aside>
        </s:if>
    	</s:iterator>
    </div>
    
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>


</body>
</html>