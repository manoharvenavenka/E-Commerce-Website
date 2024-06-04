package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.example.model.Admin;

/**
 * Servlet implementation class LoginValidation
 */
public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginValidation() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		System.out.println("user="+username);
		System.out.println("pass="+password);
		System.out.println("role="+role);
		//see in model
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPasssword(password);
		admin.setRole(role);
		
		//method wrote in model...!!!!!!!!!!!
		
		   boolean flag=admin.validateAdminLogin();
		   System.out.println("flag=" + flag);
		   if(flag==true) {
			   response.sendRedirect("Admin/AdminHomepage.jsp");

		   }else {
			   response.sendRedirect("Admin/AdminLogin.jsp");
		   }
		
			
		}
	

	}

