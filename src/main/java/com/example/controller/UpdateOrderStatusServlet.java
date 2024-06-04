package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CustomerOrderMod;

/**
 * Servlet implementation class UpdateOrderStatusServlet
 */
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
//reading parameters from html page
		
		String orderId = request.getParameter("orderId");
		String orderStatus = request.getParameter("orderStatus");
		System.out.println("orderId="+orderId);
		System.out.println("orderStatus="+orderStatus);
		 CustomerOrderMod corders =new CustomerOrderMod();
	        
		 int n = corders.customerOrderStatusUpdate(Long.parseLong(orderId), orderStatus);
			
			int m=Integer.parseInt(request.getParameter("n"));
			if(m==1) { //customer
				response.sendRedirect("/EcommersProject/Customer/CustomerOrder.jsp?res="+ n);
			}else if(m==2) {
				response.sendRedirect("/ECommersProject/Admin/ViewOrders.jsp?res="+n);
			}

	}
}
		 
		 
		 
		 
	     //   int n=corders.customerOrderStatusUpdate(Long.parseLong(orderId), orderStatus);

    
    

 /* if(n==0) {//record added
  
 * response.sendRedirect("/EcommersProject/Customer/CustomerOrder.jsp?res=" + n);//?res=1 for added record
 // for displaying the msg //that displaying on add category.jsp
 * 
 * }else {//record not added
 * response.sendRedirect("/EcommersProject/Customer/CustomerOrder.jsp?res=" + n);}*/
 
//response.sendRedirect("/EcommersProject/Customer/CustomerOrder.jsp?res=" + n);
//pw.close();
//}


//}