package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.FeedBackMod;

/**
 * Servlet implementation class DeleteFeedBackServlet
 */
public class DeleteFeedBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedBackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/hmtl");
		PrintWriter pw= response.getWriter();
		int n=0;
		String feedbackId=request.getParameter("feedbackId");
		FeedBackMod feedback= new FeedBackMod();
		feedback.setFeedbackId(Integer.parseInt(feedbackId));
		boolean flag=feedback.deleteFeedback
				(feedback.getFeedbackId());
		if(flag)
		{
			n=1;
		}
		else
		{
			n=0;
		}
		response.sendRedirect("/EcommersProject/Customer/ViewFeedBack.jsp?res="+n);
	
	pw.close();
	
	}
    
    
    
}
