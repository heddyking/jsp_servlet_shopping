package bean;
import java.sql.*;


public class GoodsBean {
private String cid;
private String cname;
private float cprice;
private int cnumber;
private String cintro;
private String cimage;

public String getCid(){
	return cid;
	
}
public void setCid(String cid){
	this.cid=cid;
}
public String getCname(){
	return cname;
	
}
public void setCname(String cname){
	this.cname=cname;
}	

public float getCprice(){
	return cprice;
	
}
public void setCprice(float cprice){
	this.cprice=cprice;
}
public int getCnumber(){
	return cnumber;
	
}
public void setCnumber(int cnumber){
	this.cnumber=cnumber;
}
public String getCintro(){
	return cintro;
	
}
public void setCintro(String cintro){
	this.cintro=cintro;
}

public String getCimage(){
	return cimage;
	
}
public void setCimage(String cimage){
	this.cimage=cimage;
}
public GoodsBean findGoodsById(String cid){
	try{
		String sql="select* from goods where cid='"+cid+"'";
		DB db=new DB();
		ResultSet rs=db.executeQuery(sql);
		if(rs.next()){
			String cname=rs.getString(2);
			float cprice=rs.getFloat(3);
			GoodsBean temp=new GoodsBean();
			temp.setCid(cid);
			temp.setCname(cname);
			temp.setCprice(cprice);
            db.close();
        return temp;
		}else{return null;}	
		
	}catch(Exception e){
		System.out.println(e.toString());
		return null;
		
		
	}
	
}

}
