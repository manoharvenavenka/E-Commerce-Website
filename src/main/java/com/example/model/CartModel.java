package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class CartModel implements Serializable{
private int cartId;
private int productCode;
private String selectedDate;
private int customerId;
public CartModel() {
	super();
}


public CartModel(int cartId, int productCode, String selectedDate, int customerId) {
	super();
	this.cartId = cartId;
	this.productCode = productCode;
	this.selectedDate = selectedDate;
	this.customerId = customerId;
}


public int getCartId() {
	return cartId;
}


public void setCartId(int cartId) {
	this.cartId = cartId;
}


public int getProductCode() {
	return productCode;
}


public void setProductCode(int productCode) {
	this.productCode = productCode;
}


public String getSelectedDate() {
	return selectedDate;
}


public void setSelectedDate(String selectedDate) {
	this.selectedDate = selectedDate;
}


public int getCustomerId() {
	return customerId;
}


public void setCustomerId(int customerId) {
	this.customerId = customerId;
}


public int addtocartandi() {
	int n=0;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "insert into cart(productCode,selectedDate,customerId) values(?,?,?)";
		PreparedStatement pst = conn.prepareStatement(qry);
      
        pst.setInt(1,this.productCode );
        pst.setString(2,this.selectedDate);
        pst.setInt(3, this.customerId);
        
        n = pst.executeUpdate();
	
}catch(Exception e) {
n=0;
}
return n;

}

//get all   names from wishlist table
		public List<ProdMod> getAllCartProductsByCustomerId(int CustomerId){
			List<ProdMod> productList=new ArrayList<ProdMod>();
		
			try {
				DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();
			    
			    String qry="select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products where productCode in(select productCode from cart where customerId=?)";
			    System.out.println("Query="+qry);
			    PreparedStatement pst=conn.prepareStatement(qry);
			    pst.setInt(1, CustomerId);
			    ResultSet rs=pst.executeQuery();
			    
			    while(rs.next()) {
			    	System.out.println("productCode=" + rs.getInt("productCode"));
			        System.out.println("categoryName=" + rs.getString("categoryName"));
			        System.out.println("productName=" + rs.getString("productName"));
			        ProdMod product= new ProdMod();
			    	product.setProductCode(rs.getInt("productCode"));
			    	product.setCategoryName(rs.getString("categoryName"));
					product.setProductName(rs.getString("productName"));
					product.setDescription(rs.getString("description")); // Set the description parameter
					product.setDiscount(rs.getInt("discount"));
					product.setCost(rs.getInt("cost"));
					product.setProductImage1(rs.getString("productImage1"));
					product.setProductImage2(rs.getString("productImage2"));
					product.setProductImage3 (rs.getString("productImage3"));

				
			    	productList.add(product);
			    }
			}catch(Exception e) {
				System.out.println("Error:getAllProducts..:" +e);
				
			}
			return productList;
		}


public List<CartModel> getAllcartdetails(){
	
	List<CartModel> cartlist = new ArrayList<CartModel>();
try {
	DBConnection db = new DBConnection();
    Connection conn = db.getConnection();

	
	
	String qry="select cartId,productCode,selectedDate,customerId from cart order by productCode";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(qry);
	
	while(rs.next()) {
		CartModel cart = new CartModel();
		cart.setProductCode(rs.getInt("productCode"));
		cart.setCartId(rs.getInt("cartId"));
		cart.setSelectedDate(rs.getString("selectedDate"));
		cart.setCustomerId(rs.getInt("customerId"));

		cartlist.add(cart);
		
	}
	
	
}catch(Exception e){
	System.out.println("Eroor at getmethod=" +e);
	
}
return cartlist;
}
///////geting cart id
public CartModel getProfileByCartId() {
	CartModel cart = new CartModel();
	try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();
		String qry="select cartId,productCode,selectedDate,customerId from cart ";

		PreparedStatement pst = conn.prepareStatement(qry);
		
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			cart.setProductCode(rs.getInt("productCode"));
			cart.setCartId(rs.getInt("cartId"));
			cart.setSelectedDate(rs.getString("selectedDate"));
			cart.setCustomerId(rs.getInt("customerId"));


		}

	} catch (Exception e) {
		System.out.println("error=" + e);
	}
	return cart;
}
///deleting product model
public boolean deleteCartById() {
	boolean flag= false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "delete from  cart where cartId=? ";
      PreparedStatement pst = conn.prepareStatement(qry);
      pst.setInt(1, this.cartId);
		 int n=pst.executeUpdate();
		 if (n==0) {
			 flag=false;
		 }else {
			 flag=true;
			 
		 }
			
	}catch(Exception e) {
	}
		return flag;
	}


/////

////deleting whole cart items by c id after ordering 
public boolean deleteCartByCustomerId(int customerId) {
	boolean flag=false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
		
	    String qry="DELETE FROM cart WHERE customerId = ?";
	    PreparedStatement pst=conn.prepareStatement(qry);
	    pst.setInt(1, customerId);
	    System.out.println("dlt qry="+pst.toString());
	    int n=pst.executeUpdate();
	    
	    if(n==0) {
	    	flag=false;
	    }else {
	    	flag=true;
	    }
	}catch(Exception e){
		flag=false;
		
	}
	return flag;
}
//changing the color of cart after adding to cart and disabling the botton
public boolean isProductIsAddedToCart(int customerId , int productCode) {
	
	boolean found1=false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "select cartId  from  cart where customerId=? and productCode=? ";
        PreparedStatement pst = conn.prepareStatement(qry);
        pst.setInt(1, customerId);
        pst.setInt(2,productCode);
		 ResultSet n=pst.executeQuery();
		// System.out.println("qry="+pst.toString());
		 if (n.next()) {
			 found1=true;
			 
		 }else {
			 found1=false;
			 
		 }
			
	}catch(Exception e) {
	}
		return found1;
	}

	
}
