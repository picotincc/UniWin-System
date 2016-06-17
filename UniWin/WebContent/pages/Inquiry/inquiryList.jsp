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
<link href="<%=request.getContextPath()%>/css/inquiry.css"
	rel="stylesheet" type="text/css" />
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
	<!-- <header class="header"> <a href="index.html" class="logo">
		Add the class icon to your logo image or logo icon to add the margining
		智&nbsp造&nbsp链
	</a> Header Navbar: style can be found in header.less <nav
		class="navbar navbar-static-top" role="navigation"> </nav> </header> -->
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
			询价单管理 <small>询价单列表</small>
		</h1>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">询价单管理</h3>
					</div>
					<!-- /.box-header -->

					<!-- 查询与按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form role="form" method="post"
								action="<%=request.getContextPath()%>/Inquiries/showSearchedInquiries">
								<div class="row">

									<div class="col-md-5">
										<div class="box-body">
											<label>询价单号</label> <input type="text" class="form-control" id="inquiryCode"
												name="inquiryCode" value=${inquiryCode} >
										</div>

									</div>
									<div class="col-md-5">
										<div class="box-body">
											<label>未报价环节</label> <select class="form-control" id="not_priced"
												name="not_priced"  >
												<option >请选择</option>
												<option>无</option>
												<option <s:if test="not_priced=='面料OK'">selected</s:if> <s:else></s:else>>面料OK </option>
												<option <s:if test="not_priced=='辅料OK'">selected</s:if> <s:else></s:else>>辅料OK</option>
												<option <s:if test="not_priced=='花型OK'">selected</s:if> <s:else></s:else>>花型OK</option>
												<option <s:if test="not_priced=='版型OK'">selected</s:if> <s:else></s:else>>版型OK</option>
												<option <s:if test="not_priced=='加工OK'">selected</s:if> <s:else></s:else>>加工OK</option>
											</select>
										</div>
									</div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-primary"
											style="margin-top: 34px">查询</button>
									</div>

								</div>
							</form>
						</div>

						<div class="col-md-2"></div>
					</div>
					<br />
					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<a style="color: #AAAAAA;">共<s:property
									value="PageBean.allRow" />条客户订单
							</a>
							<table class="table table-striped">
								<tr>
									<th>图片</th>
									<th>询单编号</th>
									<th>客户</th>
									<th>部门报价</th>
									<th>进度</th>
								</tr>
								<s:iterator value="PageBean.list" var="inquiryItem">
									<tr>
										<!--  <td><input type="radio" name="select"></td>	-->
										<!--<td><s:property value="#designItem.designPicURL" /></td>-->
										<td><img src="../images/1.png" class="commdity-graph"></td>
										<td>
										<a href="<%=request.getContextPath() %>/Inquiries/specific_inquiry?inquiryID=<s:property value='#inquiryItem.inquiryID'/>" style="color:#7EC0EE;">
										<s:property value="#inquiryItem.inquiryCode" /></a>
										<br />
	                           			<a style="color:#6C7B8B;"><s:property value="#inquiryItem.inquiryProgressDate"/></a>
										</td>
										<td><s:property
												value="#inquiryItem.order.customer.customerContactName" /></td>
										<td>
										<s:if test="#inquiryItem.inquiryProgress=='面料OK'">
											<img src="../images/bpoint.png" class="tinySiteIcon">
										</s:if>
										<s:if test="#inquiryItem.inquiryProgress=='辅料OK'">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
										</s:if>
										<s:if test="#inquiryItem.inquiryProgress=='花型OK'">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
										</s:if>
										<s:if test="#inquiryItem.inquiryProgress=='版型OK'">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
										</s:if>
										<s:if test="#inquiryItem.inquiryProgress=='加工OK'">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
											<img src="../images/bpoint.png" class="tinySiteIcon">
										</s:if>
										</td>
										<td>
										<s:if test="#inquiryItem.processOKTime!=null"><a style="color:#71C671;">已确认报价</a></s:if>
										<s:else><a style="color:#6C7B8B;">进行中</a></s:else>
										</td>
									</tr>
								</s:iterator>


							</table>
							<!-- /.table -->
						</div>
						<!-- /.table-responsive -->
						
					</div>
					<!-- /.table-row -->
					<jsp:include page="../../page.jsp">
						<jsp:param name="action" value="inquiryList" />
					</jsp:include>
				</div>
				<!-- /.box-->
			</div>
		</div>
		</section> </aside>
	</div>
       <script type="text/javascript">
        	window.onload = changeTab("11100","11101");
    	</script>
    	</s:if>
    	
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>