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

import com.example.model.CustomerMod;

/**
 * Servlet implementation class AddCustomerServlet
 */
@MultipartConfig
public class AddCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomerServlet() {
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
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page
		String customerId = request.getParameter("customerId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String mobileNumber = request.getParameter("mobileNumber");
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String registerDate = request.getParameter("registerDate");
System.out.println(customerId);
System.out.println(firstName);
System.out.println(lastName);
System.out.println(mobileNumber);
System.out.println(emailId);
System.out.println(password);
System.out.println(registerDate);



		// for reading Images we have to use part/////////
		Part profilePic = request.getPart("profilePic");
		
////////////////////////////////////////
		////////////craetion of uploads directory in webapp
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
		InputStream inputstream1 = profilePic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName = System.currentTimeMillis() + "_" + profilePic.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName);
		Files.copy(inputstream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

		
		
		
		


//////////////////////////////////////////////////////////////////////////////////
	
//use Model to insert data
/////////
		CustomerMod customer = new CustomerMod();
		customer.setCustomerId  (Integer.parseInt(customerId));
		customer.setFirstName   (firstName);
		customer.setLastName(lastName);
		customer.setMobileNumber(mobileNumber); // Set the description parameter
		customer.setEmailId(emailId);
		customer.setPassword(password);
		customer.setRegisterdate(registerDate);
		customer.setProfilePic(fileName);


int n = customer.creatingAccount();

/*if(n==0) {//record added

response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record for displaying the msg 
                                                         //that displaying on add category.jsp

}else {//record not added
response.sendRedirect("Category/ViewCat.jsp?res=1");
}*/
response.sendRedirect("Customer/CreateAccount.jsp?res="+n);
pw.close();
	}

}