package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CatMod;

/**
 * Servlet implementation class AddCat
 */
public class AddCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCat() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page
		String categoryName = request.getParameter("categoryName");
		System.out.println("cate="+categoryName);
		//taking module parameters
		CatMod cat = new CatMod();
		//taking variables
		cat.setCategoryName(categoryName);
		//taking the method
	boolean flag=	cat.addCategory();
	System.out.println("boom="+flag);
	if(flag==true) {

		   response.sendRedirect("Admin/AddCategory.jsp?res=0");//?res=1 for added record for displaying the msg 
		                                                            //that displaying on add category.jsp

	   }else {
		   response.sendRedirect("Admin/AddCategory.jsp?res=1");
	   }
	}

}
