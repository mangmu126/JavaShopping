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
		<center>�������</center>
		<table border="1" align="center">
		<tr>
		<td>
			ID
		</td>
		<td>
			�û���
		</td>
		<td>
			����
		</td>
		<td>
			��ͨ��Ǯ
		</td>
		<td>
			��Ա��Ǯ
		</td>	
		<td>
			ʱ��
		</td>	
		<td>
			��Ŀid
		</td>
		<td>
			����
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
					<td><a href="productdelete.jsp?id=<%=p.getId() %>">ɾ��</a><a href="productmodify.jsp?id=<%=p.getId() %>">�޸�</a></td>
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
<title>��ӷ���</title>
</head>
<body>
	<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;�����̳� &raquo; <br></td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody>
<center>
			������
			<form name="simple" action="SearchResult.jsp" method="get">
				<input type="text" size="10" name="keyword" />
				����
				<input value="�� &nbsp; ��" type="submit">
			</form>
			<br>
			<form name="complex" action="Productsearch.jsp" method="post"
				>
				<input type="hidden"  name="action" value="complexsearch" />
				<table width="750" align="center" border="2">
					<tr>
						<td colspan="2" align="center">
							�߼�����
						</td>
					</tr>
					<tr>
						<td>
							���
						</td>
						<td>
							<select name="categoryId"
								style="font-size: 9pt; color: rgb(85, 85, 85);">
								<option selected="selected" value="-1">
									--������Ʒ--
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
							��Ʒ����
						</td>
						<td>
							<input type=text name="name" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							�г��۸�
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
							��Ա�۸�
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
							����
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
							<input type="submit" value="�ύ">
							<input type="reset" value="����">
						</td>
					</tr>

				</table>
			</form>
		</center>
</body>
</html>