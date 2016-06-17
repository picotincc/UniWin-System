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
	.supplement-info {
		text-align: right;
		padding: 15px;
	}

	th {
		text-align: center;
	}

	td > input {
		width: 108px;
	}
	td {
		text-align: center;
	}

	</style>
    <title>ZZL</title>
</head>

<body class="skin-blue">
    <s:if test="#request.session.account!=null">
	<!-- 人物头像 -->
	<jsp:include page="../../headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                   	补料单
                    <small>面料补料单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Supplement</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            	<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">新增面料补料单</h3>
					</div>
					<!-- /.box-header -->
					
					<div class="row">
						<div class="col-md-10">
							<div class="box-body">
							
								<table style="padding: 15px; margin: 20px">
									<tr>
										<td class="supplement-info">补料类型：</td>
										<td><select name="supplementType" id="supplementType">
											<option value="">请选择</option>
											<option value="生产单补料" onclick='$("#productionCode").removeAttr("disabled");'>生产单补料</option>
											<option value="常规性补料" onclick='$("#productionCode").attr("disabled","true");'>常规性补料</option>										
											</select></td>
										<td class="supplement-info">生产单号：</td>
										<td><input type="text" name="productionCode" id="productionCode" value=""></td>									
										<td><label style="color:red">生产单补料需填写生产单号</label></td>
									</tr>
									<tr>
										<td class="supplement-info">补料单号：</td>
										<td><input type="text" name="supplementCode" id="supplementCode"></td>
										<td class="supplement-info">补料日期：</td>
										
										<td><input type="text" class="date-picker" name="supplementDate" id="supplementDate"></td>
										<td class="supplement-info">补料人：</td>
										<td><input type="text" name="userName" id="userName"></td>
									</tr>
								</table>
						
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2">
							<span size="3px" style="margin: 0px 10px 20px 20px; color: blue">面料信息>></span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive" style="margin: 10px 15px 20px 23px">
								<table class="table table-striped" id="tab-detail">
									<tr>
										<th>物料名称</th>
										<th>规格</th>
										<th>数量</th>
										<th>供应商</th>
										<th>补充用途</th>
										<th></th>
										<th>操作</th>
										
									</tr>
									<tr id="0">
                                            <td><input  type="text" name="supplementMaterial[0].materialName" id="detail-0-materialName" readonly></td>
                                            <td><input  type="text" name="supplementMaterial[0].specification" id="detail-0-specification"></td>
                                            <td><input  type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="supplementMaterial[0].vol" id="detail-0-vol" value="0"></td>
                                            <td><input  type="text" name="supplementMaterial[0].vendor" id="detail-0-vendor" readonly></td>
                                            <td><input  type="text" name="supplementMaterial[0].usage" id="detail-0-usage" ></td> 
                                            <td><input  type="hidden" name="supplementMaterial[0].supplyID" id="detail-0-supplyID" ></td>                                          
                                            <td>
                                                <a class="btn btn-success" id="add" onclick="addDetail()"><i class="fa fa-plus"></i></a>
                                            </td>
                                    </tr>																	
								</table>
								<!-- /.table -->								
							</div>
							<!-- /.table-responsive -->
						</div>
					</div>
					<!-- /.table-row -->


					<div class="row">
						<div class="col-md-10">
							<div class="box-body">
								<table style="padding:10px; margin:10px">
									<tr>
										<td class="supplement-infoMore">备注信息：</td>
										<td><textarea type="text" style="width:200%;" name="supplementComment" id="supplementComment"></textarea></td>
										
									</tr>
									
									<tr>
										<td>
											<button type="button" class="btn btn-primary" style="margin-top: 0px" onclick="submitForm()">提交</button>
										</td>
									</tr>

								</table>
							</div>
						</div>
					</div>

				
				
				
				</div>
				
				<!-- /.box-->
				
			</div>
		</div>
   

   <!-- 模态框（Modal） -->
	<div class="modal fade" id="selectMaterial" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 250px; width: 1000px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">添加</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 0px;">
						<!-- .table - Uses sparkline charts-->
						
							
							<table class="table" rules="none" frame="void">
								<tr>
									<td>物料类型：</td>
									<td><select name="shellAccessoryType" id="shellAccessoryType" style="width:100px;height:28px">
										<option value="">请选择</option>
										<option value="里料">里料</option>
										<option value="其他">其他</option>
									</select>
									</td>
									<td>物料编号：</td>
									<td><input type="text" name="materialCode" id="materialCode" ></td>
									<td>物料名称：</td>
									<td><input type="text" name="materialName" id="materialName" ></td>									
									<td style="width:40px"></td>
									<td><button type="submit" class="btn btn-primary" onclick="showSupplementMaterial()">查询</button></td>
									<td><input type="hidden" name="nlen" id="nlen" ></input></td>
									
								</tr>								
							</table>
								<table class="table" rules="none" frame="void">
								<tr>
									<th>物料编码</th>									
                                   	<th>物料名称</th>                                  	
                                   	<th>成分含量</th>
                                   	<th>类型</th>                                	
                                   	<th>颜色</th>
                                   	<th>供应商</th>
                                   	<th></th>
                                   	<th></th>
                                   	<th></th>
                                   	</tr>                                  	
                                   	</table>
                                   	
							<div class="table-responsive" style="height:250px;overflow-y:scroll;">
							<table class="table" rules="none" frame="void" id="detail-table">
								<tr class="detailth">
									
                                </tr>
                                <tbody id="supplementMaterialDetail">
                                	                          
                                </tbody>
                                   
							</table>
							<!-- /.table -->							
							</div>
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
	
         </section>
        </aside>
    </div>
<script type="text/javascript">
	window.onload = changeTab("10900","10901");
	$('.date-picker').datetimepicker({
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
</script>
<script type="text/javascript">
function selectMaterial(nlen){
			$("#detail-table tbody").html("");
			$("#nlen").val(nlen);
			$('#selectMaterial').modal('show');
		
}
function addMaterial(name,vendor,supplyID){
	var sign = document.getElementById('nlen').value;
	$("#detail-"+ sign +"-materialName").val(name);
	$("#detail-"+ sign +"-vendor").val(vendor);
	$("#detail-"+ sign +"-supplyID").val(supplyID);
	$('#selectMaterial').modal('hide');
	
}
function submitForm(){
	var type = document.getElementById('supplementType').value;
	var pCode = document.getElementById('productionCode').value;
	var sCode = document.getElementById('supplementCode').value;
	var date = document.getElementById('supplementDate').value;
	var comment=document.getElementById('supplementComment').value;
	var user = document.getElementById('userName').value;
	var len = $("#tab-detail tr").length-2;	
	var list= "";
	if(pCode==null){		
		pCode="";	
	}
	if(type == ""){		
		alert("请选择补料类型");		
		return;	
	}
	if((type == "生产单补料")&&(pCode=="")){		
		alert("请输入生产单号");		
		return;			
	}
	if(sCode==""){
		//此处补料单号应该由系统生成
		alert("请输入补料单号");
		return;
	}
	if(date==""){		
		alert("请输入补料日期");
		return;
	}
	if(user==""){
		alert("请输入补料人名字");
		return;
	}
	if(len==0){
		alert("请添加物料");
		return;
	}else{
		
		for(var i=0;i<len;i++){
			var temp=new Array();
			
					temp[0]=$("#detail-"+ i +"-supplyID").val();
					temp[1]=$("#detail-"+ i +"-specification").val();
					temp[2]=$("#detail-"+ i +"-vol").val();
					if(temp[2]<=0){
						alert("补料数量太少");
						return;
					}
					temp[3]=$("#detail-"+ i +"-usage").val();
					var tempString=temp[0]+";"+temp[1]+";"+temp[2]+";"+temp[3];
					list=list+tempString+":";
			
		}
	}
	var url=getRootPath()+"/Supplement/";
	
	$.ajax({
		url:url+"addSupplement",
		data:{supplementType:type,productionCode:pCode,supplementCode:sCode,supplementDate:date,supplementComment:comment,userName:user,smList:list},
		type:"post",
		success:function(json){
			alert(json);
		},
		error:function(){
			alert("提交失败");
		}
		
	})
	
}

</script>
<script type="text/javascript">
function showSupplementMaterial(){
	$("#detail-table tbody").html("");
	var constraint = {
			shellAccessoryType:$("#shellAccessoryType").val(),
			materialCode:$("#materialCode").val(),
			materialName:$("#materialName").val()
        };
	var url=getRootPath()+"/Supplement/";
	
	
        $.ajax({
            url:url+"showLiningSupplementMaterial",
            data:constraint,
            type:"post",
            dataType:"json",
            success: function(json){  
        	var data = eval(json);
        	var content = "";
          	$.each(data,function(index,item){
          		var code = data[index].materialCode;
          		var name = data[index].materialName;
          		var ingredient = data[index].materialIngredient;
          		var type = data[index].shellAccessoryType;
          		var color = data[index].colorDescription;
          		var vendor = data[index].vendorName;
          		var supplyID=data[index].supplyID;
          		content+="<tr ondblclick='addMaterial(\""+name+"\",\""+vendor+"\",\""+supplyID+"\")' style='color:blue'><td>"+code+"</td><td>"+name
          					+"</td><td>"+ingredient+"</td><td>"+type+"</td><td>"+color+"</td><td>"+vendor
          					+"</td><td><button type='button' class='btn btn-danger' onclick='addMaterial(\""+name+"\",\""+vendor+"\",\""+supplyID+"\")'>添加</button></td></tr>";
          	});
          		
          	$("#supplementMaterialDetail").html(content);
            },
		 	error: function(){  
		 		
            }  
             
        })
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
<script>
    var addDetail = function () {
    	
        var _len = $("#tab-detail tr").length-2;


        $('#add i').removeClass().addClass("fa fa-minus");
        $('#add').attr('onclick',"deltr("+_len+")");
        $('#add').attr('id','delete-'+_len);

        var nlen = _len + 1;
        $("#tab-detail").append("<tr id="+nlen+" align='center'>"
                +"<td><input type='text' name='supplementMaterial["+ nlen +"].materialName' id='detail-"+ nlen +"-materialName' readonly></td>"
                +"<td><input type='text' name='supplementMaterial["+ nlen +"].specification' id='detail-"+ nlen +"-specification'></td>"
                +"<td><input type='text' onkeyup='this.value=this.value.replace(/\\D/g,\"\")' onafterpaste='this.value=this.value.replace(/\\D/g,\"\")' name='supplementMaterial["+ nlen +"].vol' id='detail-"+ nlen +"-vol' value='0'></td>"
                +"<td><input type='text' name='supplementMaterial["+ nlen +"].vendor' id='detail-"+ nlen +"-vendor' readonly></td>"
                +"<td><input type='text' name='supplementMaterial["+ nlen +"].usage' id='detail-"+ nlen +"-usage'></td>"
                +"<td><input type='hidden' name='supplementMaterial["+ nlen +"].supplyID' id='detail-"+ nlen +"-supplyID'></td>"
                +"<td><button class='btn-success' id='add' onclick='addDetail()'><i class='fa fa-plus'></i></button></td>"
                +"</tr>");
        selectMaterial(nlen-1);
    }
    //删除<tr/>
    var deltr = function (index) {
        var _len = $("#tab-detail tr").length - 2;

        $("tr[id='" + index + "']").remove();//删除当前行
        var nextMaterialName,nextSpecification,nextVol,nextVendor,nextUsage,nextSupplyID;
        for (var i = index + 1, j = _len ; i < j; i++) {
            nextMaterialName = $("#detail-" + i +"-materialName").val();
            nextSpecification = $("#detail-" + i +"-specification").val();
            nextVol = $("#detail-" + i +"-vol").val();
            nextVendor = $("#detail-" + i +"-vendor").val();
            nextUsage = $("#detail-" + i +"-usage").val();
            nextSupplyID= $("#detail-" + i +"-supplyID").val();
            
            $("tr[id=\'" + i + "\']")
                    .replaceWith("<tr id=" + (i - 1) + " align='center'>"
                            + "<td><input type='text' name='supplementMaterial["+ (i - 1) +"].materialName' value='" + nextMaterialName + "' id='detail-"+ (i - 1) +"-materialName' readonly></td>"
                            + "<td><input type='text' name='supplementMaterial["+ (i - 1) +"].specification' id='detail-"+ (i - 1) +"-specification' value='" + nextSpecification + "' readonly></td>"
                            + "<td><input type='text' onkeyup='this.value=this.value.replace(/\\D/g,\"\")' onafterpaste='this.value=this.value.replace(/\\D/g,\"\")' name='supplementMaterial["+ (i - 1) +"].vol' id='detail-"+ (i - 1) +"-vol' value='" + nextVol + "' readonly></td>"
                            + "<td><input type='text' name='supplementMaterial["+ (i - 1) +"].vendor' id='detail-"+ (i - 1) +"-vendor' value='" + nextVendor + "' readonly></td>"
                            + "<td><input type='text' name='supplementMaterial["+ (i - 1) +"].usage' id='detail-"+ (i - 1) +"-usage' value='" + nextUsage + "' readonly></td>"
                            + "<td><input type='hidden' name='supplementMaterial["+ (i - 1) +"].supplyID' id='detail-"+ (i - 1) +"-supplyID' value='" + nextSupplyID + "'></td>"
                            + "<td><button class='btn-success' onclick=\'deltr(" + (i - 1) + ")\' id='delete-'"+(i-1)+"><i class='fa fa-minus'></i></button></td>"
                            + "</tr>");
        }

        $("tr[id=\'" + (_len) + "\']")
                .replaceWith("<tr id=" + (_len - 1) + " align='center'>"
                        + "<td><input type='text' name='supplementMaterial["+ (_len - 1) +"].materialName'  id='detail-"+ (_len - 1) +"-materialName' readonly></td>"
                        + "<td><input type='text' name='supplementMaterial["+ (_len - 1) +"].specification' id='detail-"+ (_len - 1) +"-specification'></td>"
                        + "<td><input type='text' onkeyup='this.value=this.value.replace(/\\D/g,\"\")' onafterpaste='this.value=this.value.replace(/\\D/g,\"\")' name='supplementMaterial["+ (_len - 1) +"].vol' id='detail-"+ (_len - 1) +"-vol' value='0'></td>"
                        + "<td><input type='text' name='supplementMaterial["+ (_len - 1) +"].vendor' id='detail-"+ (_len - 1) +"-vendor'readonly></td>"
                        + "<td><input type='text' name='supplementMaterial["+ (_len - 1) +"].usage' id='detail-"+ (_len - 1) +"-usage'></td>"
                        + "<td><input type='hidden' name='supplementMaterial["+ (_len - 1) +"].supplyID' id='detail-"+ (_len - 1) +"-supplyID'></td>"
                        + "<td><button class='btn-success' onclick='addDetail()' id='add'><i class='fa fa-plus'></i></button></td>"
                        + "</tr>");

    }
</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>