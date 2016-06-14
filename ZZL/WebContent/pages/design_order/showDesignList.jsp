<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8 ">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>
 
    <style type="text/css">
   
        .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.input-group,.form-group{position: relative;float: left;width: 15%;}
.form-control{float: left;width: 100%;}
label {color: #555555;font-size: 12px; margin-left: 10px;}
.table-responsive{margin-top: 10px;}
.table{border-top: 3px solid #7D9EC0;}
th{font-size: 12px;color: #4F4F4F;text-align: center;}
td{text-align: center;font-size:14px;}
tr{background-color:transpare}
.item-name{color:#0000ff;}
.qcCode{color:#008080;}
.commdity-graph{width: 60px;height: 80px;}
#search{position: relative;float: left;width: 8%;height:34px;margin-left: 15px;margin-top: 23px;}
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
                    <small>款式列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">款式与订单</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            <!-- 查询与按钮  -->
                        
			
						<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					
                     <br/>
					<!-- 查询与按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-12">
							<!-- form start -->
							<form action="<%=request.getContextPath()%>/Design_Order/showDesignList" method="post">
								 <div class="input-group">
				                                <label for="name">款号</label> <input id="designCode" name="designCode"
					                            type="text" class="form-control form-input" placeholder="款号"
					                            maxlength="20">
			                                    </div>
			                                    <div class="input-group">
				                                <label for="name">名称</label> <input id="designName" name="designName"
					                            type="text" class="form-control form-input" placeholder="名称"
					                            maxlength="20">
			                                    </div>
                                                <div class="input-group">
				                                <label for="name">上架时间</label> <input id="putawayDate" name="putawayDate"
					                            type="text" class="form-control form-input" placeholder=""
					                            maxlength="20">
			                                    </div>
									
									<button type="submit"  id="search"
				                                class="btn btn-primary">查询</button>
								
							</form>
						</div>

					
					</div>
                    <br/>
					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<table class="table table-striped">
								<tr>
									
									<th>图片</th>
									<th>款号</th>
									<th>名称</th>
									<th>上架时间</th>
									<th>工序</th>
									
									<s:iterator value="#session.authorityList" id="low">
                                    <s:if test="#low.highAuthName=='款式与订单'&&#low.middleAuthName=='新建订单'&&#low.lowAuthName=='根据款式新建订单'">
                                    <th>操作</th>
                                    </s:if>
                                    </s:iterator>
								</tr>
								<s:iterator value="PageBean.list" var="bomItem">
									<tr>
										<!-- <td style=" vertical-align:middle;">
												<input type="radio" name="select">
												<input type="hidden" name="selectedCode" value="#bomItem.designCode">
												</td>	
											<td> -->
										<!-- <td><img src="../#bomItem.designPicURL" class="commdity-graph"></td> -->
										<td><img src="../images/1.png" class="commdity-graph"></td>
										<td><s:property value="#bomItem.designCode" /></td>
										<td><s:property value="#bomItem.designName" /></td>
										<td><s:property value="#bomItem.designPutawayDate" /></td> 
									
										<td><s:property value="#bomItem.designTechProcedure" /></td>
										<s:iterator value="#session.authorityList" id="low">
                                        <s:if test="#low.highAuthName=='款式与订单'&&#low.middleAuthName=='新建订单'&&#low.lowAuthName=='根据款式新建订单'">
                                        <td><span class="qcCode"><a href="<%=request.getContextPath() %>/Design_Order/newOrder?designID=<s:property value='#bomItem.designID'/>" style="color:#008080;">新建订单</a></span></td>
                                        </s:if>
                                        </s:iterator>
									 	
									</tr>
								</s:iterator>
							
							</table>
							<!-- /.table -->
							<jsp:include page="../../page.jsp">
							<jsp:param name="action" value="showDesignList" />
						    </jsp:include>
						</div>
						<!-- /.table-responsive -->
						<!-- 分页 -->
					</div>

					<!-- /.table-row -->
				</div>
				<!-- /.box-->
			</div>
		</div>
            </section>
        </aside>
    </div>
    
 <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>	
<script type="text/javascript">
window.onload = changeTab("12000","12001");
$('#putawayDate').datetimepicker({
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
</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>