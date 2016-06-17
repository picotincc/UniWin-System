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

        th {
            text-align: center;
        }

        td {
            text-align: center;
        }
    </style>

    <title>智造链-系统管理-组织管理</title>
    
    
    
</head>

<body class="skin-blue">
    <!-- header logo: style can be found in header.less -->
    
    <s:if test="#request.session.account!=null">
     <!-- 人物头像 -->
	 <jsp:include page="../../headSculpture.jsp"></jsp:include>
	 <!-- 人物头像 -->

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <s:iterator value="#session.authorityList" id="low">
		<s:if test="#low.highAuthName=='系统管理'&&#low.middleAuthName=='组织管理'&&#low.lowAuthName=='组织管理查询'">
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          系统管理
                    <small>组织管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                    <form role="form" name="f" method="post" action="">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">组织部门管理</h3>
                            </div><!-- /.box-header -->
                            
                            <!-- 新增与收货按钮  -->
                            <div class="row">
                                <div class="col-md-8">

                                </div>

                                <div class="col-md-2">

                                </div>
                                
                                <!-- 新增与收货按钮  -->
                                <div class="col-md-2">
                                    <div class="row">
                                         <button type="submit" class="btn btn-warning"
									style="margin: 5px 5px 5px 75px" data-toggle="modal" data-target="#addDepartment">新增</button>
                                    </div>
                                    <div class="row">
                                        <button type="submit" class="btn btn-primary" style="margin: 5px 5px 15px 75px" onclick="update()">修改</button>
                                    </div>
                                </div>

                            </div>
                                                        
                            <!-- 表格  -->
                            <div class="row">
                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
                                    <table class="table table-striped">
                                        <tr>
                                            <th></th>
                                            <th>名称</th>
                                            <th>组织编号</th>
                                            <th>英文名称</th>
                                            <th>简称</th>
                                            <th>电话</th>
                                            <th>简要描述</th>
                                        </tr>                                       
                                        <s:iterator value="PageBean.list" var="departmentItem">
										<tr>
										    <td><input type="radio" id="select" name="select" value='<s:property value="#departmentItem.departmentID" />' /></td>						    
											<td><s:property value="#departmentItem.departmentFullName" /></td>
											<td><s:property value="#departmentItem.departmentID" /></td>
											<td><s:property value="#departmentItem.departmentEnName" /></td>
											<td><s:property value="#departmentItem.departmentAbbrName" /></td>
											<td><s:property value="#departmentItem.departmentPhone" /></td>
											<td><s:property value="#departmentItem.departmentDescription" /></td>
										</tr>
										</s:iterator>
                                        
                                    </table><!-- /.table -->
                                </div><!-- /.table-responsive -->
                            </div><!-- /.table-row -->
                            <jsp:include page="../../page.jsp">
                            <jsp:param name="action" value="departmentList" />
						    </jsp:include>
                        </div><!-- /.box-->
                        </form>
                        
                        
                        
                        
                        
                    </div>
                </div>           
            </section>
        </aside>
        </s:if>
    	</s:iterator>
    </div>

		<!-- 模态框（Modal） -->
	<div class="modal fade" id="addDepartment" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">新增部门</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/System/addDepartment" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>部门全称<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="departmentFullName"></td>
									<td>英文名称<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="departmentEnName"></td>
								</tr>
								<tr>
									<td>电话<span style="color: red">*</span>：
									</td>
									<td><input type="text" name="departmentPhone"></td>
									<td>部门编码<span style="color: red">*</span>：
									</td>
									<td><input type="text" readonly="readonly" name="departmentID"></td>
								</tr>
								<tr>
									<td>简要描述<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 95%" name="departmentDescription"></td>
									<td>简称<span style="color: red">*</span>：
									</td>
									<td><input type="text" style="width: 50%" name="departmentAbbrName"></td>
									<td><button type="submit" class="btn btn-primary">
											保存</button></td>
								</tr>

							</table>
							<!-- /.table -->
						</form>
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

	<script language="javascript">
    	function update(){
    		if(document.getElementById("select").checked){
    			f.action="<%=request.getContextPath()%>/System/chooseDepartment";
        		document.f.submit();
    		}
    		else{
    			alert("请选择部门之后再进行修改！");
    		}
    	}
    </script>
    <script language="text/javascript">
		window.onload = changeTab("11500","11505");
    </script>
    
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>