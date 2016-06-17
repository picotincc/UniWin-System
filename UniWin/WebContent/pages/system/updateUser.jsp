<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>
    <link href="<%=request.getContextPath()%>/css/orders.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        th {
            text-align: center;
        }

        td {
            text-align: center;
        }
    </style>

    <title>智造链-系统管理-用户修改</title>
    <script language="text/javascript">
		window.onload = changeTab("11500","11503");
    </script>
</head>

<body class="skin-blue">
    <!-- header logo: style can be found in header.less -->
    <header class="header">
        <a href="index.html" class="logo">
        <!-- Add the class icon to your logo image or logo icon to add the margining -->
            智&nbsp造&nbsp链
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
        </nav>
    </header>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>组织部门新增</h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                    <form role="form" method="post" action="<%=request.getContextPath()%>/System/updateUser">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title" style="color:blue;">基础信息>></h3>
                            </div><!-- /.box-header -->
                            
                            <!-- 查询与按钮  -->
                            <div class="row">
                                <!-- 查询   -->
                                <div class="col-md-8">
                                    
                                        <div class="row">
                                        
                                            <div class="col-md-6">
                                                <div class="box-body">
                                                    <label>姓名</label>
                                                    <input type="text" class="form-control" id="userName" name="userName" value="${userItem.getUserName()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>手机号码</label>
                                                    <input type="text" class="form-control" id="userMobileNum" name="userMobileNum" value="${userItem.getUserMobileNum()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>微信号</label>
                                                    <input type="text" class="form-control" id="userWeChatNum" name="userWeChatNum" value="${userItem.getUserWeChatNum()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>备注</label>
                                                    <input type="text" class="form-control" id="userComment" name="userComment" value="${userItem.getUserComment()}">
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="box-body">
                                                    <label>住址</label>
                                                    <input type="text" class="form-control" id="userAddr" name="userAddr" value="${userItem.getUserAddr()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>E-mail</label>
                                                    <input type="text" class="form-control" id="userEMail" name="userEMail" value="${userItem.getUserEMail()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>公司名称</label>
                                                    <input type="text" class="form-control" id="userComName" name="userComName" value="${userItem.getUserComName()}">
                                                </div>
                                            </div>
                                             
                                             
                                        </div>
                                </div>
                            </div>
                            
                            <div class="box-header">
                                <h3 class="box-title" style="color:blue;">账户信息>></h3>
                            </div><!-- /.box-header -->
                            
                            <!-- 查询与按钮  -->
                            <div class="row">
                                <!-- 查询   -->
                                <div class="col-md-8">
                                    
                                        <div class="row">
                                        
                                            <div class="col-md-6">
                                                <div class="box-body">
                                                    <label>账户名</label>
                                                    <input type="text" class="form-control" id="userAccount" name="userAccount" value="${userItem.getUserAccount()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>账户自编码</label>
                                                    <input type="text" readonly="readonly" class="form-control" id="userId" name="userId" value="${userItem.getUserId()}">
                                                </div>
                            					
                            					
                                                <div class="box-body">
                                                    <button type="submit" class="btn btn-primary" style="margin-top: 34px">保存</button>
                                                    <button type="button" class="btn btn-primary" style="margin-top: 34px" onclick="javascript:history.go(-1);">退出</button>
                                                </div>

                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="box-body">
                                                    <label>初始密码</label>
                                                    <input type="text" class="form-control" id="userPassword" name="userPassword" value="${userItem.getUserPassword()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>所属部门</label>
                                                    <select name="department">
														<s:iterator value="departmentList" var="departmentItem">
															<option <s:if test="#departmentItem.belongToUser">selected</s:if> value='<s:property value="#departmentItem.department.departmentID" />'><s:property value="#departmentItem.department.departmentFullName" /></option>
														</s:iterator>
													</select>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div><!-- /.box-->
                        </form>
                        
                    </div>
                </div>           
            </section>
        </aside>
    </div>


</body>
</html>