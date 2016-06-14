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

    <title>ZZL</title>
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
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h4 class="box-title" style="color:blue;">组织信息>></h4>
                            </div><!-- /.box-header -->
                            
                            <!-- 查询与按钮  -->
                            <div class="row">
                                <!-- 查询   -->
                                <div class="col-md-8">
                                    <!-- form start -->
                                    <form role="form" method="post" action="<%=request.getContextPath()%>/System/addDepartment">
                                        <div class="row">
                                        
                                            <div class="col-md-6">
                                                <div class="box-body">
                                                    <label>部门全称</label>
                                                    <input type="text" class="form-control" id="departmentFullName" name="departmentFullName">
                                                </div>
                                                <div class="box-body">
                                                    <label>英文名称</label>
                                                    <input type="text" class="form-control" id="departmentEnName" name="departmentEnName">
                                                </div>
                                                <div class="box-body">
                                                    <label>电话</label>
                                                    <input type="text" class="form-control" id="departmentPhone" name="departmentPhone">
                                                </div>
                                                <div class="box-body">
                                                    <button type="submit" class="btn btn-primary" style="margin-top: 34px">保存</button>
                                                    <button type="button" class="btn btn-primary" style="margin-top: 34px" onclick="javascript:history.go(-1);">退出</button>
                                                </div>
                                                
                                                
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="box-body">
                                                    <label>部门编码</label>
                                                    <input type="text" readonly="readonly" class="form-control" id="departmentID" name="departmentID">
                                                </div>
                                                <div class="box-body">
                                                    <label>简称</label>
                                                    <input type="text" class="form-control" id="departmentAbbrName" name="departmentAbbrName">
                                                </div>
                                                <div class="box-body">
                                                    <label>简要描述</label>
                                                    <input type="text" class="form-control" id="departmentDescription" name="departmentDescription">
                                                </div>
                                            </div>
                                             
                                             
                                        </div>
                                    </form>
                                </div>

                                
                            
                            </div>
                        </div><!-- /.box-->
                    </div>
                </div>           
            </section>
        </aside>
    </div>


</body>
</html>