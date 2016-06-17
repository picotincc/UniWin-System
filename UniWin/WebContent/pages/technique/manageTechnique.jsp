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
<link href="<%=request.getContextPath()%>/css/technique.css"
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
			工艺管理 <small>工艺单管理</small>
		</h1>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">工艺单管理</h3>
					</div>
					<!-- /.box-header -->

					<!-- 查询与按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form role="form" method="post"
								action="<%=request.getContextPath()%>/Technique/showSearchedDesigns">
								<div class="row">

									<div class="col-md-5">
										<div class="box-body">
											<label>款号</label> <input type="text" class="form-control"
												id="designCode" name="designCode" value=${designCode} >
										</div>

									</div>
									<div class="col-md-5">
										<div class="box-body">
											<label>上架日期</label> <input type="text"
												class="form-control form-input date" id="putawayDate" placeholder="yyyy-mm-dd" name="putawayDate"
												value="${putawayDate}"> 
										</div>
									</div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-primary"
											style="margin-top: 34px">查询</button>
									</div>

								</div>
							</form>
						</div>

					</div>

					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<a style="color: #AAAAAA;">共<s:property
									value="PageBean.allRow" />条客户订单
							</a>
							<table class="table table-striped">
								<tr>
									<th>图片</th>
									<th>款号</th>
									<th>款名</th>
									<th>上架日期</th>
									<th>工艺单</th>
								</tr>
								<s:iterator value="PageBean.list" var="designItem">
									<tr>
										<!--  <td><input type="radio" name="select"></td>	-->
										<!--<td><s:property value="#designItem.designPicURL" /></td>-->
										<td><img src="../images/1.png" class="commdity-graph"></td>
										<td><s:property value="#designItem.designCode" /></td>
										<td><s:property value="#designItem.designName" /></td>
										<td><s:property value="#designItem.designPutawayDate" /></td>
										<td><s:property value="#designItem.designComment" /></td>
									</tr>
								</s:iterator>

							</table>
							<!-- /.table -->
						</div>
						<!-- /.table-responsive -->
					</div>
					<!-- /.table-row -->
					<jsp:include page="../../page.jsp">
						<jsp:param name="action" value="designList" />
					</jsp:include>
				</div>
				<!-- /.box-->
			</div>
		</div>
		</section> </aside>
	</div>
	       <script type="text/javascript">
        	window.onload = changeTab("10600","10602");
    	</script>
	<script type="text/javascript">
		$('#putawayDate').datetimepicker({
			language : 'zh-CN',
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