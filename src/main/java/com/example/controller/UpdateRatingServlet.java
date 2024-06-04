package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.ProdMod;
import com.example.model.RatingMod;

/**
 * Servlet implementation class UpdateRatingServlet
 */
public class UpdateRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRatingServlet() {
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
		
		String ratingId = request.getParameter("ratingId");
		String rating = request.getParameter("rating");
		String comments = request.getParameter("comments");
		
		
		
		
		

		System.out.println("productCode=" + ratingId);
		System.out.println("productCode=" + rating);
		System.out.println("productCode=" + comments);
		
		// taking module parameters
		
		RatingMod rating1 = new RatingMod();
	
		// taking variables
		rating1.setRatingId(Integer.parseInt(ratingId));
		rating1.setRating(Integer.parseInt(rating));
		rating1.setComments(comments);
		
		//category.setCategoryName(categoryName);
		//category.setCategoryId(Integer.parseInt(categoryId));
		
		// taking the method
		int n = rating1.UpdateByRatinghId();
		System.out.println("n=" + n);

/*if(n==0) {//record added

response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record for displaying the msg 
                                                         //that displaying on add category.jsp

}else {//record not added
response.sendRedirect("Category/ViewCat.jsp?res=1");
}*/
response.sendRedirect("Customer/ViewRatings.jsp?res="+n);
pw.close();
	}

}
