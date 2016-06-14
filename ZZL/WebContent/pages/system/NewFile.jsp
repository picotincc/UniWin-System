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
        
        .jstree-node.jstree-leaf .jstree-icon.jstree-themeicon {
            background-position: -102px -70px;
		    background-repeat: no-repeat;
        }
    </style>

    <title>ZZL</title>
</head>

<body class="skin-blue">
    <!-- header logo: style can be found in header.less -->
    <header class="header">
        <a href="index.html" class="logo">
        <!-- Add the class icon to your logo image or logo icon to add the margining -->
            智&nbsp造&nbsp链
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
        </nav>
    </header>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../../navigation.jsp"></jsp:include> 
        
        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                                          系统管理
                    <small>模组管理</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">            	
            	<div class="row">
                    <div class="col-md-3" id="tree-container">
                    	
                    </div>
                    <div class="col-md-9">
                    	
                    </div>
                </div>           
            </section>
        </aside>
    </div>
    
    <script type="text/javascript" src="//cdn.bootcss.com/jstree/3.2.1/jstree.min.js"></script>
    <script type="text/javascript">
    (function() {
   	  $('#tree-container').jstree({
   	    'core' : {
   	      'data' : {
   	        "url" : "<%=request.getContextPath()%>/System/getModuleTree",
   	        "data" : function (node) {
   	          console.log(node);
   	          return { "id" : node.id };
   	        }
   	      }
   	    }
   	  }).on('select_node.jstree', function(event, data) {
   		if(data.node.children.length === 0) {
   		  console.log('点击叶节点', event, data)
   		}
   	  });
   	})();
    </script>


</body>
</html>