package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CustomerMod;

/**
 * Servlet implementation class DeleteCustomerServlet
 */
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String customerId = request.getParameter("customerId");
		System.out.println("fffff"+customerId);
		CustomerMod customer = new CustomerMod();
	
		customer.setCustomerId(Integer.parseInt(customerId));
		
		//method calling in productmodel !!!
		boolean flag=customer.deletecustomerId();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/EcommersProject/Admin/ViewCustomers.jsp");
		}else { 
			n=0;
		
			
		}
		
	}

	
}
