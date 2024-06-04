package com.example.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dbutil.DBConnection;

/**
 * Servlet implementation class ProfilePicUpdateServlet
 */
@MultipartConfig
public class ProfilePicUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilePicUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page
		String tableName = request.getParameter("tableName");
		String setColName = request.getParameter("setColName");
		String whereColName = request.getParameter("whereColName");
		String conditionValue = request.getParameter("conditionValue");
		
		///////////////////////////
		///creation of uploads directory in web app folder
		////
		
		ServletContext sc = getServletContext();
		String path = sc.getRealPath("/");
		System.out.println("path = " + path);

		/*String str = path.substring(0, path.indexOf(".metadata") - 1);
		System.out.println("str = " + str);
		// get application name
		String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
		System.out.println("appName = " + appName);

		// Concatenate root directory with application name
		String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";
		System.out.println("uploadDirectory :" + uploadDirectory);*/
		String uploadDirectory=path+"/uploads";

		Path uploadPath = Path.of(uploadDirectory);
		System.out.println("uploadpath="+uploadPath);
		
		///////
		//upload product Image1
		////
		Part image1 = request.getPart("image1");
		///get the input part of input stream 
		/////
		InputStream inputstream1 = image1.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" +image1.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputstream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
			//String qry = "update %s set %s='%s' where %s='%s' ".format(tableName, setColName,fileName1,whereColName,conditionValue);;
	        String qry = "update " +tableName+ " set " +setColName+ " ='" +fileName1+ "' where " +whereColName+ "='" +conditionValue+ "'";
		    System.out.println("querry"+qry);
	        PreparedStatement pst = conn.prepareStatement(qry);
	     
			 int  n  =pst.executeUpdate();
			 
			 response.sendRedirect("/EcommersProject/Customer/Profile.jsp");
			 
			 pw.close();
			 conn.close();
			 
		}catch (Exception e) {
			System.out.println("Error"+e);
		}
		
	}

}
