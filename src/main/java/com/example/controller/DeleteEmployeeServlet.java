package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CustomerMod;
import com.example.model.EmployeeMod;

/**
 * Servlet implementation class DeleteEmployeeServlet
 */
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
PrintWriter pw = response.getWriter();
		
		String employeeId = request.getParameter("employeeId");
		System.out.println("fffff"+employeeId);
		EmployeeMod employee = new EmployeeMod();
	
		employee.setEmployeeId(Integer.parseInt(employeeId));
		
		//method calling in productmodel !!!
		boolean flag=employee.deleteEmployeeDetails();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/EcommersProject/Admin/ViewEmployee.jsp");
		}else { 
			n=0;
		
		}
	}
}
