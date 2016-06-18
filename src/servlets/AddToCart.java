package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import java.util.ArrayList;

public class AddToCart extends HttpServlet {

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

		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		if(session.getAttribute("username")==null){
			
			response.sendRedirect("index.jsp");
		}
		else{
			try{
				String cid=request.getParameter("cid");
				
				CartManager cartManager=new CartManager();
				
				ArrayList cart=(ArrayList)session.getAttribute("cart");				
				cartManager.setCart(cart);
				
				GoodsBean g=new GoodsBean();
				g=g.findGoodsById(cid);
				cartManager.addToCart(g,1);
				
				session.setAttribute("cart", cartManager.getCart());	
				session.setAttribute("total", cartManager.totalPrice());	
			}catch(Exception e){
				String error=e.toString();
				out.println(error);
			}
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

}
