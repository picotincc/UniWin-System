<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <!-- css,js 引包 -->
    <jsp:include page="../../header.jsp"></jsp:include>

    <title>ZZL</title>
</head>

<body class="skin-blue">
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
                    物料管理
                    <small>物料修改</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>物料管理</a></li>
                    <li class="active">物料修改</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">

                            <div class="box-header">
                                <h3 class="box-title">物料修改</h3>
                            </div>

                            <form role="form" method="post" action="<%=request.getContextPath()%>/Material/updateMaterial">
                                <div class="table-responsive" style="margin: 0px 50px 50px 25px;">
                                    <table class="table table-striped">
                                        <tbody>
                                        <tr>
                                            <td><label>物料编号</label></td>
                                            <td><input type="text" class="form-control" id="materialCode" name="materialCode" value=${materialvo.materialCode} readonly="true"></td>
                                            <td><label>物料名称</label></td>
                                            <td><input type="text" class="form-control" id="materialName" name="materialName" value=${materialvo.materialName}></td>
                                        </tr>
                                        <tr>
                                            <td><label>物料类型</label></td>
                                            <td><input type="text" class="form-control" id="materialType" name="materialType" value=${materialvo.materialType}></td>
                                            <td><label>色号</label></td>
                                            <td><input type="text" class="form-control" id="colorCode" name="colorCode" value=${materialvo.colorCode}></td>
                                        </tr>
                                        <tr>
                                            <td><label>颜色说明</label></td>
                                            <td><input type="text" class="form-control" id="colorDescription" name="colorDescription" value=${materialvo.colorDescription}></td>
                                            <td><label>物料成分</label></td>
                                            <td><input type="text" class="form-control" id="materialIngredient" name="materialIngredient" value=${materialvo.materialIngredient}></td>
                                        </tr>
                                        <tr>
                                            <td><label>单价</label></td>
                                            <td><input type="text" class="form-control" id="unitPrice" name="unitPrice" value=${materialvo.unitPrice}></td>
                                            <td><label>单位</label></td>
                                            <td><input type="text" class="form-control" id="unit" name="unit" value=${materialvo.unit}></td>
                                        </tr>
                                        <tr>
                                            <td><label>门幅</label></td>
                                            <td><input type="text" class="form-control" id="width" name="width" value=${materialvo.width}></td>
                                            <td><label>出量</label></td>
                                            <td><input type="text" class="form-control" id="outputVol" name="outputVol" value=${materialvo.outputVol}></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                        <button style="float:right" class="btn btn-primary" onclick="javascript:window.history.back(-1);">返回</button>
                                        <button type="submit" style="float:right;margin-right:10px" class="btn btn-primary">确定</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            
            </section>
        </aside>
    </div>

    <script type="text/javascript">
        window.onload = changeTab("10000","10003");
    </script>


</s:if>
<s:else>
    <jsp:include page="../../login.jsp"></jsp:include>
</s:else>

</body>
</html>