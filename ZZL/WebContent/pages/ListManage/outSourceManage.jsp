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
       .table-responsive{margin-top: 90px;}
       .table{border-top: 3px solid #7D9EC0;}
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
                    <small>大货外发排单</small>
                </h1>
            </section>
              <!-- Main content -->
               <section class="content">
               
              <!-- 外发排单查询 -->
              <form  role="form" method="post" action="<%=request.getContextPath() %>/listManage/InquireOutSource">
                <div class="input-group" id="design_id">
	             <a class="search-title">款号：</a>
	            <input type="text" id="designCode" name="designCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group" id="design_Name">
	            <a class="search-title">款名：</a>
	            <input type="text" id="designName" name="designName"  class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
	            
	            <div class="input-group-1">
                    <a class="search-title">截止参考外发时间：</a>
                    <input type="text" id="outSource_date" name="outSource_date" class="input-panel" placeholder="" >                
              </div> 
               
               <br/><br/>
               
               <div class="input-group" id="outsource_id">
	            <a class="search-title">订单编号：</a>
	            <input type="text" id="outsourceCode" name="outsourceCode" class="input-panel" placeholder="" style="padding: 2px 10px;" >                 
	            </div>
               
               <a class="search-title">状态：</a>     
               <div class="input-group" style="width:10%;" >
	                        
	               <select id="inquiryProgress" name="inquiryProgress" class="form-control">
	                <option>请选择</option>
	                <option>第一时间</option>
	                <option>普通</option>
	               </select>
	           </div>
	           
	           
	           <div class="input-group">
	           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <button type="submit" id="search-outsource" class="btn btn-primary" style="padding:0px 15px;" ">查询</button>
                </div>
	            </form>
	        
	            <!-- 外发排单查询-->
	           <!-- 外发排单表格-->
	            <div class="table-responsive">
	           <a style="color:#AAAAAA;">共<s:property value="PageBean.allRow"/>条外发排单</a>
					   <table class="table table-striped">
					         <tr>
					               <th>图片</th>
					               <th>订单编号</th>
					               <th>款式信息</th>
					               <th>外发时间</th>
					               <th>外发信息</th>
					               <th>操作</th>
					         </tr>                             
                        <s:iterator value="PageBean.list" var="OutSourceManageVO">
					         <tr>
					             <td><img src="../images/1.png" class="commdity-graph"></td>
					                  <td><s:property value="#OutSourceManageVO.outsourceCode" />
					                       <br/><font color="red"><s:property value="#OutSourceManageVO.designTechProcedure_finished"/></font>
					                       <font color="black"><s:property value="#OutSourceManageVO.designTechProcedure_unfinished"/></font>
					                       <br/><font color="blue">状态：</font><font color="red"><s:property value="#OutSourceManageVO.orderPriority"/></font></td>
					                       <td><font color="blue">款号：</font><s:property value="#OutSourceManageVO.designCode" />
					                       <br/><font color="blue">款名：</font><s:property value="#OutSourceManageVO.designName" /></td>
					                   <td><font color="blue">参考时间：</font><s:property value="#OutSourceManageVO.referenceOutDate" />
					                       <br/><font color="blue">实际时间：</font><s:property value="#OutSourceManageVO.referenceOutDate"/></td>
					                   <td><font color="red">已外发</font><br/>
					                   <s:property value="#OutSourceManageVO.userName" /></td>
					                   <td> <a href="<%=request.getContextPath() %>/listManage/showOutSourceDetail?outSourceID=<s:property value='#OutSourceManageVO.outsourceID'/>" id="showDetail" style="color:#7EC0EE;">查看详情</a></td>
					           </tr>
					     </s:iterator>
					     </table>
				</div>
				 <!-- 分页-->
	            <%@ include file="../../page.jsp"%>
	            <!-- 分页-->				
	           </section>
	   </aside>
	</div>
	
	<script type="text/javascript">
        	window.onload = changeTab("10400","10404");
    	</script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
	</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	</body>
</html>

	