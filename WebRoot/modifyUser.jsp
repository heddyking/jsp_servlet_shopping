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
            <p>�û���<input type="text" name="username" class="jip-t" value="<%= rs.getString(2)%>"/></p>
            <p>����<input type="password" name="userpass" class="jip-t"  value="<%=rs.getString(3)%>"/></p>
             
   <p>�Ա�<input name="gender" type="radio" value="��" id="gender" <%if(rs.getString(4).equals("��") )out.println("checked"); %>/>��
    <input name="gender" type="radio" value="Ů" id="gender" <%if(rs.getString(4).equals("Ů") )out.println("checked"); %>/>Ů</p>
   <p>�������ڣ�
   <input type="text" name="birthdate" class="jip-t"  value="<%= rs.getString(5)%>"/></p>
  
 
   <p>����
   <select name="nativeplace" id="province" >
   <option value="�㽭"  <%if(rs.getString(4).equals("�㽭") )out.println("selected"); %>>�㽭</option>
          <option value="����" <%if(rs.getString(4).equals("����") )out.println("selected"); %>>����</option>
          <option value="����" <%if(rs.getString(4).equals("����") )out.println("selected"); %>>����</option>
          <option value="����" <%if(rs.getString(4).equals("����") )out.println("selected"); %>>����</option>
          <option value="�Ϻ�" <%if(rs.getString(4).equals("�Ϻ�") )out.println("selected"); %>>�Ϻ�</option></select></p>
            <p> <input type="submit" value="�ύ"/>
                <input type="reset" value="����"/></p>
      </form> 


<% }%>
 <p><a href="index.jsp">������ҳ</a></p>
         
  </body>
</html>
