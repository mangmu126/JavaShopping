<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.util.*,com.bjsxt.shopping.*,java.util.*" %>
 <%@ include file="_sessioncheck.jsp"  %>
<%
	List<Category> categories = Category.getCategories();
	
	String action = request.getParameter("action");
	if(action!=null && action.trim().equals("complexsearch"))
	{
		String keyword = request.getParameter("keyword");
		double lowNormalPrice = Double.parseDouble(request.getParameter("lowNormalPrice"));
		double highNormalPrice = Double.parseDouble(request.getParameter("highNormalPrice"));
		double lowMemberPrice = Double.parseDouble(request.getParameter("lowMemberPrice"));
		double highMemberPrice = Double.parseDouble(request.getParameter("highMemberPrice"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		int[] idArray;
		if(categoryId==0){
			idArray=null;
		}else
		{
			idArray = new int[1];
			idArray[0] = categoryId;
		}
		Timestamp startDate;
		String strStartDate = request.getParameter("startDate");
		if(strStartDate == null || strStartDate.trim().equals("")){
			startDate = null;
		}else
		{
			startDate = Timestamp.valueOf(request.getParameter("startDate"));
		}
		
		Timestamp endDate;
		String strEndDate = request.getParameter("endDate");
		if(strEndDate == null || strEndDate.trim().equals("")){
			endDate = null;
		}else
		{
			endDate = Timestamp.valueOf(request.getParameter("endDate"));
		}
		
		
		
		List<Product> products = ProductMgr.getInstance().findProducts(idArray,keyword,lowNormalPrice,highNormalPrice,lowMemberPrice,highMemberPrice,startDate,endDate,1,3);
		out.println(products.size());
		
		%>
		<center>搜索结果</center>
		<table border="1" align="center">
		<tr>
		<td>
			ID
		</td>
		<td>
			用户名
		</td>
		<td>
			描述
		</td>
		<td>
			普通价钱
		</td>
		<td>
			会员价钱
		</td>	
		<td>
			时间
		</td>	
		<td>
			栏目id
		</td>
		<td>
			操作
		</td>
		</tr>
		
			<%
				for(Iterator<Product> it = products.iterator();it.hasNext();)
				{
					Product p = it.next();
					
			%>
			<tr>
					<td><%=p.getId() %></td>
					<td><%=p.getName() %></td>
					<td><%=p.getDescr() %></td>
					<td><%=p.getNormalPrice() %></td>
					<td><%=p.getMemberPrice() %></td>
					<td><%=p.getCategoryId() %></td>
					<td><%=p.getPdate() %></td>
					<td><a href="productdelete.jsp?id=<%=p.getId() %>">删除</a><a href="productmodify.jsp?id=<%=p.getId() %>">修改</a></td>
			</tr>
			<% } %>
		
		
	</table>
		<% 
		
		return ;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bjsxt.shopping.util.User"%>
<%@page import="com.bjsxt.shopping.Product"%>
<%@page import="java.sql.Timestamp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>添加分类</title>
</head>
<body>
	<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;金尚商城 &raquo; <br></td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody>
<center>
			简单搜索
			<form name="simple" action="SearchResult.jsp" method="get">
				<input type="text" size="10" name="keyword" />
				搜索
				<input value="提 &nbsp; 交" type="submit">
			</form>
			<br>
			<form name="complex" action="Productsearch.jsp" method="post"
				>
				<input type="hidden"  name="action" value="complexsearch" />
				<table width="750" align="center" border="2">
					<tr>
						<td colspan="2" align="center">
							高级搜索
						</td>
					</tr>
					<tr>
						<td>
							类别：
						</td>
						<td>
							<select name="categoryId"
								style="font-size: 9pt; color: rgb(85, 85, 85);">
								<option selected="selected" value="-1">
									--所有商品--
								</option>
								<%
										
									for (int i = 0; i < categories.size(); i++) {
										Category c = categories.get(i);
										String preStr = "";
										for (int j = 1; j < c.getGrade(); j++) {
											preStr += "--";
										}
								%>
								<option value="<%=c.getId()%>|<%=c.getGrade()%>">
									<%=preStr + c.getName()%>
								</option>
								<%
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							产品名：
						</td>
						<td>
							<input type=text name="name" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							市场价格
						</td>
						<td>
							From:
							<input type=text name="lowNormalPrice" size="15" maxlength="12">
							To
							<input type=text name="highNormalPrice" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							会员价格
						</td>
						<td>
							From:
							<input type=text name="lowMemberPrice" size="15" maxlength="12">
							To
							<input type=text name="highMemberPrice" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							日期
						</td>
						<td>
							From:
							<input type=text name="startDate" size="15" maxlength="12">
							To
							<input type=text name="endDate" size="15" maxlength="12">
						</td>
					</tr>

					<tr>
						<td></td>
						<td>
							<input type="submit" value="提交">
							<input type="reset" value="重置">
						</td>
					</tr>

				</table>
			</form>
		</center>
</body>
</html>