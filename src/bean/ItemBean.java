package bean;


public class ItemBean {
private GoodsBean goods;
private int quantity;
public ItemBean(GoodsBean d,int quantity){
	
	this.goods=d;
	this.quantity=quantity;
	}
public void setGoods(GoodsBean goods){
		this.goods=goods;
	}
	
public GoodsBean getGoods(){
		
		return goods;	
	}
	public void setQuantity(int quantity){
		this.quantity=quantity;
	}
public int getQuantity(){
		
		return quantity;	
	}
}
