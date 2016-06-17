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
th {
	text-align: center;
}

td {
	text-align: center;
}
.commdity-graph{width: 60px;height: 80px;}
</style>

<title>联胜供应链管理系统</title>
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
			物料管理 <small>BOM管理</small>
		</h1>
		</section> <!-- Main content --> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">BOM管理</h3>
					</div>
					<!-- /.box-header -->

					<!-- 查询与按钮  -->
					<div class="row">
						<!-- 查询   -->
						<div class="col-md-8">
							<!-- form start -->
							<form action="<%=request.getContextPath()%>/Bom/showDesignList" method="post">
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
												value=${putawayDate}> 
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

						<!-- 详情与作废按钮  -->
						<div class="col-md-2">
							<div class="row">
								<button type="submit" class="btn btn-warning"
									style="margin: 5px 5px 5px 75px" onclick="getBom()">详情</button>
							</div>
							<div class="row">
								<button type="submit" class="btn btn-danger"
									style="margin: 5px 5px 15px 75px" onclick="quitDesign()">作废</button>
							</div>
						</div>

					</div>

					<!-- 表格  -->
					<div class="row">
						<div class="table-responsive" style="margin: 0px 50px 50px 23px">
							<table class="table table-striped">
								<tr>
									<th></th>
									<th>图片</th>
									<th>款号</th>
									<th>名称</th>
									<th>上架时间</th>
									<th>工序</th>
								</tr>
								<s:iterator value="PageBean.list" var="bomItem">
									<tr>
										<td>
											<input type="radio" name="select">
											<input type="hidden" name="selectedID" value=${bomItem.designID}>
										</td>
										<td><img src="../upload/${bomItem.designPicURL}" class="commdity-graph"></td>
										<td><s:property value="#bomItem.designCode" /></td>
										<td><s:property value="#bomItem.designName" /></td>
										<td><s:property value="#bomItem.designPutawayDate" /></td>
										<td><s:property value="#bomItem.designTechProcedure" /></td>
									</tr>
								</s:iterator>
							
							</table>
							<!-- /.table -->
						</div>
						<!-- /.table-responsive -->
						<!-- 分页 -->
					</div>

					<!-- /.table-row -->
					<jsp:include page="../../page.jsp">
					<jsp:param name="action" value="showDesignList" />
					</jsp:include>
				</div>
				<!-- /.box-->
			</div>
		</div>
		</section> </aside>
	</div>

	<script type="text/javascript">
		window.onload = changeTab("10000","10008");
		
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

		function getBom(){
        	var selectedID = $(".checked + input[name='selectedID']").val();
        	if(selectedID != null){        			
        		location.href= getRootPath() + "/Bom/getBom?designId="+selectedID;     	       		         
        	}else{
        		alert("请选择");
        	}
        }

        function quitDesign(){
        	var selectedID = $(".checked + input[name='selectedID']").val();
        	if(selectedID != null){        			
        		location.href= getRootPath() + "/Bom/quitDesign?designId="+selectedID;    	       		         
        	}else{
        		alert("请选择");
        	}
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