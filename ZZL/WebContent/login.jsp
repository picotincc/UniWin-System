<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.error{
	color:#FF3030;
	font-family:"Arial";
	font-size:8px;
}
</style>
<!-- 登录 -->
<form id="loginForm" action="<%=request.getContextPath() %>/System/userLogin" style="margin:0 auto;width:450px;padding:10px 30px;text-align:center;margin-top:150px;">
	<img src="<%=request.getContextPath() %>/images/ls-logo.png" style="vertical-align:middle;width:60%;height:auto;">
	<div style="width:100%;_height:40px;min-height:40px;margin-top:10%;">
		<a style="color:white;float:left;">账号：</a>
		<input type="text" id="account" name="account" style="float:left;padding:5px 10px;border:1px solid #EEE9E9;border-radius:3px;width:80%;">
     	</div><br/>
     	<div style="width:100%;_height:40px;min-height:40px;">
     		<a style="color:white;float:left;">密码：</a>
		<input type="password" id="password" name="password" style="float:left;padding:5px 10px;border:1px solid #EEE9E9;border-radius:3px;width:80%;">
     	</div><br/><br/>
     	<button type="submit" class="btn btn-success" style="width:80%;background-color:#1abb48;">登录</button>
</form>

<script type="text/javascript">
	color();
	function color(){
		$("body").css("background-color","#3c8dbc");
	}
</script>
<script type="text/javascript">
	formValidate();
	function formValidate() {
		// 在键盘按下并释放及提交后验证提交表单
	  	$("#loginForm").validate({
		    "rules": {
			      "account": {
			        'required': true,
			        'minlength': 2
			      },
			      "password": {
			        'required': true,
			        'minlength': 5
			      },
			    "messages": {
			      'account': {
			        'required': "请输入账号",
			        'minlength': "用户名必需由两个字母组成"
			      },
			      'password': {
			        'required': "请输入密码",
			        'minlength': "密码长度不能小于 5 个字母"
			      }
			    }
		    }
		});
	}
</script>
<!-- 登录 -->