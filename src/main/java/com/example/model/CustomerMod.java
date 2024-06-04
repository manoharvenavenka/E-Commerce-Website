package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;


public class CustomerMod implements Serializable {
	private int customerId;
	private String firstName;
	private String lastName;
	private String mobileNumber;
	private String emailId;
	private String password;
	private String profilePic;
	private String registerdate;

	public CustomerMod() {
		super();
	}

	public CustomerMod(int customerId, String firstName, String lastName, String mobileNumber, String emailId,
			String password, String profilePic, String registerdate) {
		super();
		this.customerId = customerId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNumber = mobileNumber;
		this.emailId = emailId;
		this.password = password;
		this.profilePic = profilePic;
		this.registerdate = registerdate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}

	public int creatingAccount() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into customers(customerId,firstName,lastName,mobileNumber,emailId,password,profilePic,registerDate) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.customerId);
			pst.setString(2, this.firstName);
			pst.setString(3, this.lastName);
			pst.setString(4, this.mobileNumber);
			pst.setString(5, this.emailId);
			pst.setString(6, this.password);
			pst.setString(7, this.profilePic);
			pst.setString(8, this.registerdate);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;

	}

	public boolean customerValidation() {
		boolean flag = false;
		try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			System.err.println("Connectin error");
			flag = false;
		} else {
		
				String qry = "select * from customers where emailId=? and password=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.emailId);
				pst.setString(2, this.password);
				ResultSet rs = pst.executeQuery();

				if (rs.next()) {
					// this.setCustomerId(rs.getInt(customerId));
					this.setCustomerId(rs.getInt("customerId"));
					this.setEmailId(rs.getString("emailId"));
					this.setFirstName(rs.getString("firstName"));
					this.setLastName(rs.getString("lastName"));

					flag = true;
				} else {
					flag = false;

				}

				conn.close();
			} 
		}catch (Exception e) {
				e.printStackTrace();
			}

		
		return flag;
	}

//viewing Customer details in card
	public List<CustomerMod> getAllCustomerDetails(int customerId) {

		List<CustomerMod> customerlist = new ArrayList<CustomerMod>();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select customerId,firstName,lastName,mobileNumber,emailId,password,profilePic,registerDate from customers where customerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				CustomerMod customers = new CustomerMod();
				customers.setCustomerId(rs.getInt("customerId"));
				customers.setFirstName(rs.getString("firstName"));
				customers.setLastName(rs.getString("lastName"));
				customers.setMobileNumber(rs.getString("mobileNumber"));
				customers.setEmailId(rs.getString("emailId"));
				customers.setPassword(rs.getString("password"));
				customers.setProfilePic(rs.getString("profilePic"));
				customers.setRegisterdate(rs.getString("registerdate"));
				customerlist.add(customers);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return customerlist;
	}
	////////////////////

	public CustomerMod getProfileByCustomerId() {
		CustomerMod profileRow = new CustomerMod();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			String qry = "select customerId,firstName,lastName,mobileNumber,emailId,password,registerDate from customers where customerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.customerId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				profileRow.setCustomerId(rs.getInt("customerId"));
				profileRow.setFirstName(rs.getString("firstName"));
				profileRow.setLastName(rs.getString("lastName"));
				profileRow.setMobileNumber(rs.getString("mobileNumber"));
				profileRow.setEmailId(rs.getString("emailId"));
				profileRow.setPassword(rs.getString("password"));
				profileRow.setRegisterdate(rs.getString("registerdate"));

			}

		} catch (Exception e) {
			System.out.println("error=" + e);
		}
		return profileRow;
	}

///////////////update category model 
	public int UpdateByCustomerId() {
		int n = 0;

		try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			System.err.println("Connectin error");

		} else {
				String qry = "Update customers set firstName=?,lastName=?,mobileNumber=?,emailId=?,password=?,registerDate=? where customerId=? ";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, firstName);
				pst.setString(2, lastName);
				pst.setString(3, mobileNumber);
				pst.setString(4, emailId);
				pst.setString(5, password);
				pst.setString(6, registerdate);
				pst.setInt(7, customerId);

				n = pst.executeUpdate();

				conn.close();
			}
		}catch (Exception e) {

			

		}
		return n;
	}
	public List<CustomerMod> getAllCustomersforAdmin() {

		List<CustomerMod> customerlist = new ArrayList<CustomerMod>();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select customerId,firstName,lastName,mobileNumber,emailId,password,profilePic,registerDate from customers ";

			PreparedStatement pst = conn.prepareStatement(qry);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				CustomerMod customers = new CustomerMod();
				customers.setCustomerId(rs.getInt("customerId"));
				customers.setFirstName(rs.getString("firstName"));
				customers.setLastName(rs.getString("lastName"));
				customers.setMobileNumber(rs.getString("mobileNumber"));
				customers.setEmailId(rs.getString("emailId"));
				customers.setPassword(rs.getString("password"));
				customers.setProfilePic(rs.getString("profilePic"));
				customers.setRegisterdate(rs.getString("registerdate"));
				customerlist.add(customers);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return customerlist;
	}
	public boolean deletecustomerId() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			
			String qry="delete from customers where customerId=?"; 
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.customerId);
			int n = pst.executeUpdate();
			if(n==0) {
				flag=false;
			}else {
				flag=true;
			}
			
			
	
			
		}catch (Exception e) {
System.out.println("erroe="+e);		
}
		return flag;
	}
}