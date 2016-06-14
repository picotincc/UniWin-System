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
    <title>智造链-排单管理</title>

    <style type="text/css">
       a,label{color: #737373;}
       a:hover{color: #737373;}
       #inquiryProgress{height:26px;padding:0px 12px;}  
       .input-group{position: relative;float: left;width: 40%;}
       .input-group-1{position: relative;float: left;width:20%}
       .input-group-2{position: relative;float: left;width:80%}
       .search-title{position: relative;float:left;margin-top:2px;}
       .form-control{float: left;width: 100%;}
       .table-responsive{margin-top: 5px;}
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
	               	排单详情
	           </h1>
	       </section>
	       <!-- Main Content -->
	       <section class="content">
	       <!-- 排单详情 -->
	       <div class="input-group-2">
	       <div class="input-group" id="outsource_id">
	             <a class="search-title">外发单编号：<s:property value="outsource.outsourceCode"/></a>	                           
	       </div>
	       
	       <div class="input-group" id="design_style">
	             <a class="search-title">工序：<s:property value="outsource.design.designTechProcedure"/></a>	                           
	       </div>
	       <br/><br/><br/>
	       
	       <div class="input-group" id="design_id">
	             <a class="search-title">款号：<s:property value="outsource.design.designCode"/></a>	                           
	       </div>  
	     
	        <div class="input-group" id="design_name">
	             <a class="search-title">款式名称：<s:property value="outsource.design.designName"/></a>	                           
	       </div><br/><br/><br/>
	       
	       <div class="input-group" id="outsource_time">
	             <a class="search-title">排单时间：<s:property value="outsource.osScheduleDate"/></a>	                           
	       </div>  
	       
	       <div class="input-group-1" id="reference_price">
	             <a class="search-title">参考工价：<s:property value="outsource.labourCost"/> 元/件</a>	                           
	       </div>  
	       
	       <div class="input-group-1" id="reference_num">
	             <a class="search-title">参考数量：<s:property value="refernence_pirce"/></a>	                           
	       </div>
	       </div>
	       
	       <div>
	       
	       <img src="../images/1.png" width="10%",height="20px">	       
	       </div><br/><br/>
	       
	       <a><font color="blue" size="4px">加工信息>></font></a>
	       
	        <div class="table-responsive">
                            <!-- .table - Uses sparkline charts-->
                            <table class="table table-striped">
                                <tr>
                                    <th>颜色</th>
                                    <th>XS</th>
                                    <th>S</th>
                                    <th>M</th>
                                    <th>L</th>
                                    <th>XL</th>
                                    <th>XLL</th>
                                    <th>合计</th>
                                </tr>
                                <s:iterator value="outsourceDetail" var="OutSourceDetail">
                                <tr>
                               		<td><s:property value="#OutSourceDetail.outsourceColor"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceXS"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceS"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceM"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceL"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceXL"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceXXL"/></td>
                                    <td><s:property value="#OutSourceDetail.outsourceTotal"/></td>
                                </tr> 
                                </s:iterator>
                                                             
                            </table><!-- /.table --> 
	       </div><br/><br/>
	      <!-- 加工方信息 -->
	       <div class="input-group-1" id="processor_name">
	             <a class="search-title">加工方：<s:property value="outsource.processor.processorName"/></a>	                           
	       </div> 
	       
	       <div class="input-group" id="processor_telephone">
	             <a class="search-title">联系电话：<s:property value="outsource.processor.processorMobileNum"/></a>	                           
	       </div>
	       
	       <div class="input-group-1" id="order_state">
	             <a class="search-title">订单状态：<s:property value="order_state"/></a>	                           
	       </div><br/><br/>
	        
	        <div class="input-group-1" id="outsource_user_name">
	             <a class="search-title">发货人：<s:property value="outsource.user.userName"/></a>	                           
	       </div>
	       
	       <div class="input-group" id="outsource_refereence_outtime">
	             <a class="search-title">预约外发时间：<s:property value="outsource.referenceOutDate"/></a>	                           
	       </div>
	       
	       <div class="input-group" id="outsource_refereence_outtime">
	             <a class="search-title">参考收货时间：<s:property value="outsource.finishDate"/></a>	                           
	       </div><br/><br/><br/>
	       
	       <button type="button" id="returnPrevPage"class="btn btn-primary" onclick="history.go(-1);">返回</button><br/><br/>
	       
	       </section>
</aside>
	</div>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>	

	