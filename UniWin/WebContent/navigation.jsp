<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

        <aside class="left-side sidebar-offcanvas">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                     <s:iterator value="#session.highAutho" id="highAuthName">
                     <s:if test="#highAuthName=='款式与订单'">
                     <li class="treeview" id="12000">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>款式与订单</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
							<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='款式与订单'&&#middle.middleAuthName=='新建订单'">
                            <li id="12001"><a href="<%=request.getContextPath()%>/Design_Order/showDesignList"><i class="fa fa-angle-double-right"></i>新建订单</a></li>
                            </s:if>
                            </s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    <s:if test="#highAuthName=='物料管理'">
                    <li class="treeview" id="10000">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>物料管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='物料管理'&&#middle.middleAuthName=='物料新增'">
                            <li id="10001"><a href="<%=request.getContextPath()%>/Material/showAddMaterial"><i class="fa fa-angle-double-right"></i> 物料新增</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <!--<li id="10002"><a href="#"><i class="fa fa-angle-double-right"></i> 物料修改</a></li>-->
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='物料管理'&&#middle.middleAuthName=='物料查询'">
                            <li id="10003"><a href="<%=request.getContextPath()%>/Material/showMaterialList"><i class="fa fa-angle-double-right"></i> 物料查询</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='物料管理'&&#middle.middleAuthName=='物料预订查询'">
                            <li id="10005"><a href="<%=request.getContextPath()%>/Material/showApplyList"><i class="fa fa-angle-double-right"></i> 物料预定查询</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='物料管理'&&#middle.middleAuthName=='供应商管理'">
                            <li id="10006"><a href="<%=request.getContextPath()%>/Vendor/showVendorList"><i class="fa fa-angle-double-right"></i> 供应商管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='物料管理'&&#middle.middleAuthName=='款式新增'">
                            <li id="10007"><a href="<%=request.getContextPath()%>/Bom/showAddDesign"><i class="fa fa-angle-double-right"></i> 款式新增</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='物料管理'&&#middle.middleAuthName=='BOM管理'">
                            <li id="10008"><a href="<%=request.getContextPath()%>/Bom/showDesignList"><i class="fa fa-angle-double-right"></i> BOM物料管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='入库管理'">
                    <li class="treeview" id="10100">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>入库管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='入库管理'&&#middle.middleAuthName=='入库'">
                            <li id="10101"><a href="<%=request.getContextPath()%>/Warehouse/materialIn"><i class="fa fa-angle-double-right"></i> 入库</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='入库管理'&&#middle.middleAuthName=='入库单管理'">
                            <li id="10102"><a href="<%=request.getContextPath()%>/Warehouse/materialInManage"><i class="fa fa-angle-double-right"></i> 入库管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>

					<s:if test="#highAuthName=='出库管理'">
                    <li class="treeview" id="10200">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>出库管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='出库管理'&&#middle.middleAuthName=='出库'">
                            <li id="10201"><a href="<%=request.getContextPath()%>/Warehouse/materialOut_showAllStores"><i class="fa fa-angle-double-right"></i> 出库</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='出库管理'&&#middle.middleAuthName=='出库单管理'">
                            <li id="10202"><a href="<%=request.getContextPath()%>/Warehouse/materialOut_showMaterialOutputs"><i class="fa fa-angle-double-right"></i> 出库管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
					<s:if test="#highAuthName=='加工管理'">
                    <li class="treeview" id="10300">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>加工管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='加工管理'&&#middle.middleAuthName=='加工方管理'">
                            <li id="10301"><a href="<%=request.getContextPath()%>/Process/processorlist"><i class="fa fa-angle-double-right"></i> 加工方管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='加工管理'&&#middle.middleAuthName=='收货单管理'">
                            <li id="10302"><a href="<%=request.getContextPath()%>/Process/receivelist"><i class="fa fa-angle-double-right"></i> 收货单管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='加工管理'&&#middle.middleAuthName=='新增外发单'">
                            <li id="10303"><a href="<%=request.getContextPath()%>/pages/process/outsource_new.jsp"><i class="fa fa-angle-double-right"></i> 新增外发单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='加工管理'&&#middle.middleAuthName=='外发单管理'">
                            <li id="10304"><a href="<%=request.getContextPath()%>/Process/outsourcelist"><i class="fa fa-angle-double-right"></i> 外发单管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>

                    <s:if test="#highAuthName=='排单管理'">
                    <li class="treeview" id="10400">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>排单管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='排单管理'&&#middle.middleAuthName=='开始排单'">
                            <li id="10401"><a href="<%=request.getContextPath()%>/listManage/StartOutSourceManage"><i class="fa fa-angle-double-right"></i> 开始排单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='排单管理'&&#middle.middleAuthName=='大货工艺排单'">
                            <li id="10402"><a href="<%=request.getContextPath()%>/listManage/showAllTechniqueOutSource"><i class="fa fa-angle-double-right"></i> 大货工艺排单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='排单管理'&&#middle.middleAuthName=='大货裁剪排单'">
                            <li id="10403"><a href="<%=request.getContextPath()%>/listManage/showAllTailorOutSource"><i class="fa fa-angle-double-right"></i> 大货裁剪排单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='排单管理'&&#middle.middleAuthName=='大货外发排单'">
                            <li id="10404"><a href="<%=request.getContextPath()%>/listManage/outSourceManage"><i class="fa fa-angle-double-right"></i> 大货外发排单</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>

                    <s:if test="#highAuthName=='采购单管理'">
                    <li class="treeview" id="10500">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>采购管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='采购单管理'&&#middle.middleAuthName=='面料采购单管理'">
                            <li id="10501"><a href="<%=request.getContextPath()%>/Purchase/purchaseList"><i class="fa fa-angle-double-right"></i> 面料采购单管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='采购单管理'&&#middle.middleAuthName=='物料采购单管理'">
                            <li id="10502"><a href="<%=request.getContextPath()%>/Purchase/accessoryPurchaseList"><i class="fa fa-angle-double-right"></i> 物料采购单管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='采购单管理'&&#middle.middleAuthName=='毛衣采购管理'">
                            <li id="10503"><a href="#"><i class="fa fa-angle-double-right"></i> NEW毛衣采购管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='工艺管理'">
                    <li class="treeview" id="10600">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>工艺管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='工艺管理'&&#middle.middleAuthName=='新增款式工艺单'">
                            <li id="10601"><a href="<%=request.getContextPath()%>/Technique/initAddTechnique"><i class="fa fa-angle-double-right"></i> 新增款式工艺单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='工艺管理'&&#middle.middleAuthName=='工艺管理'">
                            <li id="10602"><a href="<%=request.getContextPath()%>/Technique/showAllDesigns"><i class="fa fa-angle-double-right"></i> 工艺管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='生产单管理'">
                    <li class="treeview" id="10700">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>生产管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='生产单管理'&&#middle.middleAuthName=='生产单列表'">
                            <li id="10701"><a href="<%=request.getContextPath()%>/Production/productions?page=1"><i class="fa fa-angle-double-right"></i> 生产单列表</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='生产单管理'&&#middle.middleAuthName=='异常积压订单追踪'">
                            <li id="10702"><a href="<%=request.getContextPath()%>/Production/abparams"><i class="fa fa-angle-double-right"></i> 异常积压订单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='生产单管理'&&#middle.middleAuthName=='裁剪单订单预警'">
                            <li id="10703"><a href="<%=request.getContextPath()%>/Production/tailor?page=1"><i class="fa fa-angle-double-right"></i> NEW裁剪单订单预警</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='样衣信息'">
                    <li class="treeview" id="10800">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>样衣信息</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='样衣信息'&&#middle.middleAuthName=='样衣入库'">
                            <li id="10801"><a href="<%=request.getContextPath()%>/Sample/addSample"><i class="fa fa-angle-double-right"></i> 样衣入库</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='样衣信息'&&#middle.middleAuthName=='样衣管理'">
                            <li id="10802"><a href="<%=request.getContextPath()%>/Sample/showAllSamples"><i class="fa fa-angle-double-right"></i> 样衣资料管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='补料单'">
                    <li class="treeview" id="10900">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>补料单</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='补料单'&&#middle.middleAuthName=='面料补料单'">
                            <li id="10901"><a href="<%=request.getContextPath()%>/pages/supplement/liningSupplement_create.jsp"><i class="fa fa-angle-double-right"></i> 面料补料单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='补料单'&&#middle.middleAuthName=='辅料补料单'">
                            <li id="10902"><a href="<%=request.getContextPath()%>/pages/supplement/auxiliarySupplement_create.jsp"><i class="fa fa-angle-double-right"></i> 辅料补料单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='补料单'&&#middle.middleAuthName=='物料补料单'">
                            <li id="10903"><a href="<%=request.getContextPath()%>/Supplement/supplementlist"><i class="fa fa-angle-double-right"></i>物料补料单管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='QC质检单'">
                    <li class="treeview" id="11000">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>QC质检单</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='QC质检单'&&#middle.middleAuthName=='新增质检单'">
                            <li id="11001"><a href="<%=request.getContextPath()%>/Qc/newQc"><i class="fa fa-angle-double-right"></i> 新增质检单</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='QC质检单'&&#middle.middleAuthName=='质检单列表'">
                            <li id="11002"><a href="<%=request.getContextPath()%>/Qc/qclist"><i class="fa fa-angle-double-right"></i> 质检单列表</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='询价单管理'">
                    <li class="treeview" id="11100">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>NEW询价单管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='询价单管理'&&#middle.middleAuthName=='询价单列表'">
                            <li id="11101"><a href="<%=request.getContextPath()%>/Inquiries/show_inquiry_list"><i class="fa fa-angle-double-right"></i> 询价管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='询价单管理'&&#middle.middleAuthName=='询价单'">
                            <li id="11102"><a href="#"><i class="fa fa-angle-double-right"></i> 询价单</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='客户订单管理'">
                    <li class="treeview" id="11200">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>NEW客户订单管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='客户订单管理'&&#middle.middleAuthName=='客户订单管理列表'">
                            <li id="11201"><a href="<%=request.getContextPath() %>/Orders/orders?rowsPerPage=3&page=1"><i class="fa fa-angle-double-right"></i> NEW客户订单管理列表</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='客户订单管理'&&#middle.middleAuthName=='样衣单管理'">
                            <li id="11202"><a href="<%=request.getContextPath() %>/SampleOrders/sampleOrders?rowsPerPage=3&page=1"><i class="fa fa-angle-double-right"></i> NEW样衣单管理</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='图形报表'">
                    <li class="treeview" id="11300">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>图形报表</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='图形报表'&&#middle.middleAuthName=='每日工艺单积压趋势图'">
                            <li id="11301"><a href="<%=request.getContextPath()%>/ConditionSheets/techniqueConditionSheet"><i class="fa fa-angle-double-right"></i> 每日工艺单积压趋势图</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='图形报表'&&#middle.middleAuthName=='每日制版单积压趋势图'">
                            <li id="11302"><a href="<%=request.getContextPath()%>/ConditionSheets/modelConditionSheet"><i class="fa fa-angle-double-right"></i> 每日制版单积压趋势图</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='图形报表'&&#middle.middleAuthName=='环节订单数积压趋势图'">
                            <li id="11303"><a href="<%=request.getContextPath()%>/ConditionSheets/phaseConditionSheet"><i class="fa fa-angle-double-right"></i> 环节订单数积压趋势图</a></li>                       
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='客户管理'">
                    <li class="treeview" id="11400">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>客户管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='客户管理'&&#middle.middleAuthName=='客户管理列表'">
                            <li id="11401"><a href="<%=request.getContextPath()%>/Customer/customerlist"><i class="fa fa-angle-double-right"></i> 客户资料管理</a></li>                        
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
                    
                    <s:if test="#highAuthName=='系统管理'">
                    <li class="treeview" id="11500">
                        <a href="#">
                            <i class="fa fa-th"></i>
                            <span>系统管理</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                        	<s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='系统管理'&&#middle.middleAuthName=='权限设置'">
                            <li id="11501"><a href="<%=request.getContextPath()%>/System/manageRoleAuthority"><i class="fa fa-angle-double-right"></i> 权限设置</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='系统管理'&&#middle.middleAuthName=='角色分配'">
                            <li id="11502"><a href="<%=request.getContextPath()%>/System/manageUserRole"><i class="fa fa-angle-double-right"></i> 角色分配</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='系统管理'&&#middle.middleAuthName=='用户管理'">
                            <li id="11503"><a href="<%=request.getContextPath()%>/System/manageUser"><i class="fa fa-angle-double-right"></i> 用户管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='系统管理'&&#middle.middleAuthName=='模组资料'">
                            <li id="11504"><a href="<%=request.getContextPath()%>/pages/system/manageModule.jsp"><i class="fa fa-angle-double-right"></i> 模组资料</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='系统管理'&&#middle.middleAuthName=='组织管理'">
                            <li id="11505"><a href="<%=request.getContextPath()%>/System/manageDepartment"><i class="fa fa-angle-double-right"></i> 组织管理</a></li>
                            </s:if>
                            </s:iterator>
                            
                            <s:iterator value="#session.highMiddleAutho" id="middle">
							<s:if test="#middle.highAuthName=='系统管理'&&#middle.middleAuthName=='系统异常参数设置'">
                            <li id="11506"><a href="<%=request.getContextPath()%>/System/manageAbnormalParameter"><i class="fa fa-angle-double-right"></i> 系统异常参数设置</a></li>
                        	</s:if>
                        	</s:iterator>
                        </ul>
                    </li>
                    </s:if>
					</s:iterator>
                </ul>
            </section>
        </aside>
        
        <script type="text/javascript">
           	function changeTab(step_1,step_2){
           		$("head > title").html("联胜供应链管理系统");  
        		$("#"+step_1).addClass("active");
        		$("#"+step_1+ " .treeview-menu").css("display","block");
     			$("#"+step_1+ " .pull-right").removeClass("fa-angle-left");
     			$("#"+step_1+ " .pull-right").addClass("fa-angle-down");
      			$("#"+step_2).addClass("active");         		
           	}
        </script>
