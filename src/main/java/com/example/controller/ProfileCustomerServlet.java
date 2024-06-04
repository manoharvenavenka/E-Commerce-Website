package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CustomerMod;

/**
 * Servlet implementation class ProfileCustomerServlet
 */
public class ProfileCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileCustomerServlet() {
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

		String customerId = request.getParameter("customerId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String mobileNumber = request.getParameter("mobileNumber");
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String registerDate = request.getParameter("registerDate");
	
		System.out.println("firstName="+firstName);
		System.out.println("customerId="+customerId);
		System.out.println("lastName="+lastName);
		System.out.println("mobileNumber="+mobileNumber);
		System.out.println("emailId="+emailId);
		System.out.println("password="+password);
		System.out.println("registerDate="+registerDate);
		
		//taking modle parameters
		CustomerMod prof = new CustomerMod();
		//taking variables
		prof.setCustomerId(Integer.parseInt(customerId));
		prof.setFirstName(firstName);
		prof.setLastName(lastName);
		prof.setMobileNumber(mobileNumber);
		prof.setEmailId(emailId);
		prof.setPassword(password);
		prof.setRegisterdate(registerDate);
		
		
		//taking the method
	int n=	prof.UpdateByCustomerId();
	System.out.println("boom="+n);
	if(n==0) {//record added
		   response.sendRedirect("Customer/Profile.jsp?res=1");//?res=1 for added record for displaying the msg 
		                                                            //that displaying on add category.jsp
	   }else {//record not added
		   response.sendRedirect("Customer/Profile.jsp?res=0");
	   }
	   pw.close();
	
///////response.sendRedirect("Customer/Profile.jsp?res="+n);

}
}