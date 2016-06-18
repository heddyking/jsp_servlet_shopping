<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showUsers.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%if(session.getAttribute("username")!=null){ 
 DB db=new DB();
String sql="select * from user";
ResultSet rs =db.executeQuery(sql);%>
<table>
<tr><td>序号</td><td>用户名</td><td>性别</td><td>出生年月</td><td>籍贯</td><td>操作</td></tr>
<%int i=1;
while(rs.next()){
String modifyurl="modifyUser.jsp?id="+rs.getInt(1);
String deleteurl="deleteUser.jsp?id="+rs.getInt(1);%>
<tr><td><%=i%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td>
<a href="<%=modifyurl%>">修改</a><a href="<%=deleteurl%>">删除</a>

</td>

</tr>
<% i++;
}%>
</table>
<%}
else
{%>
<a href="reg.jsp">未注册</a>
<%} %>
<a href ="index.jsp">返回主页</a>
  </body>
</html>
