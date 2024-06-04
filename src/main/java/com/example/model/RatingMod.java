package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class RatingMod implements Serializable {
private int ratingId;
private int productCode;
private int rating;
private String comments;
private int customerId;
private String date;
public RatingMod() {
	super();
}

public RatingMod(int ratingId, int productCode, int rating, String comments, int customerId, String date) {
	super();
	this.ratingId = ratingId;
	this.productCode = productCode;
	this.rating = rating;
	this.comments = comments;
	this.customerId = customerId;
	this.date = date;
}


public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public int getRatingId() {
	return ratingId;
}
public void setRatingId(int ratingId) {
	this.ratingId = ratingId;
}
public int getProductCode() {
	return productCode;
}
public void setProductCode(int productCode) {
	this.productCode = productCode;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public int getCustomerId() {
	return customerId;
}
public void setCustomerId(int customerId) {
	this.customerId = customerId;
}


public int addRating() {
	int n=0;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	   
		String qry = "insert into rating(productCode,rating,comments,customerId,date) values(?,?,?,?,?) ";
		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setInt(1, this.productCode);
        pst.setInt(2, this.rating);
        pst.setString(3,this.comments );
        pst.setInt(4, this.customerId);
        pst.setDate(5, Date.valueOf(LocalDate.now()));

        

        
        n = pst.executeUpdate();
	
}catch(Exception e) {
n=0;
}
return n;

}

public RatingMod getRatingdet() {
	RatingMod ratingRow = new RatingMod();
	System.out.println("proddddd"+ratingRow);
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry="select * from rating where ratingId=?";
		
		PreparedStatement pst = conn.prepareStatement(qry);
		 pst.setInt(1, this.ratingId);
	    
		ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
        	//taking variables
        	ratingRow.setProductCode(rs.getInt("productCode"));
        	ratingRow.setRating(rs.getInt("rating"));
        	ratingRow.setRatingId(rs.getInt("ratingId"));
        	ratingRow.setComments(rs.getString("comments"));
        	ratingRow.setCustomerId(rs.getInt("customerId"));
        }else {
        	ratingRow = null;
        }

}catch(Exception e) {
	System.out.println("error="+e);
}
	return ratingRow;
}

public List<RatingMod> getAllRatings(int CustomerId){
List<RatingMod> ratingList=new ArrayList<RatingMod>();

try {
	DBConnection db = new DBConnection();
    Connection conn = db.getConnection();
    
    String qry="select * from rating where customerId=?";
    PreparedStatement pst = conn.prepareStatement(qry);
	pst.setInt(1, CustomerId);
	
	ResultSet rs = pst.executeQuery();
    
    while(rs.next()) {
    	RatingMod rate= new RatingMod();
    	rate.setRatingId(rs.getInt("ratingId"));
    	rate.setCustomerId(rs.getInt("customerId"));
    	rate.setRating(rs.getInt("rating"));
    	rate.setComments(rs.getString("comments"));
    	rate.setProductCode(rs.getInt("productCode")); // Set the description parameter
    

	
    	ratingList.add(rate);
    }
}catch(Exception e) {
	System.out.println("Error:getAllCustomerOrders..:" +e);
	
}
return ratingList;
}
public boolean deleteRatingByRatingId() {
	boolean flag= false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "delete from  rating where ratingId=? ";
        PreparedStatement pst = conn.prepareStatement(qry);
        pst.setInt(1, this.ratingId);
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

public boolean isRatingGiven(int customerId , int productCode) {
	
	boolean found=false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "select ratingId  from  rating where customerId=? and productCode=? ";
        PreparedStatement pst = conn.prepareStatement(qry);
        pst.setInt(1, customerId);
        pst.setInt(2,productCode);
		 ResultSet n=pst.executeQuery();
		 System.out.println("qry="+pst.toString());
		 if (n.next()) {
			 found=true;
			 
		 }else {
			 found=false;
			 
		 }
			
	}catch(Exception e) {
	}
		return found;
	}
	


public RatingMod getRatingbyId(int ratingId) {
	RatingMod rating = new RatingMod();
	System.out.println("proddddd"+rating);
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry="select * from rating where ratingId=?";
		
		PreparedStatement pst = conn.prepareStatement(qry);
		 pst.setInt(1,ratingId);
	    
		ResultSet rs = pst.executeQuery();
        	if(rs.next()) {
            	//taking variables
            	rating.setComments(rs.getString("comments"));
            	rating.setRating(rs.getInt("rating"));
            	rating.setProductCode(rs.getInt("productCode"));
            	rating.setCustomerId(rs.getInt("customerId"));
            	rating.setRatingId(rs.getInt("ratingId"));
            	
            }else {
            	rating = null;
            }
            
            

	}catch(Exception e) {
		System.out.println("error="+e);
	}
		return rating;
	}

public int UpdateByRatinghId() {
int  n= 0;

try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

if (conn == null) {
	System.err.println("Connectin error");
   
} else {
	 String qry = "Update rating set rating=?,comments=? where ratingId=? ";
     PreparedStatement pst = conn.prepareStatement(qry);
     pst.setInt(1,this.rating);
     pst.setString(2,this.comments);
     pst.setInt(3,this.ratingId);
     
   
	n=pst.executeUpdate();
	
	conn.close();
}
}catch(Exception e) {
	



}
return n;
}




public RatingMod getRatingsByProduc(int productCode) {
	RatingMod ratiRow = new RatingMod();
	System.out.println("proddddd"+ratiRow);
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry="select * from rating where productCode=?";
		
		PreparedStatement pst = conn.prepareStatement(qry);
		 pst.setInt(1, productCode);
	    
		ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
        	//taking variables
        	ratiRow.setComments(rs.getString("comments"));
        	ratiRow.setCustomerId(rs.getInt("customerId"));
        	ratiRow.setProductCode(rs.getInt("productCode"));
        	ratiRow.setRating(rs.getInt("rating"));
        	ratiRow.setRatingId(rs.getInt("ratingId"));
        	ratiRow.setDate(rs.getString("date"));
        }else {
        	ratiRow = null;
        }
        
              

}catch(Exception e) {
	System.out.println("error="+e);
}
	return ratiRow;
}

public List<RatingMod> getRatingsByProductCode(int productCode){
List<RatingMod> ratingList=new ArrayList<RatingMod>();

try {
	DBConnection db = new DBConnection();
    Connection conn = db.getConnection();
    
    String qry="select * from rating where productCode=?";
	
	PreparedStatement pst = conn.prepareStatement(qry);
	 pst.setInt(1, productCode);
    
	ResultSet rs = pst.executeQuery();
    
    while(rs.next()) {
    	RatingMod rate= new RatingMod();
    	rate.setRatingId(rs.getInt("ratingId"));
    	rate.setCustomerId(rs.getInt("customerId"));
    	rate.setRating(rs.getInt("rating"));
    	rate.setComments(rs.getString("comments"));
    	rate.setProductCode(rs.getInt("productCode")); // Set the description parameter
      rate.setDate(rs.getString("date"));

	
    	ratingList.add(rate);
    }
}catch(Exception e) {
	System.out.println("Error:getAllCustomerOrders..:" +e);
	
}
return ratingList;
}

public List<RatingMod> getRatings(){
List<RatingMod> ratingList=new ArrayList<RatingMod>();

try {
	DBConnection db = new DBConnection();
    Connection conn = db.getConnection();
    
    String qry="select * from rating ";
	
	PreparedStatement pst = conn.prepareStatement(qry);
	
    
	ResultSet rs = pst.executeQuery();
    
    while(rs.next()) {
    	RatingMod rate= new RatingMod();
    	rate.setRatingId(rs.getInt("ratingId"));
    	rate.setCustomerId(rs.getInt("customerId"));
    	rate.setRating(rs.getInt("rating"));
    	rate.setComments(rs.getString("comments"));
    	rate.setProductCode(rs.getInt("productCode")); // Set the description parameter
      rate.setDate(rs.getString("date"));

	
    	ratingList.add(rate);
    }
}catch(Exception e) {
	System.out.println("Error:getAllCustomerOrders..:" +e);
	
}
return ratingList;
}
}

