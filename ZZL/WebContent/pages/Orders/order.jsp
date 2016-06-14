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
    <title>智造链-客户订单</title>
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
                                                             客户订单详细
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Dashboard</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            	<div class="orderDetail">
                    <div class="order-customer">
                    <a>客户信息>></a><br/>
                    <table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="width:100px;">客户名称：</td>
                                <td><s:property value="order.customer.customerContactName"/></td>
                             </tr>
                             <tr>
                                <td>客户类型：</td>
                                <td><s:property value="order.customer.customerType"/></td>
                             </tr>
                             <tr>
                                <td>送货地址：</td>
                                <td><s:property value="order.customer.customerAddress"/></td>
                             </tr>
                             
                          </tbody>
                       </table>
                    </div>
                    <div class="order-charge">
                    <a>负责人信息>></a><br/>
                    <table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="width:100px;">订单负责人：</td>
                                <td><s:property value="order.charge.userName"/></td>
                             </tr>
                             <tr>
                                <td>联系电话：</td>
                                <td><s:property value="order.charge.userMobileNum"/></td>
                             </tr>                             
                          </tbody>
                       </table>
                    </div>
                    <a>询单信息>></a><br/>
                    <div class="png_area">
                    <img src="../images/1.png" id="design_image">
                    </div>
                    <div class="orderInquiryInfo">
                        <table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="width:100px;">款式名称：</td>
                                <td><s:property value="order.design.designName"/></td>
                             </tr>
                             <tr>
                                <td>款式类型：</td>
                                <td><s:property value="order.design.designType"/></td>
                             </tr>
                              <tr>
                                <td>要求货期：</td>
                                <td><s:property value="order.orderFinishDate"/></td>
                             </tr>
                              <tr>
                                <td>参考网址：</td>
                                <td><s:property value="order.orderRefURL"/></td>
                             </tr>
                          </tbody>
                        </table>                        
                    </div>
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
                                <s:iterator value="order.orderDetails" var="oColor">
                                <tr>
                               		<td><s:property value="#oColor.orderColor"/></td>
                                    <td><s:property value="#oColor.orderXS"/></td>
                                    <td><s:property value="#oColor.orderS"/></td>
                                    <td><s:property value="#oColor.orderM"/></td>
                                    <td><s:property value="#oColor.orderL"/></td>
                                    <td><s:property value="#oColor.orderXL"/></td>
                                    <td><s:property value="#oColor.orderXXL"/></td>
                                    <td><s:property value="#oColor.totalNum"/></td>
                                </tr> 
                                </s:iterator>
                                                             
                            </table><!-- /.table -->
                        </div>
                        <a>物料详情>></a><br/><br/>
                        <div class="table-responsive">
                            <!-- .table - Uses sparkline charts-->
                            <table class="table table-striped">
                                <tr>
                                    <th>物料属性</th>
                                    <th>面/辅料</th>
                                    <th>色号</th>
                                    <th>供应商</th>
                                    <th>联系方式</th>
                                    <th>订购数量</th>
                                    <th>备注说明</th>
                                </tr>
                                <s:iterator value="order.orderMaterialDetails" var="orderMaterial">
                                <tr>
                                    <td><s:property value="#orderMaterial.orderMaterialAttr"/></td>
                                    <td><s:property value="#orderMaterial.supply.material.materialType"/></td>
                                    <td><s:property value="#orderMaterial.supply.material.colorCode"/></td>
                                    <td><s:property value="#orderMaterial.supply.vendor.vendorName"/></td>
                                    <td><s:property value="#orderMaterial.supply.vendor.vendorPhoneNum"/></td>
                                    <td><s:property value="#orderMaterial.orderVol"/></td>
                                    <td><s:property value="#orderMaterial.orderComment"/></td>
                                </tr> 
                                </s:iterator>
                                                             
                            </table><!-- /.table -->
                        </div>
                        <a>其他详情>></a><br/><br/>
                        <table class="table">
                          <tbody>
                             <tr>
                                <td style="width:130px;">样板码数：</td>
                                <td><s:property value="order.orderSampleYardage"/></td>
                             </tr>
                             <tr>
                                <td>水洗标要求：</td>
                                <td><s:property value="order.orderSewnInLabelReq"/></td>
                             </tr>
                              <tr>
                                <td>工艺制作要求：</td>
                                <td><s:property value="order.orderTechReq"/></td>
                             </tr>
                              <tr>
                                <td>其他备注：</td>
                                <td><s:property value="order.orderComment"/></td>
                             </tr>
                          </tbody>
                        </table>   
                	<button type="button" id="returnPrevPage"class="btn btn-primary" onclick="history.go(-1);">返回</button><br/><br/>
                </div>
            </section>
        </aside>  
    </div> 
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>