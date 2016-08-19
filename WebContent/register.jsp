<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="com.bjsxt.shopping.util.*"%>
 <%
 	request.setCharacterEncoding("GB18030");
  	String action = request.getParameter("action");
  	if(action !=null && action.equals("register"))
  	{
  		String username = request.getParameter("username");
  		String password = request.getParameter("password");
  		String phone = request.getParameter("phone");
  		String addr = request.getParameter("addr");
  		User u = new User();
  		u.setUsername(username);
  		u.setPassword(password);
  		u.setPhone(phone);
  		u.setAddr(addr);
  		u.setRdate(new Date());
  		u.save();
  		
  	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<script type="text/javascript">
	var req;
	function validate() {
		var idField = document.getElementById("userid");
		var url = "Validate.jsp?id=" + escape(idField.value);
		if(window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("GET", url, true);
		req.onreadystatechange = callback;
		req.send(null);
	}
	
	function callback() {
		if(req.readyState == 4) {
			if(req.status == 200) {
				//alert(req.responseText);
				var msg = req.responseXML.getElementsByTagName("msg")[0];
				//alert(msg);
		        setMsg(msg.childNodes[0].nodeValue);
			}
		}
	}
	
	function setMsg(msg) {
		//alert(msg);
		mdiv = document.getElementById("usermsg");
		if(msg == "invalid") {
			mdiv.innerHTML = "<font color='red'>username exists</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>congratulations! you can use this username!</font>";
		}
	}
	

</script>
</head>
<body>
	<form method="post" name="register" action="register.jsp" onSubmit="this.regsubmit.disabled=true;">
	<input type="hidden" name="action" value="register"/>
	
	<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
	<tbody><tr>
	<td colspan="2" class="header">注册 - 必填内容</td>
	</tr>
	<tr>
	<td class="altbg1" width="21%">用户名:</td>
	<td class="altbg2"><input id="userid" name="username" size="25" maxlength="25" type="text" onblur="validate()"> 
	<span id="usermsg"></span>
	</tr>
	
	<tr>
	<td class="altbg1">密码:</td>
	<td class="altbg2"><input name="password" size="25" type="password"></td>
	</tr><tr>
	<td class="altbg1">确认密码:</td>
	<td class="altbg2"><input name="password2" size="25" type="password"></td>
	</tr>
	
	<tr>
	<td class="altbg1">&#30005;&#35805;:</td>
	<td class="altbg2"><input name="phone" type="text" id="phone" size="25"></td>
	</tr>
	
	<tr>
	<td class="altbg1" valign="top">送货地址:</td>
	<td class="altbg2"><textarea name="addr" cols="60" rows="5" id="addr"></textarea></td>
	</tr>
	</tbody></table>
	<br>
	<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
	</form>

</body>
</html>
