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
			 //�жϹ��ﳵ���Ƿ����Ҫ���ӵ���Ʒ
			 total+=temp.getGoods().getCprice()*temp.getQuantity();
		 }
		 return total;
	}
	
	public ArrayList getCartWithTotal(){
		return (ArrayList)Arrays.asList((new Object[]{cart,totalPrice()}));
	}
	
	//������Ʒ������
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
				 //�жϹ��ﳵ���Ƿ����Ҫ���ӵ���Ʒ
				 if(temp.getGoods().getCid().equals(g.getCid())){
					 temp.setQuantity(temp.getQuantity()+quantity);
					 find=true;
					 break;
				 }
			 }
			 if(!find){
				 //���ӵ����ﳵ
				 ItemBean item=new ItemBean(g,quantity);
				 cart.add(item);
			 }
		}
		return cart;
	}
	public void update(String cid, int quantity){
		//�����ﳵcartתΪ���ڱ�����Iterator����i
		Iterator i=cart.iterator();
		//�����������Ƿ����Ԫ��
		while(i.hasNext()){
			ItemBean temp=(ItemBean)i.next();
			//���������еı��Ϊcid����Ʒ�����Ƿ���ڡ�
			if(temp.getGoods().getCid().equals(cid)){
				//�޸�����
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