package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CatMod;

/**
 * Servlet implementation class UpdateCategoryservlet
 */
public class UpdateCategoryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategoryservlet() {
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
		String categoryName = request.getParameter("categoryName");
		String categoryId = request.getParameter("categoryId");

		System.out.println("cate="+categoryName);
		//taking module parameters
		CatMod cat = new CatMod();
		//taking variables
		cat.setCategoryName(categoryName);
		cat.setCategoryId(Integer.parseInt(categoryId));
		//taking the method
	int n=	cat.UpdateById();
	System.out.println("boom="+n);
	/*if(n==0) {//record added
		   response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record for displaying the msg 
		                                                            //that displaying on add category.jsp
	   }else {//record not added
		   response.sendRedirect("Category/ViewCat.jsp?res=1");
	   }*/
	   response.sendRedirect("Admin/ViewCat.jsp?res="+n);
	   pw.close();
	}

}