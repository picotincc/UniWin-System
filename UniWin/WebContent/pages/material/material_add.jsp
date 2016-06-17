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
                    <small>物料新增</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>物料管理</a></li>
                    <li class="active">物料新增</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary" style="height:480px">

                            <div class="box-header">
                                <h3 class="box-title">物料信息</h3>
                            </div>

                                <div class="table-responsive" style="margin: 0px 50px 50px 25px;">
                                    <table class="table table-striped">
                                        <tbody>
                                        <tr>
                                            <td><label>物料编号</label></td>
                                            <td><input type="text" class="form-control" id="materialCode" name="materialCode"></td>
                                            <td><label>物料名称</label></td>
                                            <td><input type="text" class="form-control" id="materialName" name="materialName"></td>
                                        </tr>
                                        <tr>
                                            <td><label>物料类型</label></td>
                                            <td>
                                                <select name="materialType" id="materialType">
                                                    <option>面料</option>
                                                    <option>辅料</option>
                                                </select>
                                            </td>
                                            <td><label>色号</label></td>
                                            <td><input type="text" class="form-control" id="colorCode" name="colorCode"></td>
                                        </tr>
                                        <tr>
                                            <td><label>颜色说明</label></td>
                                            <td><input type="text" class="form-control" id="colorDescription" name="colorDescription"></td>
                                            <td><label>物料成分</label></td>
                                            <td><input type="text" class="form-control" id="materialIngredient" name="materialIngredient"></td>
                                        </tr>
                                        <tr>
                                            <td><label>单价</label></td>
                                            <td><input type="text" class="form-control" id="unitPrice" name="unitPrice"></td>
                                            <td><label>单位</label></td>
                                            <td><input type="text" class="form-control" id="unit" name="unit"></td>
                                        </tr>
                                        <tr>
                                            <td><label>门幅</label></td>
                                            <td><input type="text" class="form-control" id="width" name="width"></td>
                                            <td><label>出量</label></td>
                                            <td><input type="text" class="form-control" id="outputVol" name="outputVol"></td>
                                        </tr>
                                        <tr>
                                            <td><label>供应商</label></td>
                                            <td colspan="2"><input type="text" class="form-control" id="vendorName" name="vendorName" readonly="true"></td>
                                            <td><button class="btn btn-primary" onclick="showVendorList()">选择</button></td>
                                        </tr>
                                        <tr></tr>
                                        <tr>
                                            <td><label>仓储位置</label></td>
                                            <td colspan="2"><input type="text" class="form-control" id="warehouse" name="warehouse" readonly="true"></td>
                                            <td><button class="btn btn-primary" onclick="showWarehouseList()">选择</button></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                        <button style="float:right" class="btn btn-primary" onclick="showAddMaterial()">取消</button>
                                        <button style="float:right;margin-right:10px" class="btn btn-primary" onclick="addMaterial()">确定</button>
                                </div>
                        </div>
                    </div>
                </div>
            
            </section>
        </aside>
    </div>


        <!-- 模态框（Modal） -->
    <div class="modal fade" id="List" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="height: 300px; width: 820px">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #00c0ef">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="color: white">选择列表</h4>
                </div>
                <div class="modal-body">
                    <div class="table" style="margin-top: 10px;">
                        <!-- .table - Uses sparkline charts-->
                    </div>

                    <!-- 表格  -->
                    <div class="row">
                        <div class="table-responsive" style="margin: 50px 50px 50px 23px" >
                            <table class="table table-striped"  id="detail-table">
                                <tr>
                                    <th>物料编号</th>
                                    <th>物料名称</th>
                                    <th>类型</th>
                                    <th>成分</th>
                                    <th>操作</th>
                                </tr>
                            <tbody id="table-detail">
                                    <tr>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td>4</td>
                                        <td>5</td>
                                    </tr>
                            </tbody>
                            </table>
                            <!-- /.table -->
                        </div>
                        <!-- /.table-responsive -->
                        <!-- 分页 -->
                    </div>
                    <!-- /.table-row -->


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->


        <script type="text/javascript">
            window.onload = changeTab("10000","10001");

            function showVendorList(){
                $("#detail-table tbody").html("");
                var Table = document.getElementById("detail-table");
                var newTH = Table.insertRow();
                newTH.className="detailth";
                newTH.innerHTML="<th>供应商编号</th><th>供应商名称</th><th>供应商地址</th><th>操作</th>";


                    var content = "";
                    params = {
                        
                    };

                    jQuery.post("http://localhost:8080/ZZL/Material/getVendorList",params,function(json){
                        var data = eval("("+json+")"); 
                        for(var detail in data){
                            var vendorID = data[detail].vendorID;
                            var vendorName = data[detail].vendorName;
                            var vendorAddr = data[detail].vendorAddr;

                            var newRow = Table.insertRow(); 
                            var newID = newRow.insertCell(); //创建新单元格
                            newID.innerHTML = vendorID; 
                            var newName = newRow.insertCell(); //创建新单元格
                            newName.innerHTML = vendorName;
                            var newAddr = newRow.insertCell();
                            newAddr.innerHTML = vendorAddr;
                            var button = newRow.insertCell();
                            button.innerHTML = "<button type='button' class='btn btn-danger' onclick='setVendor(\""+vendorName+"\")'>选择</button>";
                        }
                    },"json");
                $('#List').modal('show');
            }

            function setVendor(vendorName){
                $("#vendorName").val(vendorName);
                $('#List').modal('hide');
            }


            function showWarehouseList(){
                $("#detail-table tbody").html("");
                var Table = document.getElementById("detail-table");
                var newTH = Table.insertRow();
                newTH.className="detailth";
                newTH.innerHTML="<th>仓库编号</th><th>仓库位置</th><th>操作</th>";


                    var content = "";
                    params = {
                        
                    };

                    jQuery.post("http://localhost:8080/ZZL/Material/getWarehouseList",params,function(json){
                        var data = eval("("+json+")"); 
                        for(var detail in data){
                            var warehouseid = data[detail].warehouseid;
                            var location = data[detail].location;

                            var newRow = Table.insertRow(); 
                            var newID = newRow.insertCell(); //创建新单元格
                            newID.innerHTML = warehouseid; 
                            var newLoc = newRow.insertCell(); //创建新单元格
                            newLoc.innerHTML = location;
                            var button = newRow.insertCell();
                            button.innerHTML = "<button type='button' class='btn btn-danger' onclick='setWarehouse(\""+location+"\")'>选择</button>";
                        }
                    },"json");
                $('#List').modal('show');
            }

            function setWarehouse(location){
                $("#warehouse").val(location);
                $('#List').modal('hide');
            }

            function addMaterial(){
                var materialCode = $("input[name='materialCode']").val();
                var materialName = $("input[name='materialName']").val();

                var s = document.getElementById('materialType');
                var materialType = s.options[s.selectedIndex].text;
                
                var colorCode = $("input[name='colorCode']").val();
                var colorDescription = $("input[name='colorDescription']").val();
                var materialIngredient = $("input[name='materialIngredient']").val();
                var unitPrice = $("input[name='unitPrice']").val();
                var unit = $("input[name='unit']").val();
                var width = $("input[name='width']").val();
                var outputVol = $("input[name='outputVol']").val();
                var vendorName = $("input[name='vendorName']").val();
                var warehouse = $("input[name='warehouse']").val();

                var url=getRootPath()+"/Material/";
    
                $.ajax({
                    url:url+"addMaterial",
                    data:{materialCode:materialCode,materialName:materialName,materialType:materialType,colorCode:colorCode,colorDescription:colorDescription,materialIngredient:materialIngredient,unitPrice:unitPrice,unit:unit,width:width,outputVol:outputVol,vendorName:vendorName,warehouse:warehouse},
                    type:"post",
                    success:function(){
                        alert("提交成功");
                        location.reload();
                    },
                    error:function(){
                        alert("提交失败");
                    }
                    
                })
            }

            function showAddMaterial(){
                location.href= getRootPath() + "/Material/showAddMaterial";
            }
                       
            function getRootPath(){
                var curWwwPath = window.document.location.href;
                var pathName = window.document.location.pathname;
                var pos = curWwwPath.indexOf(pathName);
                var localhostPath = curWwwPath.substring(0, pos);
                var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
                return(localhostPath + projectName);
            }
        </script>

</s:if>
<s:else>
    <jsp:include page="../../login.jsp"></jsp:include>
</s:else>


</body>
</html>