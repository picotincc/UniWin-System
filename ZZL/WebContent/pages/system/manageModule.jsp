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
        
        .jstree-node.jstree-leaf .jstree-icon.jstree-themeicon {
            background-position: -102px -70px;
		    background-repeat: no-repeat;
        }
    </style>

    <title>智造链-系统管理-模组资料管理</title>
    <script language="text/javascript">
		window.onload = changeTab("11500","11504");
    </script>
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
		<s:if test="#low.highAuthName=='系统管理'&&#low.middleAuthName=='模组资料'&&#low.lowAuthName=='模组资料查询'">
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          系统管理
                    <small>模组管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-4" id="tree-container">
                    	
                    </div>
                    
                    <div class="col-md-6">
                    
                    <div class="row">
                    	<h3 class="box-title" style="color:blue;">基本资料>></h3>
                    </div>
                    
                    <form role="form" id="module-form">
                    	 <div class="row">
                              <div class="col-md-6">
                                  <div class="box-body">
                                      <label>模组ID</label>
                                      <input type="text" readonly="readonly" class="form-control" id="moduleID" name="moduleID">
                                  </div>
                                  <div class="box-body">
                                      <label>中层模组名称</label>
                                      <input type="text" class="form-control" id="middleModuleName" name="middleModuleName">
                                  </div>
                                  <div class="box-body">
                                      <label>高层模组名称</label>
                                      <input type="text" class="form-control" id="highModuleName" name="highModuleName">
                                  </div>
                                  <div class="box-body">
                                      <label>模组名称</label>
                                      <input type="text" class="form-control" id="lowModuleName" name="lowModuleName">
                                  </div>
                                  <div class="box-body">
                                      <label>程式说明</label>
                                      <input type="text" class="form-control" id="moduleSpecification" name="moduleSpecification">
                                  </div>
                                  <div class="box-body">
                                      <button id="save-btn" type="button" class="btn btn-primary" style="margin-top: 34px">保存</button>
                                  </div>
                              </div>
                              
                              <div class="col-md-6">
                                  <div class="box-body">
                                      <label>排列序号</label>
                                      <input type="text" class="form-control" id="moduleNum" name="moduleNum">
                                  </div>
                                  <div class="box-body">
                                      <label>模组路径</label>
                                      <input type="text" class="form-control" id="moduleRoute" name="moduleRoute">
                                  </div>
                                  <div class="box-body">
                                      <label>模组自编码</label>
                                      <input type="text" class="form-control" id="moduleOwnCode" name="moduleOwnCode">
                                  </div>
                                  <div class="box-body">
                                      <label>是否启用</label>
                                      <select class="form-control" id="moduleEnabled" name="moduleEnabled">
                                      	<option value="true">Yes</option>
                                      	<option value="false">No</option>
                                      </select>
                                  </div>
                              </div>
                         </div>
                         </form>
                    </div>
                </div>           
            </section>
        </aside>
        
        </s:if>
    	</s:iterator>
        
    </div>
    
    <script type="text/javascript" src="<%=request.getContextPath() %>/jstree/3.2.1/jstree.min.js"></script>
    <script type="text/javascript">
    (function() {
      $('#save-btn').bind('click', function() {
    	$.ajax({
          url: "<%=request.getContextPath()%>/System/updateModule",
          method: 'POST',
          data: $('#module-form').serialize(),
          success: function() {
            window.location.reload();
          },
          error: function() {
            alert('网络连接错误');
          }
    	});
      });
   	  $('#tree-container').jstree({
   	    'core' : {
  	      'data' : {
  	    	"url" : "<%=request.getContextPath()%>/System/getModuleTree",
  	         "dataType" : "json"
  	      }
   	    },
   	  }).on('select_node.jstree', function(event, data) {
   		if(data.node.children.length === 0) {
   			$.ajax({
   				method: 'GET',
   				url : "<%=request.getContextPath()%>/System/getModuleDetail" ,
   				dataType: 'json',
   				data: {
   					'moduleID': data.node.id
   				},
   				success: function(data) {
   					console.log(data);
					for(var k in data) {
						$('input[name="'+k+'"]').val(data[k]);
						$('select[name="'+k+'"]>[value="'+data[k]+'"]').attr("selected", true);
					}
   				},
   				error: function(data) {
   					alert('基本资料获取失败');
   					console.err('基本资料获取失败', data);
   				}
   				
   			})
   		  console.log('点击叶节点', event, data)
   		}
   	  });
   	})();
    </script>

	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>

</body>
</html>