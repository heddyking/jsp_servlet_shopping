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
		  var receivename=form.receivename.value;
		  var tele=form.tele.value;
		  if(receivename.length==0){   //usname==""
		  	alert("�������ջ���������");
		  	return false;
		}
		  if(tele.length==0){   //usname==""
		  	alert("����д���룡");
		  	return false;
		}
			return true;
		}
	
	</script>
  </head>
  
  <body > 
  <div align="center">
    <form method="post" action="BuyServlet" name="form3" onsubmit="return isValidate(form3)">
    <p>�ջ���������
   <input type="text" name="receivename"/></p>        
   <p>�绰���룺
   <input type="text" name="tele"/></p>
   <p>��ַ��
   <input type="text" name="address"/></p>
   <p>�ʱࣺ
   <input type="text" name="zipcode"/></p>
   <p>���ʽ��
    <select name="paymode" id="pay" >
   <option value="֧����"  selected="selected">֧����</option>
          <option value="����" selected="selected">����</option>
          <option value="ũҵ����" selected="selected">ũҵ����</option>
          <option value="��������" selected="selected">��������</option>
          <option value="�й�����" selected="selected">�й�����</option></select></p>
 <input name="submit" type="submit" id="submit" value="�ύ" onclick="javascript:validate(form1)" />
        <input name="reset" type="reset" id="reset" value="����" />
 <p><a href="cart.jsp">����</a></p>
    </form>
    
    </div>>
  </body>
</html>
