package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;

public class BuyServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//��ȡ�ջ���Ϣ
		String address=Tools.CodeToString(request.getParameter("address"));
		String receivename=Tools.CodeToString(request.getParameter("receivename"));
		String tele=request.getParameter("tele");
		String zipcode=request.getParameter("zipcode");
		String paymode=Tools.CodeToString(request.getParameter("paymode"));
		HttpSession session=request.getSession();
		
		String username=(String)session.getAttribute("username");
		int orderstate=0;
		
		//��ȡ��ǰ��ʱ��
		java.util.Date day=new java.util.Date();
		//��ʽ����yyyyMMdd��ʽ��ע���Сд
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
		String orderdate=format.format(day);
		
		String now=(String)(day.toLocaleString());  //��ǰ������ʱ��
		//��ѯ����Ķ�����Ŀ
		String sql="select count(*) from ordertable where orderdate='"+orderdate+"'";
		DB db=new DB();
		ResultSet rs=null;	int i=0;
		try
		{
			rs=db.executeQuery(sql);
			if(rs.next())
			{
				i=rs.getInt(1); //��ȡ�˵���Ķ�����Ŀ
			}
			i++;	//�˶��������
		}catch(Exception e){e.printStackTrace();}finally{db.close();}
		String str_i=String.valueOf(i); //ת���ַ�����ʽ
		while(str_i.length()<3)
		{	//��ʽ������λ���ַ���
		    str_i="0"+str_i;
		}
		String orderid=now+str_i;	
		orderid=orderid.replace("-","");	//�����ڸ�ʽ�е��ر���ţ��ո�ȣ���ȥ
		orderid=orderid.replace(" ","");
		orderid=orderid.replace(":","");
		
		//��װ��һ��order
		OrderBean order=new OrderBean();
		order.setOrderid(orderid);
		order.setUsername(username);
		order.setOrderdate(orderdate);
		order.setOrderstate(orderstate);
		order.setAddress(address);
		order.setReceivename(receivename);
		order.setTele(tele);
		order.setZipcode(zipcode);
		order.setPaymode(paymode);
		
		//�ѵ�ǰ�Ĺ��ﳵȡ����
		ArrayList cart=(ArrayList)session.getAttribute("cart");
		
		//����add����
		boolean mark=order.add(cart);
		if(mark)
		{
			session.setAttribute("cart", null);
			session.setAttribute("total", 0);
			response.sendRedirect("userinfo.jsp");
		}
		else
		{
			response.sendRedirect("cart.jsp");
		}


	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
