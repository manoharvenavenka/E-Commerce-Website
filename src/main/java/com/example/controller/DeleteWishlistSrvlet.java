package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.WishlistMod;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteWishlistServlet
 */
public class DeleteWishlistSrvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishlistSrvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String productCode = request.getParameter("productCode");
		System.out.println("fffff"+productCode);
		String customerId = request.getParameter("customerId");
		System.out.println("customerId"+customerId);
		WishlistMod wishlist = new WishlistMod();
		System.out.println("bhvvv"+wishlist);
		wishlist.setProductCode (Integer.parseInt(productCode));
		wishlist.setCustomerId (Integer.parseInt(customerId));
		
		//method calling in productmodel !!!
		boolean flag=wishlist.deletewishlistbycode();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/EcommersProject/Customer/Wishlist.jsp");
		}else { 
			n=0;
		
			
		}
		
	}

	
}