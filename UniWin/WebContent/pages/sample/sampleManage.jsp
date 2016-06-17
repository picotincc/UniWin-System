<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../../header.jsp"></jsp:include>
<title>智造链-样衣管理</title>

<style type="text/css">
</style>


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
			样衣信息 <small>样衣管理</small>
		</h1>
		</section> 
		
		
		<s:iterator value="#session.authorityList" id="low">
		<s:if test="#low.highAuthName=='样衣信息'&&#low.middleAuthName=='样衣管理'&&#low.lowAuthName=='样衣管理查询'">
		
		<!-- Main content --> 
		<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">样衣资料管理</h3>
					</div>

					<div class="col-md-7">
					<form class="form-horizontal" role="form" method="post" action="<%=request.getContextPath()%>/Sample/searchSamples">
						<div class="form-group">
							<label class="col-md-2 control-label">款号</label>
							<div class="col-md-2">
								<input type="text" class="form-control" name="searchDesignCode">
							</div>
							<label class="col-md-2 control-label">状态</label>
							<div class="col-md-4">
								<select class="form-control" name="searchSampleState">
							         <option>外借</option>
							         <option>在库</option>
							     </select>
							</div>
							

							<br/>
							<br/>
							<label class="col-md-2 control-label">位置</label>
							<div class="col-md-4">
								<input type="text" class="form-control" name="searchSamplePlace">
							</div>
							<div class="col-md-offset-2 col-md-2">
								<button class="btn btn-primary" type="submit" style="float:right">查询</button>
							</div>
						</div>
					</form>
					</div>
					<div class="col-md-5">
						<form class="form-horizontal" role="form" name="f" method="post"  enctype="multipart/form-data"
						action="<%=request.getContextPath()%>/Sample/importSample">
								<div class=" col-md-5">
									<input type="file" required = "required" name="file" id="file" accept=".xls"  />
								</div>
								</br></br>
								<div class="col-md-3">
									<button type="submit" class="btn btn-success" id="import">导入Excel</button>
								</div>
						</form>
						<form method="post" role="form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/Sample/exportSample">
								<div class="col-md-3">
									<button type="submit" class="btn btn-warning" id="export">下载Excel模板</button>
								</div>
						</form>
					</div>
					<div class="row">
						<div class="col-md-12" style="padding: 0px 20px 0px 20px;width:100%">
							<table class="table table-striped table-responsive" style="width:100%">
								<tr style="width:100%">
									<th>位置</th>
									<th>款号</th>
									<th>在/不在</th>
									<th>进出详情</th>
								</tr>
								<s:iterator value="pageBean.list" id="item">
										<tr>
											<td><s:property value="#item[0].samplePlace" /></td>
											<td><s:property value="#item[1]" /></td>
											<td><s:property value="#item[0].sampleState" /></td>
											<td><a style="cursor:pointer" data-toggle='modal' data-target='#detailModel_<s:property value="#item[0].sampleID" />'>查看</a></td>
										</tr>
										
								</s:iterator>
							</table>
						</div>
					</div>
					<div class="row" style="margin-left: 10px">
						<%@include file="../../page.jsp"%>
					</div>
				</div>
			</div>
		</div>
										<s:iterator value="pageBean.list" id="item2">
										<!--模态框（Modal） -->
										<div  class="modal fade"  id="detailModel_<s:property value="#item2[0].sampleID" />" tabindex="-1" role="dialog" 
										    aria-hidden="true">
										   <div class="modal-dialog" style="width:800px;position:absolute;left:300px">
										      <div class="modal-content">
										         <div class="modal-header">
										            <button type="button" class="close" data-dismiss="modal" 
										               aria-hidden="true">×
										            </button>
										            <h4 class="modal-title" >
										              样衣进出详情
										            </h4>
										         </div>
										         <div class="modal-body">
										         	<table class="table table-striped table-responsive" style="width:100%">
														<tr style="width:100%">
															<th>进出时间</th>
															<th>操作</th>
															<th>操作备注</th>
														</tr>
														<s:iterator value="#item2[0].sample_details" id="item3">
																<tr>
																	<td><s:property value="#item3.sampleOPTime" /></td>
																	<td><s:property value="#item3.sampleOPType" /></td>
																	<td><s:property value="#item3.sampleOPComment" /></td>
																</tr>
														</s:iterator>
						
													</table>
										         </div>
										         <div class="modal-footer">
										            <button type="button" class="btn btn-default" 
										               data-dismiss="modal">返回
										            </button>
										         </div>
										      </div>
										   </div>
										</div>
										</s:iterator>
										
		</section> 
		
		
		</s:if>
		</s:iterator>
		</aside>
	</div>
	
	
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	
	
	<script type="text/javascript">
    	//导航栏设置
    	window.onload = changeTab("10800","10802");
    	<%-- $("#import").click(function(){
    		var file=document.getElementById("file");
			file.select();
			var path=document.selection.createRange().text;
			alert(path);
			f.action="<%=request.getContextPath()%>/Sample/importSample";
			document.f.submit();
    	}); --%>
    	
    	<%-- $("#export").click(function(){
    		f.action="<%=request.getContextPath()%>/Sample/exportSample";
     		document.f.submit();
    	}); --%>
    
    </script>
</body>
</html>