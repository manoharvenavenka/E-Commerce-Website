package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.ProdMod;

/**
 * Servlet implementation class DeleteProductServlet
 */
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String productCode = request.getParameter("productCode");
		System.out.println("fffff"+productCode);
		ProdMod products = new ProdMod();
		System.out.println("bhvvv"+products);
		products.setProductCode (Integer.parseInt(productCode));
		
		//method calling in productmodel !!!
		boolean flag=products.deleteProductById();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/EcommersProject/Admin/ViewProduct.jsp");
		}else { 
			n=0;
		
			
		}
		
	}

	
}
