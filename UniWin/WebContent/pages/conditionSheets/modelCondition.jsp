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

    <title>ZZL</title>
    
    
    <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js" type="text/javascript"></script> 
   
</head>

<body class="skin-blue">
    <!-- 
    <header class="header">
        <a href="index.html" class="logo">
            智&nbsp造&nbsp链
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
        </nav>
    </header>
    -->
    
     <s:if test="#request.session.account!=null">
     <!-- 人物头像 -->
	 <jsp:include page="../../headSculpture.jsp"></jsp:include>
	 <!-- 人物头像 -->

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <s:iterator value="#session.authorityList" id="low">
		<s:if test="#low.highAuthName=='图形报表'&&#low.middleAuthName=='每日制版单积压趋势图'&&#low.lowAuthName=='每日制版单积压趋势图查询'">
        
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          制版单积压趋势图
                    <small> </small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            
                            <div class="box-header">
                                <h3 class="box-title">制版单积压趋势图</h3>
                            </div><!-- /.box-header -->
                            
                            <!-- 查询按钮  -->
                            <div class="row">
                                <!-- 查询   -->
                                 <div class="col-md-10">
                                    <!-- form start -->
                                <!--       <form  role="form" method="post" action="<%=request.getContextPath()%>/ConditionSheets/searchedModelConditionSheet">     -->                 
                                        <script type="text/javascript">
                                           function aa(){
                                        	   document.getElementById('date-label').innerHTML=document.getElementById('type').value;
                                           } 
                                        </script>
                                        <div class="row" >
                                            
                                                <div class="col-md-3">                         
                                                     <label>分类：</label>
                                                </div>
                                                
                                                <div class="col-md-3">                                                   
                                                     <label id="date-label">年度</label>
                                                </div>
                                                                                        
                                        </div>
                                        <div class="row" >
                                            
                                                <div class="col-md-3">                         
                                                     <select name="type" id="type" onchange="aa()">
                                                     <option selected="selected" value="0">---请选择类型--- </option> 
                                                     <option value="年度">年度</option>
                                                     <option value="年度-日期">年度-日期</option>
                                                     </select>
                                                </div>
                                                
                                                <div class="col-md-3">                                                   
                                                     <input type="text" class="form-control" id="date" name="date">
                                                </div>
                                            
                                               <div class="col-md-2">
                                                     <button type="submit" class="btn btn-primary" style="margin-top: -6px" 
                                                        onclick="modelCondition(document.getElementById('type').value,document.getElementById('date').value)">查询</button>
                                               </div>
                                        </div>
                                   <!--   </form>   -->
                                </div>

                                <div class="col-md-1">
                                </div>
                                
                            </div>
                                                        
                            <!-- 图表  -->
                             <div id="container" style="min-width:800px;height:400px;">
                          </div>
                                                    
                        </div><!-- /.box-->
                    </div>
                </div>        
            </section>
        </aside>
        </s:if>
        </s:iterator>
    </div>
    
    
    <script type="text/javascript">
//         windows.onload = changeTab("11300","11302");
         
         function modelCondition(type,date) { 
        	 var xtext = [];
    		 var list = [];
        	 params = {
        			 "typeAjax":type,
        			 "dateAjax":date       			 
        	 };
        	 jQuery.post("/ZZL/ConditionSheets/modelConditionAjax",params,function(data){
        		 json = eval("("+data+")");
        		 for(var key in json.list){
                     //json.list[key].y = json.list[key].tcVol; //给Y轴赋值
                     xtext.push(json.list[key].date);//给X轴TEXT赋值
                     list.push(json.list[key].tcVol);
                 }
        		 console.log(list);
                 //chart.series[0].setData(json.list);//数据填充到highcharts上面
        		 var chart = new Highcharts.Chart({
          			chart:{
          				renderTo: 'container',
          			},
           	    	 title: {
           	             text: '制版单积压趋势图',
           	             x: -20 //center
           	         },
           	         subtitle: {
           	             text: '',
           	             x: -20
           	         },
           	         xAxis: {
           	        	categories:xtext
           	         },
           	         yAxis: {
           	             title: {
           	                 text: '积压制版单数(件)'
           	             },
           	             plotLines: [{
           	                 value: 0,
           	                 width: 1,
           	                 color: '#808080'
           	             }]
           	         },
           	         tooltip: {
           	             valueSuffix: '件'
           	         },
           	         legend: {
           	             layout: 'vertical',
           	             align: 'right',
           	             verticalAlign: 'middle',
           	             borderWidth: 0
           	         },
           	         series: [{
           	             name: '制版单',
           	             data:list
           	         }]
           	    });
        	 },"json");       	
     	}
    </script>

    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
	
</body>
</html>