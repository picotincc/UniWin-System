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
    <title>智造链-询价单</title>
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
                   	 询价单详细
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="inquiryDetail">
                    <div class="png_area">
                    	<img src="../images/1.png" id="design_image">
                    </div>
                    <div class="inquiryInfo">
                        <table class="table" id="infoTable">
                          <tbody>
                             <tr>
                                <td style="min-width:100px;">询价单编码：</td>
                                <td><s:property value="inquiry.inquiryCode"/></td>
                             </tr>
                             <tr>
                                <td>款式名称：</td>
                                <td><s:property value="inquiry.design.designName"/></td>
                             </tr>
                             <tr>
                                <td>款式类型：</td>
                                <td><s:property value="inquiry.design.designType"/></td>
                             </tr>
                             <tr>
                                <td>样衣：</td>
                                <td><s:property value="inquiry.inquiryMaterialSample"/></td>
                             </tr>
                             <tr>
                                <td>加工周期：</td>
                                <td><s:property value="inquiry.inquiryProcessCycle"/>天</td>
                             </tr>
                            <tr>
                                <td>合计件数：</td>
                                <td><s:property value="inquiry.inquiryTotal"/>件</td>
                             </tr>
                          </tbody>
                       </table>
                        
                    </div>
                    <ul class="inquiryProgress">
                    	<s:if test="inquiry.inquiryProgress=='无'">
                        <li>
                            <img src="../images/point.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a>面料进行中..</a>                            
                        </li>
                        </s:if>
                    	<s:else>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <button type="button" class="btn btn-success">面料OK</button>                            
	                        	<a>
	                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        	<s:property value="inquiry.shellOKTime"/>
	                        	</a>
	                        </li>
	                        <s:if test="inquiry.inquiryProgress!='面料OK'">
	                        <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <button type="button" class="btn btn-success">辅料OK</button>
	                        	<a>
	                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        	<s:property value="inquiry.accOKTime"/>
	                        	</a>
	                        </li>
	                        <s:if test="inquiry.inquiryProgress!='辅料OK'">
	                         <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <button type="button" class="btn btn-success">花型OK</button>
	                        	<a>
	                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        	<s:property value="inquiry.flowerOKTime"/>
	                        	</a>
	                        </li>
	                        <s:if test="inquiry.inquiryProgress!='花型OK'">
	                         <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <button type="button" class="btn btn-success">版型OK</button>
	                        	<a>
	                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        	<s:property value="inquiry.modelOKTime"/>
	                        	</a>
	                        </li>
	                         <s:if test="inquiry.inquiryProgress=='加工OK'">
	                         <li>
	                            <img src="../images/line.jpg" id="lineIcon">
	                        </li>
	                        <li>
	                            <img src="../images/bpoint.png" id="tinySiteIcon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <button type="button" class="btn btn-success">加工OK</button>
	                        	<a>
	                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        	<s:property value="inquiry.processOKTime"/>
	                        	</a>
	                        </li>
	                        </s:if>
	                        </s:if>
	                        </s:if>
	                        </s:if>
                        </s:else>
                    </ul>
                    <a>面料费用>></a><br/><br/>
                    <div class="table-responsive">
                        <!-- .table - Uses sparkline charts-->
                        <table class="table table-striped">
                            <tr>
                                <th>面料</th>
                                <th>单价（元/米）</th>
                                <th>单件用量（米/件）</th>
                                <th>合计（元/件）</th>
                            </tr>
                            <s:iterator value="inquiry.inquiryMaterials" var="inquiryMaterial">
                            <s:if test="#inquiryMaterial.material.materialType=='面料'">
                            <tr>
                                <td><s:property value="#inquiryMaterial.material.materialName"/></td>
                                <td><s:property value="#inquiryMaterial.material.unitPrice"/></td>
                                <td><s:property value="#inquiryMaterial.inquiryMaterialUnitVol"/></td>
                                <td><s:property value="#inquiryMaterial.InTotalUnit"/></td>
                            </tr>
                            </s:if>
                            </s:iterator>
                        </table><!-- /.table -->
                    </div>
                    <a>辅料费用>></a><br/><br/>
                    <div class="table-responsive">
                        <!-- .table - Uses sparkline charts-->
                        <table class="table table-striped">
                            <tr>
                                <th>辅料</th>
                                <th>单价（元/米）</th>
                                <th>单件用量（米/件）</th>
                                <th>合计（元/件）</th>
                            </tr>
                            <s:iterator value="inquiry.inquiryMaterials" var="inquiryMaterial">
                            <s:if test="#inquiryMaterial.material.materialType=='辅料'">
                            <tr>
                                <td><s:property value="#inquiryMaterial.material.materialName"/></td>
                                <td><s:property value="#inquiryMaterial.material.unitPrice"/></td>
                                <td><s:property value="#inquiryMaterial.inquiryMaterialUnitVol"/></td>
                                <td><s:property value="#inquiryMaterial.InTotalUnit"/></td>
                            </tr>
                            </s:if>
                            </s:iterator>
                        </table><!-- /.table -->
                    </div>
                    
                    <a>其他费用>></a><br/><br/>
                    <div class="table-responsive">
                        <!-- .table - Uses sparkline charts-->
                        <table class="table table-striped">
                            <tr>
                                <th>印染费（元/件）</th>
                                <th>天数</th>
                                <th>开版费</th>
                                <th>加工费（元/件）</th>
                                <th>周期（天）</th>
                                <th>样衣周期（天）</th>
                            </tr>
                            <tr>
                                <td><s:property value="inquiry.inquiryDetail.inquiryPrintCost"/></td>
                                <td><s:property value="inquiry.inquiryDetail.inquiryTime"/></td>
                                <td><s:property value="inquiry.inquiryDetail.inquirySampleCost"/></td>
                                <td><s:property value="inquiry.inquiryDetail.inquiryProcessCost"/></td>
                                <td><s:property value="inquiry.inquiryDetail.inquiryDetailCycle"/></td>
                                <td><s:property value="inquiry.inquiryDetail.inquirySampleCycle"/></td>
                            </tr>
                        </table><!-- /.table -->
                    </div>
                    <font color="white" style="background-color:#FF3030;">成本与报价>></font><br/><br/>
                    <div class="table-responsive">
                        <!-- .table - Uses sparkline charts-->
                        <table class="table table-striped">
                            <tr>
                                <th>单件成本（元/件）</th>
                                <th>订单合计成本（元）</th>
                                <th>利润点（%）</th>
                                <th>参考报价（元/件）</th>
                            </tr>
                            <tr>
                            <td><s:property value="inquiry.unitCost"/></td>
                            <td><s:property value="inquiry.totalCost"/></td>
                            <td style="margin:0px;padding:0px;">
                            	<div class="form-group" style="width:40%;">
					               <select onChange="javacript:price(this.options[this.selectedIndex].value)" class="form-control">
					                <option>45</option>
					                <option>25</option>
					                <option>35</option>
					                <option>55</option>
					                <option>100</option>
					                <option>200</option>
					               </select>
					           </div>
                            </td>
                            <td id="advicePrice"></td>
                            </tr>
                        </table><!-- /.table -->
                    </div>
                </div>
            </section>
        </aside>  
    </div> 
    </s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
    <script type="text/javascript">
    	price();
    	function price(){
    		var point = arguments[0]?arguments[0]:45;
    		var basePrice = "<s:property value='inquiry.unitCost'/>";
    		var advicePrice = basePrice*(100+parseInt(point))/100;
    		$("#advicePrice").html(advicePrice);
    	}
    </script>
</body>
</html>