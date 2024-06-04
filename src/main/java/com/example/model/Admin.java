package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dbutil.DBConnection;

public class Admin  implements Serializable{
  private String username;
  private String passsword;
  private String role;

public Admin() {
	super();
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPasssword() {
	return passsword;
}

public void setPasssword(String passsword) {
	this.passsword = passsword;
}

public String getRole() {
	return role;
}

public void setRole(String role) {
	this.role = role;
}
//Method to validate admin login credentials
public boolean validateAdminLogin() {
    boolean flag = false;
    try {
    DBConnection db = new DBConnection();
    Connection conn = db.getConnection();

    if (conn == null) {
    	System.err.println("Connectin error");
        flag = false;
    } else {
       
            String qry = "select * from admin where username=? and password=? and role=?";
            PreparedStatement pst = conn.prepareStatement(qry);
            pst.setString(1, this.username);
            pst.setString(2, this.passsword);
            pst.setString(3, this.role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
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
}
        
