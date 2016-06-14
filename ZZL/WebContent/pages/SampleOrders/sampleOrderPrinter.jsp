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
    <title>智造链-样衣单-打印</title>
</head>
<body class="skin-blue">
	 <s:if test="#request.session.account!=null">
	 <section style="margin:0 auto;width:1000px;height:200px auto;">
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
	                   <td>款号：</td>
	                   <td><s:property value="sampleOrder.design.designCode"/></td>
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
	               
	       
	             </tbody>
	          </table>
	       </div>
	       <br/><br/>
           <table class="table">
              <tbody>
              	 <tr>
                    <td style="width:118px;">面料要求：</td>
                    <td><s:property value="sampleOrder.sampleOrderShellFabReq"/></td>
                 </tr>
                 <tr>
                    <td style="width:118px;">辅料要求：</td>
                    <td><s:property value="sampleOrder.sampleOrderAccReq"/></td>
                 </tr>
                 <tr>
                    <td style="width:118px;">工艺要求：</td>
                    <td><s:property value="sampleOrder.sampleOrderTechReq"/></td>
                 </tr>
                 <tr>
                    <td style="width:118px;">修改意见：</td>
                    <td><s:property value="sampleOrder.sampleOrderModOpinion"/></td>
                 </tr>
              </tbody>
           </table>
           <a style="color:#333;font-size:16px;">&nbsp;&nbsp;打印人：<s:property value="#request.session.account"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="day"/></a>
       </section>
       </s:if>
		<s:else>
			<jsp:include page="../../login.jsp"></jsp:include>
		</s:else>
</body>
</html>