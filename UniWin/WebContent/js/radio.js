/**
 * 表格中选择第几行,当前radio选中，其余radio置为未选中状态
 */
function getRowObj(obj){             //获取行对象 
	var i = 0;   
	while(obj.tagName.toLowerCase() != "tr"){    
		obj = obj.parentNode;    
		if(obj.tagName.toLowerCase() == "table")
			return null;   
	}   
	return obj;
}
function judgeSelected(obj){         //当前行被选中(单选)
	var trObj = getRowObj(obj); 
	var trChilds = trObj.children;
	var tdObj = trChilds[0];
	var iradio_minimalChilds = tdObj.getElementsByTagName("div");
	var iradio_minimal = iradio_minimalChilds[0];
	iradio_minimal.className = "iradio_minimal hover checked";
	iradio_minimal.setAttribute('aria-checked', true);
	var input = iradio_minimal.getElementsByTagName("input")[0];
	input.setAttribute('checked', 'checked');
	setClearSelected(trObj);
}
function judgeSelectedCheckbox(obj){         //当前行被选中(复选)
	var trObj = getRowObj(obj); 
	var trChilds = trObj.children;
	var tdObj = trChilds[0];
	var icheckbox_minimalChilds = tdObj.getElementsByTagName("div");
	var icheckbox_minimal = icheckbox_minimalChilds[0];
	icheckbox_minimal.className = "icheckbox_minimal checked hover";
	icheckbox_minimal.setAttribute('aria-checked', true);
	var input = icheckbox_minimal.getElementsByTagName("input")[0];
	input.setAttribute('checked', 'checked');
}
function setClearSelected(trObj){   //取消其余行的被选中
	var trArr = trObj.parentNode.children; 
	for(var trNo= 0; trNo < trArr.length; trNo++){
		if(trObj != trObj.parentNode.children[trNo]){    
			var trChilds = trObj.parentNode.children[trNo].children;
	    	var tdObj = trChilds[0];
	    	var iradio_minimalChilds = tdObj.getElementsByTagName("div");
	    	var iradio_minimal = iradio_minimalChilds[0];
	    	iradio_minimal.className = "iradio_minimal";
	    	iradio_minimal.setAttribute('aria-checked', false);
	    	var input = iradio_minimal.getElementsByTagName("input")[0];
	    	input.removeAttribute('checked');
		} 
	}
}

function getRowNo(obj){              //输出当前行的行号
	var trObj = getRowObj(obj);    
	var trArr = trObj.parentNode.children; 
	for(var trNo= 0; trNo < trArr.length; trNo++){
		if(trObj == trObj.parentNode.children[trNo]){    
			alert(trNo+1);  
		} 
	}
}
