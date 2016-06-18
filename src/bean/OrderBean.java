package bean;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
public class OrderBean {

	private String orderid;
	private String username;
	private String orderdate;
	private int orderstate;
	private String address;
	private String receivename;
	private String tele;
	private String zipcode;
	private String paymode;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(int orderstate) {
		this.orderstate = orderstate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReceivename() {
		return receivename;
	}
	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPaymode() {
		return paymode;
	}
	public void setPaymode(String paymode) {
		this.paymode = paymode;
	}
	
	public boolean add(ArrayList cart)
	{
		DB db=new DB();
		Connection conn=db.createConn();
		Statement stmt=null;
		try{
			conn.setAutoCommit(false);  
			stmt=conn.createStatement();
		//构造sql1语句
		StringBuffer newsql1=new StringBuffer();
		newsql1.append("insert into ordertable (orderid,username, orderdate, orderstate,address,receivename,tele,zipcode,paymode) values ('");
		newsql1.append(orderid);
		newsql1.append("','");
		newsql1.append(username);
		newsql1.append("','");
		newsql1.append(orderdate);
		newsql1.append("','");
		newsql1.append(orderstate);
		newsql1.append("','");
		newsql1.append(address);
		newsql1.append("','");
		newsql1.append(receivename);
		newsql1.append("','");
		newsql1.append(tele);
		newsql1.append("','");
		newsql1.append(zipcode);
		newsql1.append("','");
		newsql1.append(paymode);
		newsql1.append("')'");
		stmt.executeUpdate(newsql1.toString());
		
		Iterator icart=cart.iterator();
		while(icart.hasNext())
		{
			//从购物车里取出一个Item对象
			ItemBean temp=(ItemBean)icart.next();
			String cid=temp.getGoods().getCid();
			int quantity=temp.getQuantity();
			//构造sql2
			StringBuffer newsql2=new StringBuffer();
			newsql2.append("insert into orderlist (orderid,cid, quantity) values ('");
			newsql2.append(orderid);
			newsql2.append("','");
			newsql2.append(cid);
			newsql2.append("','");
			newsql2.append(quantity);
			newsql2.append("')'");
			stmt.executeUpdate(newsql2.toString());
		}

		
		
			
			conn.commit();	//提交事务
			      conn.close();
			     
			 }catch(SQLException e){
			try{
				conn.rollback();	//出错回滚
			}catch(SQLException ee){
				ee.printStackTrace();
			    }
				e.printStackTrace();
			}
			 return true;
	}
}


