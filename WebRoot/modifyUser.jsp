<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import ="java.sql.*" %>
<%@ page import="bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
    
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
   <% DB db=new DB();
String sql="select * from user where Id="+request.getParameter("id");
ResultSet rs=db.executeQuery(sql);
if(rs.next())
{%>
<form name="form1" method="post" action="ModifyServlet?id=<%= request.getParameter("id") %>">   
            <p>用户名<input type="text" name="username" class="jip-t" value="<%= rs.getString(2)%>"/></p>
            <p>密码<input type="password" name="userpass" class="jip-t"  value="<%=rs.getString(3)%>"/></p>
             
   <p>性别<input name="gender" type="radio" value="男" id="gender" <%if(rs.getString(4).equals("男") )out.println("checked"); %>/>男
    <input name="gender" type="radio" value="女" id="gender" <%if(rs.getString(4).equals("女") )out.println("checked"); %>/>女</p>
   <p>出生日期：
   <input type="text" name="birthdate" class="jip-t"  value="<%= rs.getString(5)%>"/></p>
  
 
   <p>籍贯
   <select name="nativeplace" id="province" >
   <option value="浙江"  <%if(rs.getString(4).equals("浙江") )out.println("selected"); %>>浙江</option>
          <option value="江苏" <%if(rs.getString(4).equals("江苏") )out.println("selected"); %>>江苏</option>
          <option value="安徽" <%if(rs.getString(4).equals("安徽") )out.println("selected"); %>>安徽</option>
          <option value="北京" <%if(rs.getString(4).equals("北京") )out.println("selected"); %>>北京</option>
          <option value="上海" <%if(rs.getString(4).equals("上海") )out.println("selected"); %>>上海</option></select></p>
            <p> <input type="submit" value="提交"/>
                <input type="reset" value="重置"/></p>
      </form> 


<% }%>
 <p><a href="index.jsp">返回首页</a></p>
         
  </body>
</html>
