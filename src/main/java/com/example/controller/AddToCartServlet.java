package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.CartModel;

/**
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
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
	
		
		System.out.println("prodc="+productCode);
		
		Calendar calendar = Calendar.getInstance();
        String selectdate = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
                + calendar.get(Calendar.DAY_OF_MONTH);
		
		HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		System.out.println("datetime="+customerId);
		////creating model object 
	   CartModel cart = new CartModel();
	   cart.setProductCode(Integer.parseInt(productCode));
	   cart.setCustomerId(customerId);
	   cart.setSelectedDate(selectdate);
	   
	   
	   //geting the method 
	   int n = cart.addtocartandi();
		int m=Integer.parseInt(request.getParameter("n"));
		if(m==1) { //customer
			response.sendRedirect("/ECommersProject/Customer/Cart.jsp?res="+ n);
		}else if(m==2) {
			response.sendRedirect("/ECommerceProject/Admin/AdminOrders.jsp?res="+ n);
		}

	   response.sendRedirect("Customer/CustomerHomepage.jsp?res="+n);
	   pw.close();
	   
	   
	}

}

