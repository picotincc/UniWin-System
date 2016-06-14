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

    <title>智造链-系统管理-异常参数修改</title>
    <script language="text/javascript">
		window.onload = changeTab("11500","11506");
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
                <h1>异常参数修改</h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title" style="color:blue;">异常参数信息>></h3>
                            </div><!-- /.box-header -->
                            

                            <div class="row">
                                <div class="col-md-8">
                                    <!-- form start -->
                                    <form role="form" method="post" action="<%=request.getContextPath()%>/System/updateAbnormalParameter">
                                        <div class="row">
                                        
                                            <div class="col-md-6">
                                            	<div class="box-body">
                                                    <label>异常参数ID</label>
                                                    <input type="text" readonly="readonly" class="form-control" id="abnormalParameterID" name="abnormalParameterID" value="${abnormalParameterItem.getAbnormalParameterID()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>异常参数名称</label>
                                                    <input type="text" class="form-control" id="abParaName" name="abParaName" value="${abnormalParameterItem.getAbParaName()}">
                                                </div>
                                                <div class="box-body">
                                                    <label>异常参数值</label>
                                                    <input type="text" class="form-control" id="abParaValue" name="abParaValue" value="${abnormalParameterItem.getAbParaValue()}">
                                                </div>
                                                <div class="box-body">
                                                    <button type="submit" class="btn btn-primary" style="margin-top: 34px">保存</button>
                                                    <button type="button" class="btn btn-primary" style="margin-top: 34px" onclick="javascript:history.go(-1);">退出</button>
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