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

import com.example.model.ProdMod;

/**
 * Servlet implementation class AddProductServlet
 */

@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page

		String productCode = request.getParameter("productCode");
		String categoryName = request.getParameter("categoryName");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String discount = request.getParameter("discount");
		String cost = request.getParameter("cost");

		// for reading Images we have to use part/////////
		Part productImage1 = request.getPart("productImage1");
		Part productImage2 = request.getPart("productImage2");
		Part productImage3 = request.getPart("productImage3");
////////////////////////////////////////
		//////////// craetion of uploads directory in webapp
		/////////////////////
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

		// Create the directory if it doesnt't exist
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
			System.out.println("directory Created");
		} else {
			System.out.println("directory not Created");
		}

		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		/// upload product Image1
		///////
		// Get the Input Stream Of The Upload File
		InputStream inputstream1 = productImage1.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + productImage1.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputstream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

//////////////////////////////////////////////////////////////////////////////////
/// upload product Image2
///////
// Get the Input Stream Of The Upload File
		InputStream inputstream2 = productImage2.getInputStream();

// Generate the unique filename or use the original file name
		String fileName2 = System.currentTimeMillis() + "_" + productImage2.getSubmittedFileName();

// Save file to the server
		Path filePath2 = uploadPath.resolve(fileName2);
		Files.copy(inputstream2, filePath2, StandardCopyOption.REPLACE_EXISTING);

/////////////////////
/// upload product Image3
///////
// Get the Input Stream Of The Upload File
		InputStream inputstream3 = productImage3.getInputStream();

// Generate the unique filename or use the original file name
		String fileName3 = System.currentTimeMillis() + "_" + productImage3.getSubmittedFileName();

// Save file to the server
		Path filePath3 = uploadPath.resolve(fileName3);
		Files.copy(inputstream3, filePath3, StandardCopyOption.REPLACE_EXISTING);

//////////////////////////////////////////////////////////////////////////////////

//use Model to insert catgory
//////////ProdMod product = new ProdMod(Integer.parseInt( productCode), categoryName, productName,  description, Integer.parseInt( discount), Integer.parseInt( cost),
		/// fileName1, fileName2 , fileName3 );
		ProdMod product = new ProdMod();
		product.setProductCode(Integer.parseInt(productCode));
		product.setCategoryName(categoryName);
		product.setProductName(productName);
		product.setDescription(description); // Set the description parameter
		product.setDiscount(Integer.parseInt(discount));
		product.setCost(Integer.parseInt(cost));
		product.setProductImage1(fileName1);
		product.setProductImage2(fileName2);
		product.setProductImage3(fileName3);

		int n = product.addProduct();

		/*
		 * if(n==0) {//record added
		 * 
		 * response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record
		 * for displaying the msg //that displaying on add category.jsp
		 * 
		 * }else {//record not added
		 * response.sendRedirect("Category/ViewCat.jsp?res=1"); }
		 */
		response.sendRedirect("Admin/AddProduct.jsp?res=" + n);
		pw.close();
	}

}
