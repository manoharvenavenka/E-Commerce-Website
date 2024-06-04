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
 * Servlet implementation class DeleteRatingServlet
 */
public class DeleteRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String ratingId = request.getParameter("ratingId");
		System.out.println("fffff"+ratingId);
		RatingMod rate = new RatingMod();
		System.out.println("bhvvv"+rate);
		rate.setRatingId(Integer.parseInt(ratingId));
		
		//method calling in productmodel !!!
		boolean flag=rate.deleteRatingByRatingId();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/EcommersProject/Customer/ViewRatings.jsp");
		}else { 
			n=0;
		
			
		}
		
	}
}
