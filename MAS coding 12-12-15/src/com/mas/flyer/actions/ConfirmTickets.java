package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.UserDAO;
import com.mas.dto.FlyersDTO;
import com.mas.dto.JourneyDTO;

public class ConfirmTickets extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doPost(request, response);
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	    JourneyDTO jdto=(JourneyDTO)request.getSession().getAttribute("flightdto");
	    FlyersDTO fdto=(FlyersDTO)request.getSession().getAttribute("userdto");
	    double miles=Double.parseDouble(request.getParameter("miles"));
	    
	    try{
	    	boolean flag=new UserDAO().conformTickets(jdto,fdto,miles);
	    	if(flag){
	    		out.println("<font color=red size=4><center>Your request successfully processed</center></font>");
	    		out.println("<br><font color=red size=3><center>Please collect your ticket from my nearest office</center></font><br><br>");
	    		out.println("<center><font color=green size=4>You Have To Pay   :"+(jdto.getAmount()-miles)+" $</font></center>");
	    	}else
	    		out.println("sorry your requested process failed try again");
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		out.flush();
		out.close();
	}

}
