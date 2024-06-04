package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class FeedBackMod implements Serializable{
	private  int feedbackId;
	private String date;
	private int custometId;
	private String customerEnquiry;
	private String feedback;
	public FeedBackMod() {
		super();
	}
	public FeedBackMod(int feedbackId, String date, int custometId, String customerEnquiry, String feedback) {
		super();
		this.feedbackId = feedbackId;
		this.date = date;
		this.custometId = custometId;
		this.customerEnquiry = customerEnquiry;
		this.feedback = feedback;
	}
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCustometId() {
		return custometId;
	}
	public void setCustometId(int custometId) {
		this.custometId = custometId;
	}
	public String getCustomerEnquiry() {
		return customerEnquiry;
	}
	public void setCustomerEnquiry(String customerEnquiry) {
		this.customerEnquiry = customerEnquiry;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
	
	public int addingFeedBack() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into feedback(customerId,date,customerEnquiry,feedback) values(?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.custometId);
			pst.setString(2, this.date);
			pst.setString(3, this.customerEnquiry);
			pst.setString(4, this.feedback);
			

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;

	}
	
	public List<FeedBackMod> getAllFeedBack(int customerId){
		List<FeedBackMod> feedbackList=new ArrayList<FeedBackMod>();

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from feedback where customerId=?";
		    PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	FeedBackMod feed= new FeedBackMod();
		    	feed.setFeedbackId(rs.getInt("feedbackId"));
		    	feed.setDate(rs.getString("date"));
		    	feed.setCustometId(rs.getInt("customerId"));
		    	feed.setCustomerEnquiry(rs.getString("customerEnquiry"));
		    	feed.setFeedback(rs.getString("feedback"));
		    	
		    	
		    	// Set the description parameter
		    

			
		    	feedbackList.add(feed);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return feedbackList;
		}
	////viewing feedback in admin
	public List<FeedBackMod> getAllFeedBackinAdmin(){
		List<FeedBackMod> feedbackList=new ArrayList<FeedBackMod>();

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from feedback ";
		    PreparedStatement pst = conn.prepareStatement(qry);
			
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	FeedBackMod feed= new FeedBackMod();
		    	feed.setFeedbackId(rs.getInt("feedbackId"));
		    	feed.setDate(rs.getString("date"));
		    	feed.setCustometId(rs.getInt("customerId"));
		    	feed.setCustomerEnquiry(rs.getString("customerEnquiry"));
		    	feed.setFeedback(rs.getString("feedback"));
		    	
		    	
		    	// Set the description parameter
		    

			
		    	feedbackList.add(feed);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return feedbackList;
		}
////////////
// delete//

public  boolean deleteFeedback(int feedbackId) {
	  boolean flag=false;
	  try {
		  
		  DBConnection db = new DBConnection();
        Connection conn = db.getConnection();

        String query = "DELETE FROM feedback WHERE feedbackId=?";
        PreparedStatement pst = conn.prepareStatement(query);
        
        System.out.println("Query = " +pst.toString());
        pst.setInt(1, feedbackId);

        int n = pst.executeUpdate();
        if (n > 0) {
            flag = true;
        }

		  
	  }catch(Exception e) {
		  
		  System.out.println("Error :" +e);
	  }
	  
	  
	  
	  return flag;
}
}
