<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib prefix="c" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <jsp:include page="../../header.jsp"></jsp:include>
    <script type="text/javascript">
  window.onload = changeTab("11000","11002");
  var modify = <%=request.getParameter("modify")%>;
  if(modify=='yes'){
  	alert("提交成功！");
  }
  </script>
    <style type="text/css">
 .content{_height: 1000px;min-height:1000px;padding: 30px 25px;}
.borderTr{border-bottom:1px #CDCDB4 solid;}
.normal{border-top:0px #CDCDB4 solid;border-bottom:0px #CDCDB4 solid;}
#infoTable tbody tr td {border-top:none;}
th{text-align: center;}
td{text-align: center;}
a{color:#008080;}
.commdity-graph{margin-left:80px;width: 35%;height: 35%;}
.row{margin-top:5px;}
.design,.customer{position: relative;float: left;margin-left:20px;margin-right:40px;}
.left,.right{position: relative;float: left;margin-left:20px;}
.leftt,.rightt{position: relative;float: left;margin-left:10px;}
    </style>
    
    <title>ZZL</title>
</head>

<body class="skin-blue">


   <s:if test="#request.session.account!=null">
	<!-- 人物头像 -->
	<jsp:include page="../../headSculpture.jsp"></jsp:include>
	<!-- 人物头像 -->

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    QC质检单
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">质检单详情</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            <div>
            <div class="row">
            <div class="left">
            <div class="row">
                            
                                <div class="design">
					             <table class="table" id="infoTable">
                          <tbody>
                             <tr class="normal">
                                <td>款号：</td>
                                <td><s:property value="qcVO.design.designCode"/></td>
                             </tr>
                             <tr class="normal">
                                <td>款式名称：</td>
                                <td><s:property value="qcVO.design.designName"/></td>
                             </tr>
                          </tbody>
                       </table>
                    </div>
                    <div class="customer">
                   
                    <table class="table" id="infoTable">
                          <tbody>
                             <tr class="normal">
                                <td>客户：</td>
                                <td><s:property value="qcVO.customerName"/></td>
                             </tr>
                             <tr class="normal">
                                <td>备注：</td>
                                <td><s:property value="qcVO.qc.QCComment"/></td>
                             </tr>                             
                          </tbody>
                       </table>
                    </div>    
                    
					<br/>
					</div>
					<div class="row">
					
						<div class="table-responsive">
						
							<table class="table">
								<tr class="borderTr">
									<th>颜色</th>
									<th>XS/90CM</th>
									<th>S/100CM</th>
									<th>M/110CM</th>
									<th>L/120CM</th>
									<th>XL/130CM</th>
									<th>XXL/140CM</th>
									<th>合计</th>
								</tr>
								
								<s:iterator value="qcVO.orderDetails" var="orderDetail">
									<tr class="borderTr">
										<td><s:property value='color'/></td>
										<td><s:property value='XS'/></td>
										<td><s:property value='S'/></td>
										<td><s:property value='M'/></td>
										<td><s:property value='L'/></td>
										<td><s:property value='XL'/></td>
										<td><s:property value='XXL'/></td>
										<td><s:property value='total'/></td>
									</tr>
								</s:iterator>
							</table>
						</div>
						<!-- .table-responsive -->
					</div>   
					</div> 
					<div class="right">
					<div >
                    <img src="../images/1.png" id="design_image" class="commdity-graph">
                    </div>
					</div> 
					</div>
					<br/>
					 <div class="row">
					 <s:iterator value="#session.authorityList" id="low">
                     <s:if test="#low.highAuthName=='QC质检单'&&#low.middleAuthName=='质检单列表'&&#low.lowAuthName=='填写质检结果'">
                     <a>当前需质检环节>></a><br/>
                     <p></p>
					 <p><s:property value="current_stage"/></p>
					
					 <br/>
					 <a>质检结果>></a><br/>
					  <p></p>
					  <s:if test="ifAdded=='质检单结果已填写'">
					  <p><s:property value="current_result"/></p>
					  </s:if>
					  <s:else>
					 <form  role="form" id="addForm" name="addForm" method="post" action="<%=request.getContextPath()%>/Qc/addResult?qcID=<s:property value='qcVO.qc.QCID'/>">
					 <textarea id="qcResult" name="qcResult"   style="width:400px;height:100px;"></textarea>
					 <br/>
					  <button type="submit"  id="submit_result"  style="margin: 10px 10px 50px 0px"
				      class="btn btn-primary" onclick="submitresult()">提交</button>
				       <button type="button" id="returnPrevPage" style="margin: 10px 50px 50px 0px"class="btn btn-primary" onclick="history.go(-1);">返回</button><br/>
                     </form>
                     </s:else>
                     </s:if>
                     </s:iterator>
					 
					 
					  
					 <s:iterator value="#session.authorityList" id="low">
                     <s:if test="#low.highAuthName=='QC质检单'&&#low.middleAuthName=='质检单列表'&&#low.lowAuthName=='查看所有环节结果'">
                      <a>所有质检环节和结果>></a>
					 <br/>
					 <p></p>
                      <div class="leftt">
                      
                      <div class="table-responsive" style="margin: 10px 20px 50px 23px">
							<table class="table table-striped">
								<tr>
									<th>质检环节</th>
								</tr>
								<s:iterator value="stageList" var="stage">
									<tr>
                                        <td><s:property value="#stage" /></td>
									</tr>
								</s:iterator>
							</table>
                      </div>
                      </div>
                      <div class="rightt">
                      <div class="table-responsive" style="margin: 10px 50px 50px 23px">
							<table class="table table-striped">
								<tr>
									<th>质检结果</th>
								</tr>
								<s:iterator value="resultList" var="result">
									<tr>
                                        <td><s:property value="#result" /></td>
									</tr>
								</s:iterator>
							</table>
                      </div>
                      </div>
                     </s:if>
                     </s:iterator>
            
            </div>
            </section>
        </aside>
    </div>
    <script type="text/javascript">
    function submitresult(){
    	
    };
    </script>
    <script type="text/javascript">
		formValidate();
		function formValidate() {
			// 在键盘按下并释放及提交后验证提交表单
			$("#addForm").validate({
				"rules" : {
					"qcResult" : {
						'required' : true,
					}
				}
			});
		}
	</script>
	</s:if>
	<s:else>
		<jsp:include page="../../login.jsp"></jsp:include>
	</s:else>
</body>
</html>