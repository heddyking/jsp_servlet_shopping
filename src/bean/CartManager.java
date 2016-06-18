package bean;
import java.util.*;


public class CartManager {
	private ArrayList cart;
	public void setCart(ArrayList cart){
		this.cart=cart;
	}
	public ArrayList getCart(){
		return this.cart;
	}
	
	public float totalPrice(){
		float total=0;
		Object items[]=cart.toArray();
		 for(int i=0;i<items.length;i++){
			 ItemBean temp=(ItemBean)items[i];
			 //判断购物车中是否存在要添加的商品
			 total+=temp.getGoods().getCprice()*temp.getQuantity();
		 }
		 return total;
	}
	
	public ArrayList getCartWithTotal(){
		return (ArrayList)Arrays.asList((new Object[]{cart,totalPrice()}));
	}
	
	//添加物品和数量
	public ArrayList addToCart(GoodsBean g,int quantity){
		if(cart==null){
			cart=new ArrayList();
			ItemBean item=new ItemBean(g,quantity);
			cart.add(item);

		}
		else{
			 Object items[]=cart.toArray();
			 boolean find=false;
			 for(int i=0;i<items.length;i++){
				 ItemBean temp=(ItemBean)items[i];
				 //判断购物车中是否存在要添加的商品
				 if(temp.getGoods().getCid().equals(g.getCid())){
					 temp.setQuantity(temp.getQuantity()+quantity);
					 find=true;
					 break;
				 }
			 }
			 if(!find){
				 //添加到购物车
				 ItemBean item=new ItemBean(g,quantity);
				 cart.add(item);
			 }
		}
		return cart;
	}
	public void update(String cid, int quantity){
		//将购物车cart转为用于遍历的Iterator类型i
		Iterator i=cart.iterator();
		//遍历集合中是否存在元素
		while(i.hasNext()){
			ItemBean temp=(ItemBean)i.next();
			//看看参数中的编号为cid的商品对象是否存在。
			if(temp.getGoods().getCid().equals(cid)){
				//修改数量
				temp.setQuantity(quantity);
				break;
			}				
			
		}
	}
	public void delete(String cid){
		Iterator i=cart.iterator();
		while(i.hasNext()){
			ItemBean temp=(ItemBean)i.next();
			if(temp.getGoods().getCid().equals(cid)){
				cart.remove(temp);
				break;
			}
		}
	}


}
