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

import com.example.model.EmployeeMod;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@MultipartConfig
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEmployeeServlet() {
		super();
		// 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page

		String employeeId = request.getParameter("employeeId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String designation = request.getParameter("designation");
		String password = request.getParameter("password");
		System.out.println(employeeId);
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(gender);
		System.out.println(mobile);
		System.out.println(email);
		System.out.println(designation);
		System.out.println(password);
		// for reading Images we have to use part/////////
		Part employeePic = request.getPart("employeePic");
		System.out.println(employeePic);

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
		InputStream inputstream1 = employeePic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName = System.currentTimeMillis() + "_" + employeePic.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName);
		Files.copy(inputstream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

//////////////////////////////////////////////////////////////////////////////////

//use Model to insert 

		EmployeeMod emp = new EmployeeMod();
		emp.setEmployeeId(Integer.parseInt(employeeId));
		emp.setFirstName(firstName);
		emp.setLastName(lastName);
		emp.setGender(gender);
		emp.setMobile(mobile);
		emp.setEmail(email);
		emp.setDesignation(designation);
		emp.setPassword(password);
		emp.setEmployeePic(fileName);

		int n = emp.addingemployee();
		System.out.println("employee="+n);

		/*if (n == 0) {// record added

			response.sendRedirect("Employee/AddEmployee.jspres=0");// ?res=1 for added record for displaying the msg
																	// that displaying on add category.jsp

		} else {// record not added
			response.sendRedirect("Employee/AddEmployee.jspres=1");
		}*/
		response.sendRedirect("Admin/AddEmployee.jsp?res="+n); 
		pw.close();
	}

}

