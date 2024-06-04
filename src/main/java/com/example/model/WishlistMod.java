package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class WishlistMod {

	
	private int wishId;
	private int productCode;
	private int customerId;
	private String datetime;
	public WishlistMod() {
		super();
	}
	public WishlistMod(int wishId, int productCode, int customerId, String datetime) {
		super();
		this.wishId = wishId;
		this.productCode = productCode;
		this.customerId = productCode;
		this.datetime = datetime;
	}
	public int getWishId() {
		return wishId;
	}
	public void setWishId(int wishId) {
		this.wishId = wishId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String today) {
		this.datetime = today;
	}
	
	
	public int addtowishlist() {
		int n=0;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
			String qry = "insert into wishlist(productCode,customerId,datetime) values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
	      
	        pst.setInt(1,this.productCode );
	        pst.setInt(2,this.customerId);
	        pst.setString(3, this.datetime);
	        
	        n = pst.executeUpdate();
		
	}catch(Exception e) {
	n=0;
	}
	return n;
	
	}
	
	public List<ProdMod> getAllwishlistbycustomerId(int customerId){
		
		List<ProdMod> productlist = new ArrayList<ProdMod>();
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

		
		
		String qry="select * from products where productCode in (select productCode from wishlist where customerid=?)";
	PreparedStatement pst = conn.prepareStatement(qry);
	pst.setInt(1, customerId);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			ProdMod products = new ProdMod();
			products.setProductCode(rs.getInt("productCode"));
			products.setCategoryName(rs.getString("categoryName"));
			products.setProductName(rs.getString("productName"));
			products.setDescription(rs.getString("description"));
			products.setDiscount(rs.getInt("discount"));
			products.setCost(rs.getInt("cost"));
			products.setProductImage1(rs.getString("productImage1"));
			products.setProductImage2(rs.getString("productImage2"));
			products.setProductImage3(rs.getString("productImage3"));

			
			
			productlist.add(products);
		}
		
		
	}catch(Exception e){
		System.out.println("Eroor at getmethod=" +e);
		
	}
	return productlist;
	}
	
	///deleting wishlist model
	public boolean deletewishlistbycode() {
		boolean flag= false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
			String qry = "delete from  wishlist where productCode=? and customerId=?";
	        PreparedStatement pst = conn.prepareStatement(qry);
	        pst.setInt(1, productCode);
	        pst.setInt(2, customerId);
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
////checking if rating is present

public boolean isProductIsInWishList(int customerId , int productCode) {
	
	boolean found=false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "select wishId  from  wishlist where customerId=? and productCode=? ";
        PreparedStatement pst = conn.prepareStatement(qry);
        pst.setInt(1, customerId);
        pst.setInt(2,productCode);
		 ResultSet n=pst.executeQuery();
	//	 System.out.println("qry="+pst.toString());
		 if (n.next()) {
			 found=true;
			 
		 }else {
			 found=false;
			 
			 
		 }
			
	}catch(Exception e) {
	}
		return found;
	}

	
}