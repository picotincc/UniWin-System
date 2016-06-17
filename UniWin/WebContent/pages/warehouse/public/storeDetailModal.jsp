<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 模态框（Modal） -->
	<div  class="modal fade" id="detailModel" tabindex="-1" role="dialog" 
	    aria-hidden="true">
	   <div class="modal-dialog" style="width:800px;position:absolute;left:300px">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" 
	               aria-hidden="true">×
	            </button>
	            <h4 class="modal-title" >
	               物料基础信息：
	            </h4>
	         </div>
	         <div class="modal-body">
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">物料名称：</label><label id="materialName"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料编号：</label><label id="materialCode"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">物料类型：</label><label id="materialType"></label>
	           		</div>
	           </div>
	           <div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">物料单价：</label><label id="unitPrice"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">色号：</label><label id="colorCode"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">颜色说明：</label><label id="colorDescription"></label>
	           		</div>
	           </div>
	           <div class="row">
	           		<div class="col-md-12">
	           			<label class="control-label">物料成分：</label><label id="materialIngredient"></label>
	           		</div>
<!-- 	           		<div class="col-md-4"> -->
<!-- 	           			<label class="control-label">物料名称：</label><label id=""></label> -->
<!-- 	           		</div> -->
<!-- 	           		<div class="col-md-4"> -->
<!-- 	           			<label class="control-label">物料名称：</label><label id=""></label> -->
<!-- 	           		</div> -->
	           </div>
	         </div>
	         <div class="modal-header">
		         <h4 class="modal-title" >
		              仓库信息：
		         </h4>
	         </div>
	         <div class="modal-body">
	         	<div class="row">
	           		<div class="col-md-4">
	           			<label class="control-label">库存数量：</label><label id="remainVol"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">可用库存：</label><label id="remain"></label>
	           		</div>
	           		<div class="col-md-4">
	           			<label class="control-label">单位：</label><label id="unit"></label>
	           		</div>
	         	</div>
	         	<div class="row">
	         		<div class="col-md-12">
	         			<label class="control-label">仓储位置：</label><label id="location"></label>
	         		</div>
	         	</div>
	         </div>
	         <div class="modal-header">
		         <h4 class="modal-title" >
		              供应商信息：
		         </h4>
	         </div>
	         <div class="modal-body">
	         	<div class="row">
	         	<div class="col-md-12">
	         		<table class="table-responsive table-striped table table-hover table-bordered">
						<thead>
						        				<tr>
						        					<th>供应商编号</th>
						        					<th>供应商名称</th>
						        					<th>联系电话</th>
						        					<th>地址</th>
						        				</tr>
						 	</thead>
						 	<tbody id="vendors">
						 	</tbody>
					</table>
	         	</div>
	         	</div>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">返回
	            </button>
	         </div>
	      </div><!-- /.modal-content -->
	   </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->