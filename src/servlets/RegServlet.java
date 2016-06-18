package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;
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

		//先接收表单传过来的数据
		String username=Tools.CodeToString(request.getParameter("username"));
		String userpass=request.getParameter("userpass");
		String gender=Tools.CodeToString(request.getParameter("gender"));
		String birthdate=request.getParameter("birthdate");
		String nativeplace=Tools.CodeToString(request.getParameter("nativeplace"));
		HttpSession session=request.getSession();
		
		//初始化所有的数据库连接的变量
		String url="jdbc:mysql://localhost:3306/class";
		String user="root";
		String password=DB.password;
		String sql="select * from user where username='"+username+"'"; //省略号表示要输入具体的sql语句
		//System.out.println(sql);
		//创建各个对象
		Connection conn=null; //建立数据库连接的对象
		Statement stmt=null; //创建用于执行SQL语句的Statement对象
		ResultSet rs=null; //创建结果集对象

		//完成数据库连接的整个过程
		try
		{
			//建立连接并执行语句
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			//其它操作
			if(rs.next())
			{
				//用户名已存在
				session.setAttribute("reg_error", "用户名已经存在，请重新注册");
				response.sendRedirect("reg.jsp");
			}
			else
			{
				//session.setAttribute("msg", "登录失败！");
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
					session.setAttribute("msg", "注册成功！");
				}
				else
				{
					session.setAttribute("msg", "注册失败！");
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
			throw new ServletException("加载数据库驱动失败");
		}
	}

}
