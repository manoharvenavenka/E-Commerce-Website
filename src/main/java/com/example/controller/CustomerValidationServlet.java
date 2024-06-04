package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import com.example.model.CustomerMod;

/**
 * Servlet implementation class CustomerValidationServlet
 */
public class CustomerValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerValidationServlet() {
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
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			
			System.out.println("user="+emailId);
			System.out.println("pass="+password);
			
			CustomerMod customer = new CustomerMod();
			customer.setEmailId(emailId);
			customer.setPassword(password);
			boolean flag = customer.customerValidation();
				
			            if (flag==true) {
			            	
			            	HttpSession session=request.getSession();
			            	session.setAttribute("customerId",customer.getCustomerId());
			            	session.setAttribute("customerName", customer.getFirstName() +" " +customer.getLastName());
			            	session.setAttribute("customerMailId", customer.getEmailId());

			               
			               response.sendRedirect("Customer/CustomerHomepage.jsp?res="+flag);

					   }else {
						   response.sendRedirect("Customer/CustomerLogin.jsp?res="+flag);
					   }
				
		}
			
			
			
			
		}
	
