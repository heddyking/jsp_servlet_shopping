package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Tools;
import java.sql.*;

public class RegServlet extends HttpServlet {

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

		//�Ƚ��ձ���������������
		String username=Tools.CodeToString(request.getParameter("username"));
		String userpass=request.getParameter("userpass");
		String gender=Tools.CodeToString(request.getParameter("gender"));
		String birthdate=request.getParameter("birthdate");
		String nativeplace=Tools.CodeToString(request.getParameter("nativeplace"));
		HttpSession session=request.getSession();
		
		//��ʼ�����е����ݿ����ӵı���
		String url="jdbc:mysql://localhost:3306/class";
		String user="root";
		String password="admin";
		String sql="select * from user where username='"+username+"'"; //ʡ�Ժű�ʾҪ��������sql���
		//System.out.println(sql);
		//������������
		Connection conn=null; //�������ݿ����ӵĶ���
		Statement stmt=null; //��������ִ��SQL����Statement����
		ResultSet rs=null; //�������������

		//������ݿ����ӵ���������
		try
		{
			//�������Ӳ�ִ�����
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			//��������
			if(rs.next())
			{
				//�û����Ѵ���
				session.setAttribute("reg_error", "�û����Ѿ����ڣ�������ע��");
				response.sendRedirect("reg.jsp");
			}
			else
			{
				//session.setAttribute("msg", "��¼ʧ�ܣ�");
				StringBuffer newsql=new StringBuffer();
				newsql.append("insert into user (username, userpass, gender,birthdate,nativeplace) values ('");
				newsql.append(username);
				newsql.append("','");
				newsql.append(userpass);
				newsql.append("','");
				newsql.append(gender);
				newsql.append("','");
				newsql.append(birthdate);
				newsql.append("','");
				newsql.append(nativeplace);
				newsql.append("')");
				int a=stmt.executeUpdate(newsql.toString());
				if(a>0)
				{
					session.setAttribute("msg", "ע��ɹ���");
				}
				else
				{
					session.setAttribute("msg", "ע��ʧ�ܣ�");
				}
				response.sendRedirect("check.jsp");
			}
			
		}
		catch(SQLException se)
		{
			throw new ServletException(se);
		}
		finally
		{
			try{rs.close();}catch(SQLException se){}
			try{conn.close();}catch(SQLException se){}
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
		String classname="com.mysql.jdbc.Driver";
		try
		{
			Class.forName(classname);
		}
		catch(ClassNotFoundException ce)
		{
			throw new ServletException("�������ݿ�����ʧ��");
		}
	}

}