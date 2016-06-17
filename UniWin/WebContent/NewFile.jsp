<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<tr>

<td valign="top">

<div style="OVERFLOW-Y: auto; OVERFLOW-X: auto; HEIGHT: 200px ; WIDTH: 100%;">

<form name="pageform" action="<s:url value='/common/commonPage'/>" method="post">

<page:toolbar name="list" formname="pageform" listJspPage="/pages/admin/management/user/listUser.jsp" beanid="cb"

toolBarShow="false" border="0" pagesize="5" listTableId="demo" width="100%" styleClass="table_border">

<page:checkbox id="cb" name="row_id" isNo="true" styleClass="rightcss" titleEvent="onclick='selectBox(this)'" property="row_id" colunmName="Select" />

<page:colunm id="cb" colunmName="User ID" colunmId="login_name" isOrderBy="true"></page:colunm>

<page:colunm id="cb" colunmName="User Name" colunmId="user_name" isOrderBy="true"></page:colunm>

<page:colunm id="cb" colunmName="Position" colunmId="pos_name" isOrderBy="true"></page:colunm>

<page:colunm id="cb" colunmName="Department" colunmId="dept_name" isOrderBy="true"></page:colunm>

<page:colunm id="cb" colunmName="User Status" colunmId="user_status_name" isOrderBy="true"></page:colunm>

</page:toolbar>

</form>

</div>

</td>

</tr>
</body>
</html>