package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.mail.Session;

import com.example.model.FeedBackMod;

/**
 * Servlet implementation class AddFeedBackServlet
 */
public class AddFeedBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFeedBackServlet() {
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
		PrintWriter pw =response.getWriter();
		
		Calendar c= Calendar.getInstance();
		String today=c.get(Calendar.YEAR)+"/"+(c.get(Calendar.MONTH)+1)+"/"+c.get(Calendar.DAY_OF_MONTH);

		
HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		System.out.println("customerId="+customerId);
		
		
		String customerEnquiry = request.getParameter("customerEnquiry");
		String feedback = request.getParameter("feedback");
		
		System.out.println("customerEnquiry="+customerEnquiry);
		System.out.println("feedback="+feedback);
		System.out.println();
		
		
		
		FeedBackMod feed = new FeedBackMod();
		feed.setCustomerEnquiry(customerEnquiry);
		feed.setFeedback(feedback);
		feed.setCustometId(customerId);
		feed.setDate(today);
		 
		
		int n = feed.addingFeedBack();
		  response.sendRedirect("Customer/AddFeedBack.jsp?res="+n);
		   pw.close();
	}

}
