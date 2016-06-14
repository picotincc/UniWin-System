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

    <title>智造链-样衣信息</title>
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
                   	样衣信息
                    <small>样衣入库</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
            	<div class="row">
            		<div class="col-md-12">
            			<div class="box box-primary">
            				<div class="box-header">
            					<h3 class="box-title">样衣新增入库</h3>
            				</div>
            				<form class="form-horizontal" role="form" method="post" action="addInSample">
            					<div class="form-group">
	            					<label class="col-md-2 col-md-offset-1 control-label" >款号:</label>
	            					<div class="col-md-3">
	            						<input type="text" class="form-control" name="designID">
	            					</div>
	            					

									<br/><br/><br/>
	            					<label class="col-md-2 col-md-offset-1 control-label">入库位置:</label>
	            					<div class="col-md-3">
	            						<input type="text" class="form-control" name="samplePlace">
	            					</div>
	            					
	            					<label class="col-md-2  control-label">操作:</label>
	            					<label class="col-md-3 control-label" style="text-align:left;color:red;">样衣入库</label>
	            					
	            					<br/><br/><br/>
	            					<label class="col-md-2 col-md-offset-1 control-label" >操作备注:</label>
	            					<div class="col-md-9">
	            						<textarea style="width:100%;" placeholder="备注格式：人名-事由" name="sampleOPComment"></textarea>
	            					</div>
	            					
	            					<br/><br/><br/>
	            					<div class="col-md-2 col-md-offset-1" style="text-align:right;">
	            					
						            <s:iterator value="#session.authorityList" id="low">
										<s:if test="#low.highAuthName=='样衣信息'&&#low.middleAuthName=='样衣入库'&&#low.lowAuthName=='样衣新增查询'">
					                	<button class="btn btn-primary" type="submit">保存</button>
					                	</s:if>
					                </s:iterator>
	            					
	            					</div>
            					</div>
            					
            				</form>
            			</div>
            			
            		</div>
            	</div>
            </section>
        </aside>
    </div>
    
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	
	<script type="text/javascript">
	window.onload = changeTab("10800","10801");
	</script>
</body>
</html>