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

    <style type="text/css">
       a,label{color: #737373;}
       a:hover{color: #737373;}
       #inquiryProgress{height:26px;padding:0px 12px;}   
       .input-group{position: relative;float: left;width: 25%;}
       .input-group-1{position: relative;float: left;width: 30%;}
       .search-title{position: relative;float:left;margin-top:2px;}
       .form-control{float: left;width: 100%;}
       .table-responsive{margin-top: 20px;}
       .table{border-top: 3px solid #7D9EC0;}
       .btn-right{float:right;width:10%}
       .form-left{witdh:90%}
       .input-panel{position:relative;float:left;border:1px solid #ccc;border-radius: 3px;padding: 2px 10px;width:60%;}
    </style>
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
        
        <!-- Right side column. Contains the navbar and content of the page -->
   
		<aside class="right-side">
	       <!-- Content Header (Page header) -->
	        <section class="content-header">
                <h1>
                        排单管理
                    <small>开始排单</small>
                </h1>
            </section>
	       <!-- Main Content -->
	       
	       <!-- 外发单查询 -->
	       <section class="content">
	       <div class="btn-right">
	       <form id="change" name="f" method="post" action="">
	       
	       <button id="start" type="submit" class="btn btn-primary"  onclick="chek()">开始排单</button> 
	       <input type="hidden" name="selectedCode" id="selectedCode" value="">
	   
	       </form>
	       </div> 
	       <div class="form-left">
	       <form  role="form" method="post"   action="<%=request.getContextPath() %>/listManage/InquireOutSourceUnsolved">
	       <div class="input-group" id="design_id">
	             <a class="search-title">款号：</a>
	            <input type="text" id="designCode" name="designCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group" id="design_Name">
	            <a class="search-title">款名：</a>
	            <input type="text" id="designName" name="designName"  class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group" id="outsource_id">
	            <a class="search-title">订单编号：</a>
	            <input type="text" id="outsourceCode" name="outsourceCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div><br/><br/><br/>
	            
	            <div class="input-group-1">
                    <a class="search-title">截止外发时间：</a>
                    <input type="text" id="outSource_date" name="outSource_date" class="input-panel" placeholder="" >                
              </div> 
	             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	           <button type="submit" id="search-outsource" class="btn btn-primary" style="padding:0px 15px;" ">查询</button> 
	            
	            </form>
	            </div>
	           
	            
	       <!-- 外发单列表 -->
	        <div class="table-responsive" style="overflow-x:scroll;">
	           <a style="color:#AAAAAA;">共<s:property value="PageBean.allRow"/>条外发单</a>
	             
	            <br/><br/> 
	           <table class="table table-striped" name="outsourceList" id="outsourceList">
	                         <tr>
	                               <th></th>
					               <th>图片</th>
					               <th>订单编号</th>
					               <th>款式信息</th>
					               <th>外发交期</th>
					               <th>排单状态</th>
					               <th>操作</th>
					         </tr>  
					         <tbody> 
               <s:iterator value="PageBean.list" var="OutSourceVO">
                              <tr onclick="javascript:judgeSelectedCheckbox(this)">
                                   <td>
                                   <input type="checkbox" name="select" value=${OutSourceVO.outsourceID}>
                                   </td>
                                   <td><img src="../images/1.png" class="commdity-graph"></td>
                                   <td><s:property value="#OutSourceVO.outsourceCode" />
					                       <br/><font color="black"><s:property value="#OutSourceVO.designTechProcedure"/></font>
					                       <br/><font color="blue">状态：</font><font color="red"><s:property value="#OutSourceVO.orderPriority"/></font></td>
					                       
					               <td><font color="blue">款号：</font><s:property value="#OutSourceVO.designCode" />
					                       <br/><font color="blue">款名：</font><s:property value="#OutSourceVO.designName" /></td>
					               <td><s:property value="#OutSourceVO.finishDate"/></td>
					               <td><s:property value="#OutSourceVO.manageState"/></td>
					       
					               <td><a href="<%=request.getContextPath() %>/listManage/showOutSourceDetail?outSourceID=<s:property value='#OutSourceVO.outsourceID'/>" id="showDetail" style="color:#7EC0EE;">查看详情</a></td>
                              </tr>
               </s:iterator>
               <tbody> 
	           </table>
	           
	       </div>
	        <%@ include file="../../page.jsp"%>
	        </section>
	     </aside>
	 </div>

 <script type="text/javascript">
        	window.onload = changeTab("10400","10401");
    	</script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="<%=request.getContextPath() %>/js/radio.js" type="text/javascript"></script>
    <script type="text/javascript">
	 $('#outSource_date').datetimepicker({
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
	 
	
	function chek(){
		
		var obj=document.getElementsByName('select');
		var select_outsource='';
		for(var i=0; i<obj.length; i++){
		if(obj[i].checked) select_outsource+=obj[i].value+','; //如果选中，将value添加到变量s中
		} 
		$("#selectedCode").val(select_outsource);  
		if(select_outsource != ""){
			if(window.confirm('确认排单?')){	
				f.action="<%=request.getContextPath()%>/listManage/changeState";
		 		document.f.submit();
		 		return true;
				}else{
					return false;
				}
		}
		else{
			alert("请选择");
		}
		
	} 
	 
	 
	 function judgeSelectedCheckbox(obj){         //当前行被选中(复选)
			var trObj = getRowObj(obj); 
			var trChilds = trObj.children;
			var tdObj = trChilds[0];
			var icheckbox_minimalChilds = tdObj.getElementsByTagName("div");
			var icheckbox_minimal = icheckbox_minimalChilds[0];
			icheckbox_minimal.className = "icheckbox_minimal checked hover";
			icheckbox_minimal.setAttribute('aria-checked', true);
			var input = icheckbox_minimal.getElementsByTagName("input")[0];
			input.setAttribute('checked', 'checked');
		}
	 
	</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>	