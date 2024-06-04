package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.WishlistMod;

/**
 * Servlet implementation class AddToWishListServlet
 */
public class AddToWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToWishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
	
		String productCode = request.getParameter("productCode");
	
		
		System.out.println("prodc="+productCode);
		
		Calendar calendar = Calendar.getInstance();
        String today = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
                + calendar.get(Calendar.DAY_OF_MONTH);
		
		HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		System.out.println("datetime="+customerId);
		////creating model object 
	   WishlistMod wish = new WishlistMod();
	   wish.setCustomerId(customerId);
	   wish.setDatetime(today);
	   wish.setProductCode(Integer.parseInt(productCode));
	   
	   
	   //geting the method 
	   int n = wish.addtowishlist();
	   
	   response.sendRedirect("Customer/CustomerHomepage.jsp?res="+n);
	   pw.close();
	   
	   
	}

}
