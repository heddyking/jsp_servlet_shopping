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
    <form method="post" action="LoginServlet" name="form1" onsubmit="return isValidate(form1)">
    <p><br></p><p>�˻���¼��<br></p><p>�û�����<input type="text" name="username" value="shidun"></p>
    <p>���룺 <input type="password" name="userpass"  value="123"></p>
    <p>&nbsp;<input type="submit" value="�ύ" name="submit">
    <input type="reset" value="����" name="reset"></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
        <a href="reg.jsp">��Ҫע��</a>
    
    <a href="c_manager.jsp">����Ա</a>
    </form>
    
    </div>>
  </body>
</html>
