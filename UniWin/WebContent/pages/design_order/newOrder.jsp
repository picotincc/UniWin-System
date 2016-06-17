<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>
 
    <style type="text/css">
 .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.table{border-top: 3px solid #7D9EC0;}
.input-group,.form-group{position: relative;float: left;width: 15%;}
.form-control{float: left;width: 100%;}
th{font-size: 12px;color: #4F4F4F;text-align: center;}
td{text-align: center;font-size:12px;}
/* .tdLabel{width:0px;display:none} */
tr{background-color:transpare;}
a{color:#008080;}
.commdity-graph{margin-left:80px;width: 10%;height: 10%;}
.png_area{margin-top:-20px;margin-bottom:20px;}

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
                                                     款式与订单
                    <small>新建订单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">新建订单</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
           
           
            <div class="row">
            
            <form  role="form" id="addForm" name="addForm" method="post" action="<%=request.getContextPath()%>/Design_Order/addOrder">
                       <div class="orderDetail">
                    <div class="order-customer">
                    <a>订单信息>></a><br/>
                    <table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="width:100px;">客户名称：</td>
                                <td><input type="text" class="form-control" id="customerBrandName"name="customerBrandName" placeholder="客户名称" style="float:left;padding: 2px 10px;width:500px"maxlength="30"></td>
                             </tr>
                            <tr>
                                <td>订单优先级（普通/第一时间）：</td>
                                <td><input type="text" class="form-control" id="orderPriority"name="orderPriority" placeholder="订单优先级" style="float:left;padding: 2px 10px;width:500px" maxlength="30"></td>
                             </tr>
                             <tr>
                                <td>订单类型（新款/翻单）：</td>
                                <td><input type="text" class="form-control" id="orderType"name="orderType" placeholder="订单类型" style="float:left;padding: 2px 10px;width:500px" maxlength="30"></td>
                             </tr> 
                             <tr>
                                <td>配送方式：</td>
                                <td><input type="text" class="form-control" id="orderProcessType"name="orderProcessType" placeholder="配送方式" style="float:left;padding: 2px 10px;width:500px" maxlength="30"></td>
                             </tr> 
                          </tbody>
                       </table>
                    </div>
                    <div class="order-charge">
                    
                    <a>询单信息>></a><br/>
                    
                    <div class="orderInquiryInfo">
                        <table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="width:100px;">款式名称：</td>
                                <td><input id="designName" name="designName"
					                            type="text" class="form-control form-input" disabled="true"　readOnly="true"  style="float:left;padding: 2px 10px;width:500px"value="<s:property value="design.designName"/>"
					                            maxlength="30"></td>
                             </tr>
                             <tr>
                                <td>款式类型：</td>
                                <td><input id="designType" name="designType"
					                            type="text" class="form-control form-input" disabled="true"　readOnly="true"  style="float:left;padding: 2px 10px;width:500px"value="<s:property value="design.designType"/>"
					                            maxlength="30"></td>
                             </tr>
                              <tr>
                                <td>要求货期：</td>
                                <td><input type="text" class="form-control" id="orderFinishDate"name="orderFinishDate" placeholder="" style="float:left;padding: 2px 10px;width:500px"maxlength="30" ></td>
                             </tr>
                              <tr>
                                <td>参考网址：</td>
                                <td><input type="text" class="form-control" id="orderRefURL"name="orderRefURL" placeholder="参考网址" style="float:left;padding: 2px 10px;width:500px" maxlength="200"></td>
                             </tr>
                          </tbody>
                        </table>       
                        <div class="png_area">
                    <img src="../images/1.png" class="commdity-graph">
                    </div>                 
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                    <div class="table-responsive" style="margin: 10px 15px 20px 23px">
                            <!-- .table - Uses sparkline charts-->
                            <table class="table table-striped" id="tab-detail">
                              
                                <tr>
                                    <th>颜色</th>
                                    <th>XS</th>
                                    <th>S</th>
                                    <th>M</th>
                                    <th>L</th>
                                    <th>XL</th>
                                    <th>XXL</th>
                                    <th>合计</th>
                                    <th>操作</th>
                                   
                                </tr>
                              
                                <tr id="0">
                                <td><input type="text" name="details_add[0].orderColor" 
											id="detail-0-color" style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderXS"
											id="detail-0-xs" value="0"  style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderS"
											id="detail-0-s" value="0" style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderM"
											id="detail-0-m" value="0" style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderL"
											id="detail-0-l" value="0" style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderXL"
											id="detail-0-xl" value="0" style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderXXL"
											id="detail-0-xxl" value="0" style="width:100px"></td>
										<td><input type="text" name="details_add[0].orderTotal"
											id="detail-0-sum" value="0" disabled style="width:100px"></td>
										<td>
											<a class="btn btn-success" id="add" onclick="addDetail()">
												<i class="fa fa-plus"></i>
											</a>
										</td>
							   </tr>
                              
                                                             
                            </table><!-- /.table -->
                            </div>
                        </div>
                        </div>
                        <a>物料详情(若需要提供指定的面料，请详细填写以下的表格，否则不需要填写)>></a><br/><br/>
                        <div class="table-responsive">
                            <!-- .table - Uses sparkline charts-->
                            <table class="table table-striped" id="tab-materaildetail">
                             
                                <tr>
                                    <th>物料名称/面、辅料/色号/供应商</th>
                                    <th>物料属性</th>
                                    <th>订购数量</th>
                                    <th>备注说明</th>
                                    <th>操作</th>
                                </tr>
                                 <tr id="new0">
                              <%--  <td><s:select list="supplyList" name="materialdetails_add[0].materialName"   
                                 listKey="material.materialName" listValue="material.materialName"  
                                 style="width:100px"/></td>
								<td><input type="text" name="materialdetails_add[0].orderMaterialAttr"
											id="detail-0-2"   style="width:100px"></td>
										<td><s:select list="supplyList" name="materialdetails_add[0].materialType"   
                                            listKey="material.materialType" listValue="material.materialType"  
                                            style="width:100px"/></td>
										<td><s:select list="supplyList" name="materialdetails_add[0].colorCode"   
                                            listKey="material.colorCode" listValue="material.colorCode"  
                                            style="width:100px"/></td>
										<td><s:select list="supplyList" name="materialdetails_add[0].vendorName"   
                                            listKey="vendor.vendorName" listValue="vendor.vendorName"  
                                            style="width:100px"/></td>
										<td><input type="text" name="materialdetails_add[0].orderVol"
											id="detail-0-6" value="0" style="width:100px"></td>
										<td><input type="text" name="materialdetails_add[0].orderComment"
											id="detail-0-7" value="" style="width:100px"></td>
										<td>
											<a class="btn btn-success" id="addtr" onclick="addMaterialDetail()">
												<i class="fa fa-plus"></i>
											</a>
										</td>		 --%>
										
										<td><select name="materialdetails_add[0].materialName"  style="width:250px" id="detail-0-1">
										<s:iterator value="supplyList" var="supply"><option><s:property value="#supply.material.materialName"/>/<s:property value="#supply.material.materialType"/>/<s:property value="#supply.material.colorCode"/>/<s:property value="#supply.vendor.vendorName"/></option></s:iterator></select></td>
										<td><input type="text" name="materialdetails_add[0].orderMaterialAttr"
											id="detail-0-2"   style="width:100px"></td>
										
										<td><input type="text" name="materialdetails_add[0].orderVol"
											id="detail-0-6" value="0" style="width:100px"></td>
										<td><input type="text" name="materialdetails_add[0].orderComment"
											id="detail-0-7" value="" style="width:100px"></td>
							            <td>
											<a class="btn btn-success" id="addtr" onclick="addMaterialDetail()">
												<i class="fa fa-plus"></i>
											</a>
										</td>	
                                </tr> 
                             
                                                             
                            </table><!-- /.table -->
                        </div>
                        <a>其他详情>></a><br/><br/>
                        <table class="table">
                          <tbody>
                             <tr>
                                <td style="width:130px;">样板码数：</td>
                                <td><input type="text" class="form-control" id="orderSampleYardage"name="orderSampleYardage" placeholder="样板码数" style="float:left;padding: 2px 10px;width:500px" maxlength="30"></td>
                             </tr>
                             <tr>
                                <td>水洗标要求：</td>
                                <td><input type="text" class="form-control" id="orderSewnInLabelReq"name="orderSewnInLabelReq" placeholder="水洗标要求" style="float:left;padding: 2px 10px;width:500px" maxlength="30"></td>
                             </tr>
                              <tr>
                                <td>工艺制作要求：</td>
                                <td><input type="text" class="form-control" id="orderTechReq"name="orderTechReq" placeholder="工艺制作要求" style="float:left;padding: 2px 10px;width:500px" maxlength="30"></td>
                             </tr>
                              <tr>
                                <td>其他备注：</td>
                                <td><input type="text" class="form-control" id="Comment"name="Comment" placeholder="其他备注" style="float:left;padding: 2px 10px;width:500px"maxlength="30" ></td>
                             </tr>
                          </tbody>
                        </table>   
                </div>
            
            
					  <button type="submit"  id="submit"
				      class="btn btn-primary" onclick="submitorder()">提交</button>
				       <button type="button" id="returnPrevPage" class="btn btn-primary" onclick="history.go(-1);">返回</button><br/>
          </form>
            </div>
            
            </section>
        </aside>
    </div>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>	
<script type="text/javascript">
var x = 1; //initlal text box count
var max_fields      = 10; //maximum input boxes allowed
window.onload = changeTab("12000","12001");
$('#orderFinishDate').datetimepicker({
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

var addDetail = function () {
    var _len = $("#tab-detail tr").length-2;

    //禁用输入
    $("#detail-"+_len+"-color").attr("readonly","readonly");
    $("#detail-"+_len+"-xs").attr("readonly","readonly");
    $("#detail-"+_len+"-s").attr("readonly","readonly");
    $("#detail-"+_len+"-m").attr("readonly","readonly");
    $("#detail-"+_len+"-l").attr("readonly","readonly");
    $("#detail-"+_len+"-xl").attr("readonly","readonly");
    $("#detail-"+_len+"-xxl").attr("readonly","readonly");

    //求总和
    var sum = parseInt($("#detail-"+_len+"-xs")[0].value)
            + parseInt($("#detail-"+_len+"-s")[0].value)
            + parseInt($("#detail-"+_len+"-m")[0].value)
            + parseInt($("#detail-"+_len+"-l")[0].value)
            + parseInt($("#detail-"+_len+"-xl")[0].value)
            + parseInt($("#detail-"+_len+"-xxl")[0].value);
    $("#detail-"+_len+"-sum").val(sum);

    $('#add i').removeClass().addClass("fa fa-minus");
    $('#add').attr('onclick',"deltr("+_len+")");
    $('#add').attr('id','delete-'+_len);

    var nlen = _len + 1;
    $("#tab-detail").append("<tr id="+nlen+" align='center'>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderColor' id='detail-"+ nlen +"-color' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderXS' id='detail-"+ nlen +"-xs' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderS' id='detail-"+ nlen +"-s' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderM' id='detail-"+ nlen +"-m' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderL' id='detail-"+ nlen +"-l' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderXL' id='detail-"+ nlen +"-xl' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderXXL' id='detail-"+ nlen +"-xxl' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='details_add["+ nlen +"].orderTotal' id='detail-"+ nlen +"-sum'value='0' disabled style='width:100px'></td>"
            +"<td><a class='btn btn-success' id='add' onclick='addDetail()'><i class='fa fa-plus'></i></a></td>"
            +"</tr>");
};

//删除<tr/>
var deltr = function (index) {
    var _len = $("#tab-detail tr").length - 2;

    $("tr[id='" + index + "']").remove();//删除当前行
    var nextColor,nextXS,nextS,nextM,nextL,nextXL,nextXXL,nextSUM;
    for (var i = index + 1, j = _len ; i < j; i++) {
        nextColor = $("#detail-" + i +"-color").val();
        nextXS = $("#detail-" + i +"-xs").val();
        nextS = $("#detail-" + i +"-s").val();
        nextM = $("#detail-" + i +"-m").val();
        nextL = $("#detail-" + i +"-l").val();
        nextXL = $("#detail-" + i +"-xl").val();
        nextXXL = $("#detail-" + i +"-xxl").val();
        nextSUM = $("#detail-" + i +"-sum").val();
        $("tr[id=\'" + i + "\']")
                .replaceWith("<tr id=" + (i - 1) + " align='center'>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderColor' value='" + nextColor + "' id='detail-"+ (i - 1) +"-color' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderXS' id='detail-"+ (i - 1) +"-xs' value='" + nextXS + "' readonly style='width:100px'> </td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderS' id='detail-"+ (i - 1) +"-s' value='" + nextS + "' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderM' id='detail-"+ (i - 1) +"-m' value='" + nextM + "' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderL' id='detail-"+ (i - 1) +"-l' value='" + nextL + "' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderXL' id='detail-"+ (i - 1) +"-xl' value='" + nextXL + "' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderXXL' id='detail-"+ (i - 1) +"-xxl' value='" + nextXXL + "' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='details_add["+ (i - 1) +"].orderTotal' id='detail-"+ (i - 1) +"-sum' value='" + nextSUM + "' disabled style='width:100px'></td>"
                        + "<td><a class='btn btn-success' onclick=\'deltr(" + (i - 1) + ")\' id='delete-'"+(i-1)+"><i class='fa fa-minus'></i></a></td>"
                        + "</tr>");
    }

    $("tr[id=\'" + (_len) + "\']")
            .replaceWith("<tr id=" + (_len - 1) + " align='center'>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderColor'  id='detail-"+ (_len - 1) +"-color' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderXS' id='detail-"+ (_len - 1) +"-xs' value='0' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderS' id='detail-"+ (_len - 1) +"-s' value='0' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderM' id='detail-"+ (_len - 1) +"-m' value='0' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderL' id='detail-"+ (_len - 1) +"-l' value='0' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderXL' id='detail-"+ (_len - 1) +"-xl' value='0' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderXXL' id='detail-"+ (_len - 1) +"-xxl' value='0' style='width:100px'></td>"
                    + "<td><input type='text' name='details_add["+ (_len - 1) +"].orderTotal' id='detail-"+ (_len - 1) +"-sum' value='0' disabled style='width:100px'></td>"
                    + "<td><a class='btn btn-success' onclick='addDetail()' id='add'><i class='fa fa-plus'></i></a></td>"
                    + "</tr>");

};

function addMaterialDetail(){
	var _len = $("#tab-materaildetail tr").length-2;

    //禁用输入
    $("#detail-"+_len+"-1").attr("readonly","readonly");
    $("#detail-"+_len+"-2").attr("readonly","readonly");
    
    $("#detail-"+_len+"-6").attr("readonly","readonly");
    $("#detail-"+_len+"-7").attr("readonly","readonly");

    $('#addtr i').removeClass().addClass("fa fa-minus");
    $('#addtr').attr('onclick',"deldetailtr("+_len+")");
    $('#addtr').attr('id','deletetr-'+_len);

    var nlen = _len + 1;
    $("#tab-materaildetail").append("<tr id='new"+nlen+"' align='center'>"
            +"<td><select name='materialdetails_add["+nlen+"].materialName'  style='width:250px' id='detail-"+ nlen +"-1'><s:iterator value='supplyList' var='supply'><option><s:property value='#supply.material.materialName'/>/<s:property value='#supply.material.materialType'/>/<s:property value='#supply.material.colorCode'/>/<s:property value='#supply.vendor.vendorName'/></option></s:iterator></select></td>"
            +"<td><input type='text' name='materialdetails_add["+ nlen +"].orderMaterialAttr' id='detail-"+ nlen +"-2'  style='width:100px'></td>"
   
            +"<td><input type='text' name='materialdetails_add["+ nlen +"].orderVol' id='detail-"+ nlen +"-6' value='0' style='width:100px'></td>"
            +"<td><input type='text' name='materialdetails_add["+ nlen +"].orderComment' id='detail-"+ nlen +"-7' value='' style='width:100px'></td>"
           
            +"<td><a class='btn btn-success' id='addtr' onclick='addMaterialDetail()'><i class='fa fa-plus'></i></a></td>"
            +"</tr>");
};
function deldetailtr(index){
	var _len = $("#tab-materaildetail tr").length - 2;

    $("tr[id='new" + index + "']").remove();//删除当前行
    var next1,next2,next6,next7;
    for (var i = index + 1, j = _len ; i < j; i++) {
        next1 = $("#detail-" + i +"-1").val();
        next2 = $("#detail-" + i +"-2").val();
        
        next6 = $("#detail-" + i +"-6").val();
        next7 = $("#detail-" + i +"-7").val();
      
        $("tr[id='new" + i + "']")
                .replaceWith("<tr id='new" + (i - 1) + "' align='center'>"
                        + "<td><select name='materialdetails_add["+(i - 1)+"].materialName' readonly style='width:250px' id='detail-"+ (i - 1) +"-1' value='" + next1 + "'><s:iterator value='supplyList' var='supply'><option><s:property value='#supply.material.materialName'/>/<s:property value='#supply.material.materialType'/>/<s:property value='#supply.material.colorCode'/>/<s:property value='#supply.vendor.vendorName'/></option></s:iterator></select></td>"
                        + "<td><input type='text' name='materialdetails_add["+ (i - 1) +"].orderMaterialAttr' id='detail-"+ (i - 1) +"-2' value='" + next2 + "' readonly style='width:100px'> </td>"
                       
                        + "<td><input type='text' name='materialdetails_add["+ (i - 1) +"].orderVol' id='detail-"+ (i - 1) +"-6' value='" + next6 + "' readonly style='width:100px'></td>"
                        + "<td><input type='text' name='materialdetails_add["+ (i - 1) +"].orderComment' id='detail-"+ (i - 1) +"-7' value='" + next7 + "' readonly style='width:100px'></td>"
                        
                        + "<td><a class='btn btn-success' onclick=\'deldetailtr(" + (i - 1) + ")\' id='deletetr-'"+(i-1)+"><i class='fa fa-minus'></i></a></td>"
                        + "</tr>");
    }

    $("tr[id='new" +(_len) + "']")
            .replaceWith("<tr id=new" + (_len - 1) + " align='center'>"
            	      +"<td><select name='materialdetails_add["+(_len - 1)+"].materialName'  style='width:250px' id='detail-"+ (_len - 1) +"-1'><s:iterator value='supplyList' var='supply'><option><s:property value='#supply.material.materialName'/>/<s:property value='#supply.material.materialType'/>/<s:property value='#supply.material.colorCode'/>/<s:property value='#supply.vendor.vendorName'/></option></s:iterator></select></td>"                    
            	      +"<td><input type='text' name='materialdetails_add["+ (_len - 1) +"].orderMaterialAttr' id='detail-"+ (_len - 1) +"-2'  style='width:100px'></td>"
            	      
                     +"<td><input type='text' name='materialdetails_add["+ (_len - 1) +"].orderVol' id='detail-"+ (_len - 1) +"-6' value='0' style='width:100px'></td>"
                     +"<td><input type='text' name='materialdetails_add["+ (_len - 1) +"].orderComment' id='detail-"+ (_len - 1) +"-7' value='' style='width:100px'></td>"
                    
                     +"<td><a class='btn btn-success' id='addtr' onclick='addMaterialDetail()'><i class='fa fa-plus'></i></a></td>"
                     +"</tr>");
};

function submitorder(){
	 
};
</script>
</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	<script type="text/javascript">
		formValidate();
		function formValidate() {
			// 在键盘按下并释放及提交后验证提交表单
			$("#addForm").validate({
				"rules" : {
					"customerBrandName" : {
						'required' : true,
					},
					"orderPriority" : {
						'required' : true,
					},
					"orderType" : {
						'required' : true,
					},
					"orderProcessType" : {
						'required' : true,
					},
					"orderFinishDate" : {
						'required' : true,
					},
					"orderRefURL" : {
						'required' : true,
					},
					"details_add[0].orderColor" : {
						'required' : true,
					},
					"orderSampleYardage" : {
						'required' : true,
					},
					"orderSewnInLabelReq" : {
						'required' : true,
					},
					"orderTechReq" : {
						'required' : true,
					},
					"Comment" : {
						'required' : true,
					}
				}
			});
		}
	</script>
</body>
</html>