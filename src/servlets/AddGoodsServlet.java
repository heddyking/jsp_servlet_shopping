package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DB;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

import java.sql.*;
import java.util.Calendar;

public class AddGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddGoodsServlet() {
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

		PreparedStatement pstmt=null;
		Connection conn=null;
		String ext="", url="upload/",info="",forward="";
		SmartUpload su=new SmartUpload();  //创建新的上传对象
		long maxsize=200*1024; //设置每个上传文件最大为200KB
		try{
		    su.initialize(this.getServletConfig(), request, response); //初始化
		    su.setMaxFileSize(maxsize); //限制上传文件的大小
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //设定允许上传的格式
		    su.upload(); //上传文件
		    Request req=su.getRequest(); //创建Request对象
		    String cid=req.getParameter("cid");
		    String cname=req.getParameter("cname");
		    String number=req.getParameter("cnumber");
		    String price=req.getParameter("cprice");
		    String cintro=req.getParameter("cintro");
		    //格式转换
		    int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);

		    //获取上传的文件，因为只上传了一个文件，所以可直接获取
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //取得扩展名
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurl为保存图片的绝对路径
			String cimage=url+filename+"."+ext;
			int cmark=0;
			String sql="insert into goods(cid,cname,cnumber,cprice,cintro,cimage) values (?,?,?,?,?,?)";
			DB db = new DB();
			conn=db.createConn();
			conn.setAutoCommit(true);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,cid);
			pstmt.setString(2,cname);
			pstmt.setInt(3,cnumber);
			pstmt.setFloat(4,cprice);
			pstmt.setString(5,cintro);
			pstmt.setString(6,cimage);
			cmark=pstmt.executeUpdate();
			if(cmark==1){
				//将文件保存到指定目录中
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="添加成功！";
				forward="c_manager.jsp";
			}else{
				info="添加失败！";
				forward="c_add.jsp";
			}

			}else{
				info="请选择要上传的文件！";
				forward="c_add.jsp";
			}
		}
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="添加异常！";
		    	forward="c_add.jsp";
		    }finally{
		    	try {pstmt.close();}catch(Exception e){}
		    	try {conn.close();}catch(Exception e){}
		    }
		    request.setAttribute("info",info);
		    RequestDispatcher rd=request.getRequestDispatcher(forward);
		    rd.forward(request,response);


		
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
