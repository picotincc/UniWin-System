<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <%@ include file="../../header.jsp"%>
    <link href="../css/osiStyle.css" rel="stylesheet" type="text/css" />
    <title>智造链-样衣单</title>
</head>
<body class="skin-blue">
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
                    	样衣单详细
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="sampleOrderDetail">
                    <div class="png_area">
                    <img src="../images/1.png" id="design_image">
                    </div>
                    <div class="sampleOrderInfo">
                    	<table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="min-width:100px;">样衣单编码：</td>
                                <td><s:property value="sampleOrder.sampleOrderCode"/></td>
                             </tr>
                             <tr>
                                <td>下单时间：</td>
                                <td><s:property value="sampleOrder.sampleOrderTime"/></td>
                             </tr>
                             <tr>
                                <td>款式名称：</td>
                                <td><s:property value="sampleOrder.design.designName"/></td>
                             </tr>
                             <tr>
                                <td>款式类型：</td>
                                <td><s:property value="sampleOrder.design.designType"/></td>
                             </tr>
                             <tr>
                                <td>样衣：</td>
                                <td><s:property value="sampleOrder.sampleOrderSample"/></td>
                             </tr>
                             <tr>
                                <td>款号：</td>
                                <td><s:property value="sampleOrder.design.designCode"/></td>
                             </tr>
                    
                          </tbody>
                       </table>
                    </div>
                    <ul class="sampleOrderTime">
                    	<s:if test="sampleOrder.sampleProcedure.sampleOrderProgress=='无'">
                        <li>
                            <img src="../images/point.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a>无</a>                            
                        </li>
                        </s:if>
                        <s:else>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">
	                            <a style="color:#7CCD7C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待制版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                            <a><s:property value="sampleOrder.sampleProcedure.sampleProModelTime"/></a>
	                        </li>
	                        <s:if test="sampleOrder.sampleProcedure.sampleOrderProgress!='待制版'">
	                        <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">
	                            <a style="color:#7CCD7C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待制作样衣&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                            <a><s:property value="sampleOrder.sampleProcedure.sampleProMakeTime"/></a>
	                        </li>
	                        <s:if test="sampleOrder.sampleProcedure.sampleOrderProgress!='待制作样衣'">
	                        <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">
	                            <a style="color:#7CCD7C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待确认样衣&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                            <a><s:property value="sampleOrder.sampleProcedure.sampleProConfirmTime"/></a>
	                        </li>
	                        <s:if test="sampleOrder.sampleProcedure.sampleOrderProgress!='待确认样衣'">
	                        <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">
	                            <a style="color:#7CCD7C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待放码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                            <a><s:property value="sampleOrder.sampleProcedure.sampleProGradingTime"/></a>
	                        </li>
	                        <s:if test="sampleOrder.sampleProcedure.sampleOrderProgress!='待放码'">
	                        <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">
	                            <a style="color:#7CCD7C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待审版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                            <a><s:property value="sampleOrder.sampleProcedure.sampleProExamineTime"/></a>
	                        </li>
	                        <s:if test="sampleOrder.sampleProcedure.sampleOrderProgress=='完结'">
	                        <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">
	                            <a style="color:#7CCD7C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完结&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                            <a><s:property value="sampleOrder.sampleProcedure.sampleProFinishTime"/></a>
                        	</li>
                        	</s:if>
	                        </s:if>
	                        </s:if>
	                        </s:if>
	                        </s:if>
                       </s:else>
                    </ul>
                    
                    <table class="table">
                       <tbody>
                          <tr>
                             <td style="width:118px;">工艺要求：</td>
                             <td><s:property value="sampleOrder.sampleOrderTechReq"/></td>
                          </tr>
                          <tr>
                             <td style="width:118px;">其他备注：</td>
                             <td><s:property value="sampleOrder.sampleOrderComment"/></td>
                          </tr>
                 
                       </tbody>
                    </table>
                    <button type="button" id="returnPrevPage"class="btn btn-primary" onclick="history.go(-1);">返回</button>
                	<button type="button" id="printInfo" class="btn btn-primary" >打印</button>
                	<br/><br/>
                </div>
            </section>
        </aside>  
    </div> 
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
    <script type="text/javascript">
    	target();
	    function target(){
	        $("#printInfo").click(function() {
	        	var url = "<%=request.getContextPath()%>";
	        	var sampleOrderID = "<s:property value='sampleOrder.sampleOrderID'/>";
	        	window.open(url+"/SampleOrders/sampleOrderPrinter?sampleOrderID="+sampleOrderID);
	        });
	    }
    </script>
</body>
</html>