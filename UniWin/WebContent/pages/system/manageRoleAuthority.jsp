<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <jsp:include page="../../header.jsp"></jsp:include>
    <link href="../css/smartMenu.css" rel="stylesheet" type="text/css" media="screen">
    
    <style type="text/css">

        th {
            text-align: center;
        }

        td {
            text-align: center;
        }
        
        .jstree-node.jstree-leaf .jstree-icon.jstree-themeicon {
            background-position: -102px -70px;
		    background-repeat: no-repeat;
        }
        
        .vakata-context { 
		     z-index:999 !important; 
		} 
    </style>
    <title>智造链-系统管理-权限设置</title>
    
</head>

<body class="skin-blue">
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
                    <small>权限设置</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">  
            	<div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">权限设置</h3>
                            </div><!-- /.box-header -->
                            
                            <div class="row">
                                <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-7">
                                            	<button class="btn btn-primary" style="margin: 5px 5px 15px 20px" onclick="saveRoleAuthority()">保存权限分配</button>          	
                                                <button type="submit" class="btn btn-warning"
													style="margin: 5px 5px 15px 5px" data-toggle="modal" data-target="#addRole">新增角色</button>
                                            </div>
                                        </div>
                                </div>

                                <div class="col-md-2">

                                </div>
                            </div>
                            
                            
                            
                            <div class="row">
                                <div class="col-md-7">
                                	<div class="box-header">
                                	
                                	    <div class="row">
                                            <div class="col-md-2">
                                                <h3 class="box-title" style="color:blue;">角色>></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <input type="text" class="form-control" readonly="readonly" id="roleID" name="roleID" value="${selectedRoleId}">
                                            </div>
                                        </div>
                               
                            		</div><!-- /.box-header -->
	                                <div class="table-responsive" style="margin: 0px 50px 50px 23px">
	                                    <table class="table table-striped" id="userTable">
	                                        <tr>
	                                        	<th></th>
	                                            <th>角色名称</th>
	                                            <th>角色描述</th>
	                                            <th>操作</th>
	                                        </tr>
	                                        <tbody>                                      
	                                        <s:iterator value="PageBean.list" var="roleItem">
											<tr onclick="javascript:judgeSelected(this);roleAuthority(<s:property value='#roleItem.roleID' />)">
												<td style="vertical-align:middle;"><input type="radio" name="select"></td>
												<td><s:property value="#roleItem.roleName" /></td>
												<td><s:property value="#roleItem.roleDescription" /></td>
												<td><a style="text-decoration:underline" onclick="javascript:getRole(<s:property value='#roleItem.roleID' />,'<s:property value="#roleItem.roleName"/>','<s:property value='#roleItem.roleDescription'/>')" data-toggle="modal" data-target="#updateRole">修改</a></td>
											</tr>
											</s:iterator>
	                                        </tbody> 
	                                    </table><!-- /.table -->
	                                </div><!-- /.table-responsive -->
	                                <jsp:include page="../../page.jsp">
                            		<jsp:param name="action" value="roleList" />
						    		</jsp:include>
                                </div>
                                
                                
                                
                                <div class="col-md-5">
                                	<div class="box-header">
                                		<h3 class="box-title" style="color:blue;">权限>></h3>
                            		</div><!-- /.box-header -->
		                            <div id="tree-container" style="margin: 0px 50px 50px 23px">
		                            
		                            
	                                </div><!-- /.table-responsive -->
                                </div>

                            </div>
                            
                            
                                                        
                        </div><!-- /.box-->
                        
                    </div>
                </div>           
            </section>
        </aside>
        </s:if>
    	</s:iterator>
    </div>
    
    <!-- 新增模态框（Modal） -->
	<div class="modal fade" id="addRole" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">新增角色</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/System/addRole" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>角色名称<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 95%" name="newRoleName"></td>
									<td>角色描述<span style="color: red">*</span>：
									</td>
									<td><input type="text" style="width: 50%" name="newRoleDescription"></td>
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
	
	
	<!-- 修改模态框（Modal） -->
	<div class="modal fade" id="updateRole" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 300px; width: 820px">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00c0ef">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="color: white">修改角色</h4>
				</div>
				<div class="modal-body">
					<div class="table" style="margin-top: 10px;">
						<!-- .table - Uses sparkline charts-->
						<form action="<%=request.getContextPath()%>/System/updateRole" method="post">
							<table class="table" rules="none" frame="void">
								<tr>
									<td>角色ID<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" readonly="readonly" style="width: 45" id="roleID1" name="roleID1"></td>
									<td>角色名称<span style="color: red">*</span>：
									</td>
									<td colspan="3"><input type="text" style="width: 95%" id="roleName1" name="roleName1"></td>
									<td>角色描述<span style="color: red">*</span>：
									</td>
									<td><input type="text" style="width: 95%" id="roleDescription1" name="roleDescription1"></td>
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
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
    

    
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-smartMenu.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/jstree/3.2.1/jstree.js"></script>
    <script type="text/javascript">
    Myjstree();
    var nodeID = '';
    function Myjstree() {
    	$('#tree-container').jstree({
   		  'core' : {
   			  'data' : {
   				  "url" : "<%=request.getContextPath()%>/System/getAuthorityTree",
   				  "dataType" : "json"
   				  },
   				  "check_callback" : true 
   		  },
   	      "themes": { "theme": "default", "dots": false, "icons": true },
   	  	  "plugins":["themes","search","dnd","state","checkbox","contextmenu"],
   	  	});
    	$('#tree-container').bind("contextmenu.jstree",function(e,data){
    		var obj = $.jstree.menuObj;
    		nodeID = obj.id;
    		var objChange = new Array();
    		objChange = {
			    text: "切换",
			    func: function() {
			    	updateAuthoState();
			    }    
			};
    		var MenuData = [[objChange]];
   			$("#"+nodeID).smartMenu(MenuData);
			
    	});
   	}
    function updateAuthoState(){
    	$.post("<%=request.getContextPath()%>/System/updateAuthorityState", "nodeID="+nodeID, function(data) {
    		$('#tree-container').jstree("refresh");
    	});
    }
    var roleID = -1;
    function roleAuthority(){
    	roleID = arguments[0]?arguments[0]:-1;
		$('#tree-container').jstree("uncheck_all"); 
		$('#tree-container').jstree("close_all"); 
   		$.post("<%=request.getContextPath()%>/System/getRoleAuthorityTree", "roleID="+roleID, function(data) {
   			for(var i in data){
   				//console.log(data[i]);
   				var obj = data[i];
   				var objSecond = obj.children;
   				if(objSecond.length>0){
	   				for(var j in objSecond){
	   					var objThird = objSecond[j].children;
	   					if(objThird.length>0){
	   						for(var k in objThird){
		   						$('#tree-container').jstree("select_node",objThird[k]);
		   		   				$('#tree-container').jstree("check_node",objThird[k]); 
	   						}
	   					}else{
	   						$('#tree-container').jstree("open_node",objSecond[j]);
	   		   				$('#tree-container').jstree("check_node",objSecond[j]); 
	   					}
	   				}
   				}else{
   					$('#tree-container').jstree("open_node",obj);
   	   				$('#tree-container').jstree("check_node",obj); 
   				}
   			}
		});
     }
    
    function saveRoleAuthority(){
    	if (roleID==-1) {
    		alert("请选择角色");
    	}
    	var names="";
    	var nodes=$("#tree-container").jstree("get_bottom_checked");
    	for (var k=0;k<nodes.length;k++) {
    		names += nodes[k]+",";
    	}
   		params = {
   			"names":names,
   			"roleID":roleID
   		}
   		//alert(names);
   		$.post("<%=request.getContextPath()%>/System/saveRoleAuthority", params, function(data) {
			//no operation
			$('#tree-container').jstree("refresh");
   		});
   		
    }
    </script>
    <script type="text/javascript">
    	function getRole(roleID,roleName,roleDescription){
    		$("#roleID1").attr("value",roleID);
    		$("#roleName1").attr("value",roleName);
    		$("#roleDescription1").attr("value",roleDescription);
    	}
    </script>
    <script language="text/javascript">
		window.onload = changeTab("11500","11501");
    </script>

</body>
</html>