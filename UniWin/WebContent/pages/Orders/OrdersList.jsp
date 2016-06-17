<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <%@ include file="../../header.jsp"%>
    <link href="../css/orders.css" rel="stylesheet" type="text/css" />
    <title>智造链-客户订单管理</title>
</head>
<body class="skin-blue">
 <!-- header logo: style can be found in header.less -->
   <s:if test="#request.session.account!=null">
	<!-- 人物头像 -->
	<jsp:include page="../../headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->
	
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- 左边导航栏  -->
        <jsp:include page="../../navigation.jsp"></jsp:include>
        
        <s:iterator value="#session.authorityList" id="low">
		<s:if test="#low.highAuthName=='客户订单管理'&&#low.middleAuthName=='客户订单管理列表'&&#low.lowAuthName=='客户订单管理列表查询'">
		<aside class="right-side">
	       <!-- Content Header (Page header) -->
	       <section class="content-header">
	           <h1>
	               	客户订单管理<small>客户订单列表管理</small>
	           </h1>
	           
	       </section>
	
	       <!-- Main content -->
	       <section class="content">
	           <!-- 客户订单查询-->
	           <div class="input-group" id="order_id">
	            <label for="name">订单编号</label>
	            <input type="text" id="orderCode" class="form-control" placeholder="订单编号" style="padding: 2px 10px;" value="<s:property value='orderCode'/>">                 
	           </div>
	
	           <div class="input-group" id="consumer_num">
	            <label for="name">客户名称</label>
	            <input type="text" id="customerName" class="form-control" placeholder="客户名称" style="padding: 2px 10px;" value="<s:property value='customerName'/>">                 
	           </div>
	           <div class="form-group">
	               <label for="name">询价单进度</label>
	
	               <select id="inquiryProgress" class="form-control">
	                <option>请选择</option>
	                <option>无</option>
	                <option>面料OK</option>
	                <option>辅料OK</option>
	                <option>花型OK</option>
	                <option>版型OK</option>
	                <option>加工OK</option>
	               </select>
	           </div>
	           <div class="form-group">
	               <label for="name">样衣单进度</label>
	
	               <select id="sampleOrderProgress" class="form-control" >
	                <option>请选择</option>
	                <option>无</option>
	                <option>待制版</option>
	                <option>待制作样衣</option>
	                <option>待确认样衣</option>
	                <option>待放码</option>
	                <option>待审版</option>
	                <option>完结</option>
	               </select>
	           </div>
	           <div class="form-group">
	               <label for="name">生产单进度</label>
	
	               <select id="productionProgress" class="form-control" >
	                <option>请选择</option>
	                <option>外发加工中</option>
	                <option>部分收货</option>
	                <option>完整收货</option>
	                <option>质检中</option>
	                <option>质检完成</option>
	               </select>
	           </div>
	           <div class="form-group">
	               <label for="name">负责人</label>
	
	               <select id="chargeName" class="form-control" >
	                <option>请选择</option>
	                <option>梅西</option>
	                <option>宋智孝</option>
	                <option>刘翔</option>
	                <option>哈维</option>
	                <option>伊涅斯塔</option>
	               </select>
	           </div>
	           <button type="button" id="search-orders" class="btn btn-primary">查询</button>
	           <!-- 客户订单查询-->
	           <!-- 客户订单表格-->
	           <div class="table-responsive" style="overflow-x:scroll;">
	           <a style="color:#AAAAAA;">共<s:property value="PageBean.allRow"/>条客户订单</a>
	               <!-- .table - Uses sparkline charts-->
	               <table class="table table-striped">
	               	   <thead>
		                   <tr style="background-color:transparent;">
		                   	   <th></th>
		                       <th>图片</th>
		                       <th>客户订单</th>
		                       <th>询价单进度</th>
		                       <th>样衣单进度</th>
		                       <th>生产单进度</th>
		                       <th>市场负责人</th>
		                   </tr>
	                   </thead>
	                   <tbody>
		                   <s:iterator value="PageBean.list" var="order">
		                   <tr onclick="javascript:judgeSelected(this)">
		                   	   <td style="vertical-align:middle;"><input type="radio" name="select"></td>
		                       <td style="vertical-align:middle;"><img src="../images/1.png" class="commdity-graph"></td>
		                       <td style="vertical-align:middle;">
		                           <a class="HoverUnderline" href="<%=request.getContextPath() %>/Orders/order?orderID=<s:property value='#order.orderID'/>" style="color:#7EC0EE;"><s:property value="#order.orderCode"/></a><br/>
		                           <s:if test="#order.orderChecked!=0">
		                           <a style="color:#71C671;font-weight:bold;font-size:10px;">审核通过</a><br/>
		                           </s:if>
		                           <s:else>
		                           <a style="color:red;font-weight:bold;font-size:10px;">未审核</a><br/>
		                           </s:else>
		                           <a style="color:#36648B;font-weight:bold;font-size:10px;">客户：<s:property value="#order.customer.customerContactName"/></a><br/>
		                           <a style="color:#6C7B8B;"><s:property value="#order.orderDate"/></a>
		                       </td>
		                       <s:if test="#order.inquiry!=null">
		                       <td style="vertical-align:middle;">
		                           <a class="HoverUnderline" href="<%=request.getContextPath() %>/Inquiries/inquiry?inquiryID=<s:property value='#order.inquiry.inquiryID'/>" style="color:#7EC0EE;"><s:property value="#order.inquiry.inquiryCode"/></a><br/>
		                           <a style="color:#71C671;font-weight:bold;font-size:10px;">进度：<s:property value="#order.inquiry.inquiryProgress"/></a><br/>
		                           <a style="color:#6C7B8B;"><s:property value="#order.inquiry.inquiryProgressDate"/></a>
		                       </td>
		                       </s:if>
		                       <s:else>
		                       <td style="vertical-align:middle;">
		                           <a style="color:#EE9A00;font-weight:bold;font-size:10px;">无需询价单</a>
		                       </td>	
		                       </s:else>
		                       <s:if test="#order.sampleOrders!=null">
		                       <td style="vertical-align:middle;">
		                           <a class="HoverUnderline" href="<%=request.getContextPath() %>/SampleOrders/sampleOrder?sampleOrderID=<s:property value='#order.sampleOrders.sampleOrderID'/>" id="sampleOrderCode" style="color:#7EC0EE;"><s:property value="#order.sampleOrders.sampleOrderCode"/></a><br/>
		                           <a style="font-weight:bold;font-size:10px;">进度：<s:property value="#order.sampleOrders.sampleProcedure.sampleOrderProgress"/></a><br/>
		                           <a style="color:#6C7B8B;"><s:property value="#order.sampleOrders.sampleOrderTime"/></a>
		                       </td>
		                       </s:if>
		                       <s:else>
		                       <td style="vertical-align:middle;">
		                           <a style="color:#EE9A00;font-weight:bold;font-size:10px;">无需样衣单</a>
		                       </td>
		                       </s:else>
		                       <td style="vertical-align:middle;">
		                            <a class="HoverUnderline" href="<%=request.getContextPath() %>/Production/production?productionCode=<s:property value='#order.production.productionCode'/>" style="color:#7EC0EE;"><s:property value="#order.production.productionCode"/></a><br/>
		                           <a style="font-weight:bold;font-size:10px;">进度：<s:property value="#order.production.productionProgress"/></a><br/>
		                           <a style="color:#6C7B8B;"><s:property value="#order.production.progressTime"/></a>
		                       </td>
		                       <td style="vertical-align:middle;">
		                       <a class="HoverUnderline" href="" style="color:#36648B;font-weight:bold;font-size:10px;" data-toggle="modal" onclick="javascript:showModal(1,'<s:property value='#order.orderCode'/>');" data-target="#myModal">负责人：<s:property value="#order.charge.userName"/></a><br/>
		                             <a style="color:#6C7B8B;"><s:property value="#order.orderDesignatedTime"/></a>
		                       </td>
		                   </tr>
		                   </s:iterator>
	                   </tbody>
	               </table><!-- /.table -->
	           </div>
	           <!-- 客户订单表格-->
	           <!-- 分页-->
	           <%@ include file="../../page.jsp"%>
	           <!-- 分页-->
	
	       </section>
	   </aside>
	   </s:if>
	   </s:iterator>
	</div>
	<!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
       aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" 
                       data-dismiss="modal" aria-hidden="true">
                          &times;
                    </button>
                    <h4 id="orderCodeTitle" class="modal-title" style="color:white;">指定负责人</h4>
                 </div>
                 <div class="modal-body">
                    <label for="name" style="float:left;margin:0px;margin-top:10px;">姓名：</label>
                    <div class="input-group" id="responser" style="width:30%;">
                     <input type="text" class="form-control" id="userName" placeholder="请输入姓名" style="float:left;padding: 2px 10px;" maxlength="20">
                    </div>
                     <button type="button" id="search-responser" class="btn btn-primary" onclick="javascript:getAllCharge(1)">查询</button>
                     <div class="table-responsive" style="margin-top:50px;">
                     	<a id="allRow" style="color:#AAAAAA;"></a>
                        <!-- .table - Uses sparkline charts-->
                        <table class="table table-striped">
                        	<thead>
	                            <tr>
	                                <th>姓名</th>
	                                <th>电话</th>
	                                <th>地址</th>
	                            </tr>
                            </thead>
                            <tbody id="userTabel">
                            </tbody>
                        </table><!-- /.table -->
                    </div>
                    <!-- 分页-->
                    <ul class="pager">
					</ul>
                	<!-- 分页-->

                 </div>
                 <div class="modal-footer" style="padding:10px 20px;">
                    <button type="button" class="btn btn-primary" 
                       data-dismiss="modal">关闭
                    </button>
                 </div>
              </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    
    <div class="modal fade" id="confirmModal" role="dialog" 
       aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog" >
              <div class="modal-content" style="width:60%;text-align: center;margin:40% 20%;">
                 <div id="dialogInfo" class="modal-body" style="height:20%;">
                   	指定给
                 </div>
                 <div class="modal-footer" style="padding:10px 20px;">
                 	<button type="button" class="btn btn-primary" onclick="javascript:updateOrder();">确定</button>
                    <button type="button" class="btn btn-primary" 
                       data-dismiss="modal">取消
                    </button>
                 </div>
              </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	<script src="<%=request.getContextPath()%>/js/setDefaultSelect.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		window.onload = changeTab("11200","11201");
		setDefault();
		function setDefault() {
			
			var inquiryProgress = "<s:property value='inquiryProgress'/>";
			var selectforInquiryProgress = document.getElementById("inquiryProgress");
			setSelectDefault(selectforInquiryProgress, inquiryProgress);
			
			var sampleOrderProgress = "<s:property value='sampleOrderProgress'/>";
			var selectforSampleOrderProgress = document.getElementById("sampleOrderProgress");
			setSelectDefault(selectforSampleOrderProgress, sampleOrderProgress);
			
			var productionProgress = "<s:property value='productionProgress'/>";
			var selectforProductionProgress = document.getElementById("productionProgress");
			setSelectDefault(selectforProductionProgress, productionProgress);
			
			var chargeName = "<s:property value='chargeName'/>";
			var selectforChargeName = document.getElementById("chargeName");
			setSelectDefault(selectforChargeName, chargeName);
		}
	</script>
    <script type="text/javascript">
        searchOrders();
        function searchOrders(){
            $("#search-orders").click(function() {
            	
            	var orderCode = $("#orderCode").val();
                var customerName = $("#customerName").val();;
                var inquiryProgress = $("#inquiryProgress option:selected").text();
                var sampleOrderProgress = $("#sampleOrderProgress option:selected").text();
                var productionProgress = $("#productionProgress option:selected").text();
                var chargeName = $("#chargeName option:selected").text();
                inquiryProgress = (inquiryProgress=="请选择")?"":inquiryProgress;
                sampleOrderProgress = (sampleOrderProgress=="请选择")?"":sampleOrderProgress;
                productionProgress = (productionProgress=="请选择")?"":productionProgress;
                chargeName = (chargeName=="请选择")?"":chargeName;Name = (chargeName=="请选择")?"":chargeName;
               
                var url = window.location.href.split("?")[0];
                url += "?page=1";
                var purl = location.search; //获取url中"?"符后的字串
                var paramsList = new Object();
                if (purl.indexOf("?") != -1) {
                   var str = purl.substr(1);
                   strs = str.split("&");
                   for(var i = 0; i < strs.length; i ++) {
                      paramsList[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
                   }
                }
                //第一次搜索和第N次搜索
                if (url.indexOf("search_orders")==-1) {
	                url = url.replace("orders","search_orders");
	                for (var j in paramsList){
	                	if(j=="rowsPerPage")
	                		url += "&rowsPerPage="+paramsList[j];
	                }
	                url += "&orderCode="+orderCode+"&customerName="+customerName+"&inquiryProgress="+inquiryProgress+"&sampleOrderProgress="+sampleOrderProgress+"&productionProgress="+productionProgress+"&chargeName="+chargeName;
                }else{
                	//修改参数项
                    for (var j in paramsList){
                    	if(j=="rowsPerPage"){
                    		url+= "&rowsPerPage="+paramsList[j];
                    	}
                    	if(j=="orderCode"){
                    		paramsList[j] = orderCode;
                    		url+= "&orderCode="+paramsList[j];
                    	}
                    	if(j=="customerName"){
                    		paramsList[j] = customerName;
                    		url+= "&customerName="+paramsList[j];
                    	}
                    	if(j=="inquiryProgress"){
                    		paramsList[j] = inquiryProgress;
                    		url+= "&inquiryProgress="+paramsList[j];
                    	}
                    	if(j=="sampleOrderProgress"){
                    		paramsList[j] = sampleOrderProgress;
                    		url+= "&sampleOrderProgress="+paramsList[j];
                    	}
                    	if(j=="productionProgress"){
                    		paramsList[j] = productionProgress;
                    		url+= "&productionProgress="+paramsList[j];
                    	}
                    	if(j=="chargeName"){
                    		paramsList[j] = chargeName;
                    		url+= "&chargeName="+paramsList[j];
                    	}
                    }
                    
                    
                }
                //alert(url);
				window.location.href = url;
				
            });
        }
        var orderCode = '';
        var cid=0;
        function showModal(){
        	var page = arguments[0];
        	orderCode = arguments[1];
        	getAllCharge(page);
        }
        function getAllCharge(page){
        	//alert("hello");
        	var userName = $("#userName").val();
        	params = {
    				"page":page,
    				"userName":userName
    		};
        	$.post('/ZZL/System/UserAjax_getAllChargeByPageAjax', params, function(data) {
        		//alert("result");alert(data);
        		//$("#userName").val(userName);
        		obj = eval("("+data+")");
        		var users = obj.users;
        		var tr = '';
        		for(i =0;i<users.length;i++){
        			tr += "<tr onclick=\"javascript:orderChargeConfirm("+users[i].userId+",'"+users[i].userName+"')\" data-toggle='modal' data-target='#confirmModal'><td>"+users[i].userName+"</td>"+"<td>"+users[i].userMobileNum+"</td>"+"<td>"+users[i].userAddr+"</td></tr>";
        		}
        		//$("#orderCodeTitle").html("订单"+orderCode+"指定负责人");
        		$("#userTabel").html(tr);
        		var allRow = obj.allRow;
        		$("#allRow").html("共"+allRow+"条记录");
        		var currentPage = obj.currentPage;
        		var totalPage = obj.totalPage;
        		var temp = '';
        		if(currentPage==1){
        			temp += "<li class='previous disabled'><a>&larr; Prev</a></li>";
        		}else{
        			temp += "<li class='previous'><a href='javascript:getAllCharge("+(currentPage-1)+")'>&larr; Prev</a></li>";
        		}
        		temp += "<li><span style='padding:5px;border:none;'>第"+currentPage+"页/共"+totalPage+"页</span></li>";
				if(currentPage==totalPage){
					temp += "<li class='next disabled'><a>Next &rarr;</a></li>";
				}else{
					temp += "<li class='next'><a href='javascript:getAllCharge("+(currentPage+1)+")'>Next &rarr;</a></li>";
				}        		
        		$(".pager").html(temp);
            },'json');
        }
        function orderChargeConfirm(){
        	cid = arguments[0];
        	name = arguments[1];
        	$("#dialogInfo").html("订单"+orderCode+"指派给"+name);
        }
        function updateOrder(){
        	params = {
    				"orderCodeAjax":orderCode,
    				"chargeId":cid
    		};
        	$.post('/ZZL/Orders/OrderAjax_updateCharge', params, function(data) {
        		location.reload(); 
            });
        }
        
    </script>
</body>
</html>