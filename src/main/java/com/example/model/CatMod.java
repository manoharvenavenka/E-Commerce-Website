package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class CatMod  implements Serializable{
private String categoryName;
private int categoryId;


public CatMod() {
	super();
}



public String getCategoryName() {
	return categoryName;
}



public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}



public int getCategoryId() {
	return categoryId;
}



public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}


//add categoryu ,modell
public boolean addCategory() {
	int n=0;
	boolean flag = false;
	try {
    DBConnection db = new DBConnection();
    Connection conn = db.getConnection();

    if (conn == null) {
    	System.err.println("Connectin error");
        flag = false;
    } else {
	
		 String qry = "insert into category(categoryName) values(?) ";
         PreparedStatement pst = conn.prepareStatement(qry);
         pst.setString(1, categoryName);
		n=pst.executeUpdate();
		if (n == 0) {
			flag=true;
			
		} else {
		flag=false;
		}
		
		conn.close();
    }
	}catch(Exception e) {
		
	
	
	
}
	return flag;
}


////forview cat model
public List<CatMod> getAllcategories(){
	
	List<CatMod> categorylist = new ArrayList<CatMod>();
try {
	DBConnection db = new DBConnection();
    Connection conn = db.getConnection();

	
	
	String qry="select categoryId, categoryName from category order by categoryName";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(qry);
	
	while(rs.next()) {
		CatMod category = new CatMod();
		category.setCategoryName(rs.getString("categoryName"));
		category.setCategoryId(rs.getInt("categoryId"));
		categorylist.add(category);
	}
	
	
}catch(Exception e){
	System.out.println("Eroor at getmethod=" +e);
	
}
return categorylist;
}



//delete process model
public boolean deleteCategoryById() {
	boolean flag= false;
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "delete from  category where categoryId=? ";
        PreparedStatement pst = conn.prepareStatement(qry);
        pst.setInt(1, this.categoryId);
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
////////////edi category model
public CatMod getCategorybyId() {
	CatMod categoryRow = new CatMod();
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry = "select categoryId,categoryName from category where categoryId=? ";
		PreparedStatement pst = conn.prepareStatement(qry);
        pst.setInt(1, this.categoryId);
		ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
        	categoryRow.setCategoryId(rs.getInt("categoryId"));
        	categoryRow.setCategoryName(rs.getString("categoryName"));
        }
        
              

}catch(Exception e) {
	System.out.println("error="+e);
}
	return categoryRow;
}

///////////////update category model 
public int UpdateById() {
int  n= 0;
try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

if (conn == null) {
	System.err.println("Connectin error");
   
} else {

	 String qry = "Update Category set categoryName=? where categoryId=? ";
     PreparedStatement pst = conn.prepareStatement(qry);
     pst.setString(1, categoryName);
     pst.setInt(2,this.categoryId);
	n=pst.executeUpdate();
	
	conn.close();
}
}catch(Exception e) {
	
}



return n;
}

////forviewing categories names in add product  cat model
public List<String> getAllcategoriesBByNameandi(){

List<String> categorylist = new ArrayList<String>();
try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();



String qry="select  categoryName from category order by categoryName";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(qry);

while(rs.next()) {

	categorylist.add(rs.getString("categoryName"));
}


}catch(Exception e){
System.out.println("Eroor at getmethod=" +e);

}
return categorylist;
}
}
