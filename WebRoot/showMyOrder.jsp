<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMyOrder.jsp' starting page</title>
    
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
  <%
    if(session.getAttribute("username")!=null)
    {
        DB db=new DB();
        String sql="select * from ordertable where username='"+session.getAttribute("username")+"'";
        ResultSet rs=db.executeQuery(sql);
        if(session.getAttribute("msg")!=null)
        {
            out.println(session.getAttribute("msg"));
            session.setAttribute("msg",null);
        } 
  %>
        <h1 align="center">�ҵĶ���</h1>
        <hr color="green">
        <table width="1000" border="1" align="center" >
          <tr bgcolor="silver">
            <th align="center">���</th>
            <th align="center">������</th>
            <th align="center">�û���</th>
            <th align="center">��������</th>
            <th align="center">����״̬</th>
            <th align="center">��ַ</th>
            <th align="center">�ջ�������</th>
            <th align="center">�绰����</th>
            <th align="center">�ʱ�</th>
            <th align="center">���ʽ</th>
          </tr>
        <% 
          int i=1;
          while(rs.next())
          {
        %>
          <tr>
            <td align="center"><%=i%></td>
            <td align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><%=rs.getString(3)%></td>
            <td align="center"><%=rs.getString(4)%></td>
            <td align="center"><%=rs.getString(5)%></td>
            <td align="center"><%=rs.getString(6)%></td>
            <td align="center"><%=rs.getString(7)%></td>
            <td align="center"><%=rs.getString(8)%></td>
            <td align="center"><%=rs.getString(9)%></td>
          </tr>
        <%
          i++;
          }
        %>
        </table>
        <a href="userinfo.jsp">����</a>
  <%    
    }
    else
    {
  %>
        <h1>������ʾ</h1>
        <hr color="green"/>
        <br>
                     ����δ��¼����<a href="index.jsp">����ҳ</a>��¼
  <%
    }
  %>
  </body>
</html>
