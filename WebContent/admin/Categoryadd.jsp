<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.util.*" %>
 <%@ include file="_sessioncheck.jsp"  %>
<%
	String strPid = request.getParameter("pid");
	int pid = 0;
	if(strPid != null)
	{
		pid = Integer.parseInt(strPid);
	}

	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("add"))
	{
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");

		if(pid==0){
			Category.addTopCategory(name,descr);
		}else
		{
			Category parent = Category.loadById(pid);
			Category child = new Category();
			child.setId(-1);
			child.setName(name);
			child.setDescr(descr); 
			parent.addChild(child);
		}
			out.println("Congratulation! Resgistered OK!");
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bjsxt.shopping.util.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>添加分类</title>
</head>
<body>
	<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;金尚商城 &raquo; <br></td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody>
<form method="post" name="register" action="Categoryadd.jsp">
<input type="hidden" name="action" value="add"/>
<input type="hidden" name="pid" value="<%=pid%>"/>
<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">添加类别 - 必填内容</td>
</tr>
<tr>
<td class="altbg1" width="21%">类别名称:</td>
<td class="altbg2"><input name="name" size="25" maxlength="25" type="text"> 
</tr>

<tr>
<td class="altbg1" valign="top">类别描述:</td>
<td class="altbg2"><textarea name="descr" cols="60" rows="5" id="descr"></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>

</body>
</html>