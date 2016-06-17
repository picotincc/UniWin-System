change();
function change(){
    $("#prevpage").hover(function() {
        $("#prevpage").attr("src", "../images/bprev.png");
    }, function() {
        $("#prevpage").attr("src", "../images/prev.png");
    });
    $("#nextpage").hover(function() {
        $("#nextpage").attr("src", "../images/bnext.png");
    }, function() {
        $("#nextpage").attr("src", "../images/next.png");
    });
    $("#firstpage").hover(function() {
        $("#firstpage").attr("src", "../images/bfirst.png");
    }, function() {
        $("#firstpage").attr("src", "../images/first.png");
    });
    $("#lastpage").hover(function() {
        $("#lastpage").attr("src", "../images/blast.png");
    }, function() {
        $("#lastpage").attr("src", "../images/last.png");
    });
}
function jumpPage(page){
	var url = window.location.href.split("?")[0];
	url += "?page="+page;
    var purl = location.search; //获取url中"?"符后的字串
    var paramsList = new Object();
    if (purl.indexOf("?") != -1) {
       var str = purl.substr(1);
       strs = str.split("&");
       for(var i = 0; i < strs.length; i ++) {
          paramsList[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
       }
    }
    //获取其余参数项
    for (var j in paramsList){
    	if(j!="page"){
    		url+= "&"+j+"="+paramsList[j];
    	}
    }
    //alert(url);
    window.location.href = url;
}
function jumpPageSize(pageSize){
	var url = window.location.href.split("?")[0];
	url += "?page=1&rowsPerPage="+pageSize;
    var purl = location.search; //获取url中"?"符后的字串
    var paramsList = new Object();
    if (purl.indexOf("?") != -1) {
       var str = purl.substr(1);
       strs = str.split("&");
       for(var i = 0; i < strs.length; i ++) {
          paramsList[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
       }
    }
    //获取其余参数项
    for (var j in paramsList){
    	if(j!="rowsPerPage"&&j!="page"){
    		url+= "&"+j+"="+paramsList[j];
    	}
    }
    //alert(url);
    window.location.href = url;
}

