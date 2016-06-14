<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<jsp:include page="../../header.jsp"></jsp:include>

<style type="text/css">
.out-info {
	text-align: right;
	padding: 15px;
}

th {
	text-align: center;
}

td>input {
	width: 108px;
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
		<aside class="right-side"> <!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			加工管理 <small>外发单管理</small>
		</h1>
		</section> <!-- Main content --> 
		<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<div class="box box-primary">
					<form
						action="<%=request.getContextPath()%>/Process/modifyOutSource"
						method="post">
						<div class="box-header">
							<h3 class="box-title">修改外发单</h3>
						</div>
						<!-- /.box-header -->
						<div class="row">
							<div class="col-md-10">
								<div class="box-body">
									<table style="padding: 15px; margin: 20px">
										<tr>
										    
											<td class="out-info">外发单号：</td>
											<td><input type="hidden" name="os_outsourceID" value=${getOS.outsourceID} ><input type="text" name="os_code"
												value=${getOS.osCode} readonly></td>
											<td class="out-info">生产单号：</td>
											<td><input type="text" name="os_productionID"
												value=${getOS.productionID} ></td>
										</tr>
										<tr>
											<td class="out-info">款号：</td>
											<td><input type="text" name="os_designCode"
												value=${getOS.designCode} ></td>
											<td class="out-info">款式名称：</td>
											<td><input type="text" name="os_designName"
												value=${getOS.designName} ></td>
										</tr>
										<tr>
											<td class="out-info">约定完成日期：</td>
											<td><input type="text" class="date-picker"
												name="os_finishDate" value=${getOS.finishDate} ></td>
											<td class="out-info">排单时间：</td>
											<td><input type="text" class="date-picker"
												name="os_scheduleDate" value=${getOS.osScheduleDate} ></td>
										</tr>
										<tr>
											<td class="out-info">订单状态：</td>
											<td><select name="os_State" value=${getOS.osState} >
													<option value="待收货">待收货</option>
													<option value="部分收货">部分收货</option>
													<option value="已完结">已完结</option>
											</select></td>
											<td class="out-info">订单优先级：</td>
											<td><input type="text" name="os_Priority"
												value=${getOS.osPriority} readonly></td>
										</tr>
									</table>
								</div>


							</div>

						</div>

						<div class="row">
							<div class="col-md-2">
								<span size="3px" style="margin: 0px 10px 20px 20px; color: blue">外发信息>></span>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive"
									style="margin: 10px 15px 20px 23px">
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


										<s:iterator value="getDetails" var="item" status="st">
											<tr id=${st.index} >
												<td><input type="text"
													name="details_modify[${st.index}].outsourceColor"
													id="detail-${st.index}-color" value=${item.outsourceColor} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceXS"
													id="detail-${st.index}-xs" value=${item.outsourceXS} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceS"
													id="detail-${st.index}-s" value=${item.outsourceS} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceM"
													id="detail-${st.index}-m" value=${item.outsourceM} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceL"
													id="detail-${st.index}-l" value=${item.outsourceL} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceXL"
													id="detail-${st.index}-xl" value=${item.outsourceXL} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceXXL"
													id="detail-${st.index}-xxl" value=${item.outsourceXXL} readonly></td>
												<td><input type="text"
													name="details_modify[${st.index}].outsourceTotal"
													id="detail-${st.index}-sum" value=${item.outsourceTotal} readonly></td>
												<td>
													<button class="btn btn-success" id="delete-${st.index}"
														onclick="deltr(${st.index})">
														<i class="fa fa-minus"></i>
													</button>
												</td>
											</tr>
										</s:iterator>
										<tr id=${detailSize}>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceColor"
												id="detail-${detailSize}-color"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceXS"
												id="detail-${detailSize}-xs" value="0"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceS"
												id="detail-${detailSize}-s" value="0"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceM"
												id="detail-${detailSize}-m" value="0"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceL"
												id="detail-${detailSize}-l" value="0"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceXL"
												id="detail-${detailSize}-xl" value="0"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceXXL"
												id="detail-${detailSize}-xxl" value="0"></td>
											<td><input type="text"
												name="details_modify[${detailSize}].outsourceToTal"
												id="detail-${detailSize}-sum" value="0" readonly></td>
											<td><a class="btn btn-success" id="add"
												onclick="addDetail()"> <i class="fa fa-plus"></i>
											</a></td>
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
									<table style="padding: 10px; margin: 10px">
										<tr>
											<td class="out-info">实际工价：</td>
											<td><input type="text" name="os_labourCost"
												value=${getOS.labourCost} ></td>
											<td class="out-info">加工方：</td>
											<td><input type="text" name="os_processorCode"
												value=${getOS.processorCode} ></td>
											<td class="out-info">实际外发时间：</td>
											<td><input type="text" class="date-picker"
												name="os_actualOutDate" value=${getOS.actualOutDate} ></td>
										</tr>
										<tr>
											<td class="out-info">实际数量：</td>
											<td><input type="text" name="os_Sum" value=${getOS.sum
												} disabled></td>
											<td class="out-info">联系电话：</td>
											<td><input type="text" name="os_processorMobile"
												value=${getOS.processorMobile} disabled></td>
											<td class="out-info">外发负责人：</td>
											<td><input type="text" name="os_userName"
												value=${getOS.userName} ></td>
										</tr>

										<tr>
											<td>
												<button type="submit" class="btn btn-primary">保存</button>
											</td>
										</tr>

									</table>
								</div>


							</div>
					
				</div>
				</form>
			</div>
			<!-- /.box-->
		</div>
	</div>
	</section>
	</aside>
	</div>
	<script type="text/javascript">
        window.onload = changeTab("10300","10304");
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

	<script>

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
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceColor' id='detail-"+ nlen +"-color' ></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceXS' id='detail-"+ nlen +"-xs' value='0'></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceS' id='detail-"+ nlen +"-s' value='0'></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceM' id='detail-"+ nlen +"-m' value='0'></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceL' id='detail-"+ nlen +"-l' value='0'></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceXL' id='detail-"+ nlen +"-xl' value='0'></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceXXL' id='detail-"+ nlen +"-xxl' value='0'></td>"
                +"<td><input type='text' name='details_modify["+ nlen +"].outsourceTotal' id='detail-"+ nlen +"-sum'value='0' readonly></td>"
                +"<td><a class='btn btn-success' id='add' onclick='addDetail()'><i class='fa fa-plus'></i></a></td>"
                +"</tr>");
    }

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
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceColor' value='" + nextColor + "' id='detail-"+ (i - 1) +"-color' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceXS' id='detail-"+ (i - 1) +"-xs' value='" + nextXS + "' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceS' id='detail-"+ (i - 1) +"-s' value='" + nextS + "' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceM' id='detail-"+ (i - 1) +"-m' value='" + nextM + "' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceL' id='detail-"+ (i - 1) +"-l' value='" + nextL + "' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceXL' id='detail-"+ (i - 1) +"-xl' value='" + nextXL + "' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceXXL' id='detail-"+ (i - 1) +"-xxl' value='" + nextXXL + "' readonly></td>"
                            + "<td><input type='text' name='details_modify["+ (i - 1) +"].outsourceTotal' id='detail-"+ (i - 1) +"-sum' value='" + nextSUM + "' readonly></td>"
                            + "<td><a class='btn btn-success' onclick=\'deltr(" + (i - 1) + ")\' id='delete-'"+(i-1)+"><i class='fa fa-minus'></i></a></td>"
                            + "</tr>");
        }

        $("tr[id=\'" + (_len) + "\']")
                .replaceWith("<tr id=" + (_len - 1) + " align='center'>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceColor'  id='detail-"+ (_len - 1) +"-color'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceXS' id='detail-"+ (_len - 1) +"-xs' value='0'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceS' id='detail-"+ (_len - 1) +"-s' value='0'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceM' id='detail-"+ (_len - 1) +"-m' value='0'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceL' id='detail-"+ (_len - 1) +"-l' value='0'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceXL' id='detail-"+ (_len - 1) +"-xl' value='0'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceXXL' id='detail-"+ (_len - 1) +"-xxl' value='0'></td>"
                        + "<td><input type='text' name='details_modify["+ (_len - 1) +"].outsourceTotal' id='detail-"+ (_len - 1) +"-sum' value='0' readonly></td>"
                        + "<td><a class='btn btn-success' onclick='addDetail()' id='add'><i class='fa fa-plus'></i></a></td>"
                        + "</tr>");

    }
</script>
		</s:if>
		<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
		</s:else>

</body>
</html>