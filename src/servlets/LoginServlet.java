package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;
import bean.Tools;

import java.sql.*;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

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

		//���ܿͻ��˴��������û���������
		String username=Tools.CodeToString(request.getParameter("username"));
		String userpass=request.getParameter("userpass");
		
		//��ʼ���������ݿ��Ҫ��Ϣ
		String url="jdbc:mysql://localhost:3306/class";
		String user="root";
		String pass=DB.password;
		String sql="select * from user where username='"+username+"' and userpass='"+userpass+"'";
		Connection conn=null;//DriverManager.getConnection(url,user,pass);
		Statement stmt=null;
		ResultSet rs=null;
		try{
			conn=DriverManager.getConnection(url,user,pass);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			//��֤��������û��������Ƿ������ݿ��д���
			HttpSession session=request.getSession();//session��ʼ��
			
			//session.setAttribute("userpass", userpass);
			if(rs.next())
			{
				session.setAttribute("username", username);
				session.setAttribute("msg", "��¼�ɹ���");
				response.sendRedirect("userinfo.jsp");
			}else{
				session.setAttribute("msg", "��¼ʧ�ܣ�");
				response.sendRedirect("logincheck.jsp");
			}
			
		}catch(SQLException se){
			throw new ServletException(se);
		}finally{
			try{rs.close();}catch(SQLException se){}
			try{stmt.close();}catch(SQLException se){}
			try{conn.close();}catch(SQLException se){}
		}
		
		
		/*response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();*/
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
		String classname="com.mysql.jdbc.Driver";
	try{
		Class.forName(classname);
	}catch(ClassNotFoundException ce){
		throw new ServletException("�������ݿ�����ʧ�ܣ�");
	}
	
		
		// Put your code here
	}

}
