<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��½</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		function isValidate(form){
		  var username=form.username.value;
		  var userpass=form.userpass.value;
		  if(username.length==0){   //usname==""
		  	alert("�������û�����");
		  	return false;
		}
		  if(userpass.length==0){   //usname==""
		  	alert("���������룡");
		  	return false;
		}
			return true;
		}
	
	</script>

  </head>
  
  <body > 
  <div align="center">
    <form method="post" action="RegServlet" name="form1" onsubmit="return isValidate(form1)">
    <p><br></p><p>�û�ע��></p><p>�û�����<input type="text" name="username" ></p>
    <p>���룺 <input type="password" name="userpass"></p>
    <p>�Ա�:&nbsp&nbsp&nbsp&nbsp&nbsp<input name="gender" type="radio" value="��"/>��&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp<input name="gender" type="radio" value="Ů"/>Ů</p>
   <p>�������ڣ�
   <input type="text" name="birthdate"/></p>
    <p>����
   <select name="nativeplace" id="province" >
   <option value="�㽭"  selected="selected">�㽭</option>
          <option value="����" selected="selected">����</option>
          <option value="����" selected="selected">����</option>
          <option value="����" selected="selected">����</option>
          <option value="�Ϻ�" selected="selected">�Ϻ�</option></select></p>
    <p>&nbsp;<input type="submit" value="�ύ" name="submit">
    <input type="reset" value="����" name="reset"></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    </form>
   
      <a href ="showUsers.jsp">�鿴�û�</a>
      <%if(session.getAttribute("reg_error")!=null){
      out.println(session.getAttribute("reg_error")); 
      session.setAttribute("reg_error",null);
      }%>
      <p><a href="index.jsp">������ҳ</a></p>
    </div>
  </body>
</html>
