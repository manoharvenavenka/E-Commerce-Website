package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.RatingMod;

/**
 * Servlet implementation class AddRatingServlet
 */
public class AddRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingServlet() {
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
		doGet(request, response);
		
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page

		String productCode = request.getParameter("productCode");
		String rating = request.getParameter("rating");
		String comments = request.getParameter("comments");
		
		
		System.out.println("productCode="+productCode);
		System.out.println("rating="
				+rating);
		System.out.println("comments="+comments);
HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		System.out.println("customerId="+customerId);
		
		  RatingMod rat = new RatingMod();
		  rat.setProductCode(Integer.parseInt(productCode));
		  rat.setRating(Integer.parseInt(rating));
		  rat.setComments(comments);
		  rat.setCustomerId(customerId);
		   
		   
		   
		   //geting the method 
		   int n = rat.addRating();
		   
		   response.sendRedirect("Customer/ViewRatings.jsp?res="+n);
		   pw.close();
		   
		   
		}

	
	}


