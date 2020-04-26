package com.meister.event.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.event.model.service.EventService;
import com.meister.event.model.vo.Event;

/**
 * Servlet implementation class EventMgDetailServlet
 */
@WebServlet("/evMgDetail.evm")
public class EventMgDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventMgDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
        Event e = new EventService().selectAtList(bno);
        
        Event at = new EventService().selectAtList(bno);
        
        if(e != null) {
     	   
     	   request.setAttribute("e", e);
     	   request.setAttribute("list1", at);
     	   
     	   RequestDispatcher view = request.getRequestDispatcher("views/manager/eventMg/eventMgList.jsp");
     	   view.forward(request, response);
     	   
        } else {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('이벤트 실패  T^T'); location.href='views/manager/eventMg/eventMgList.jsp';</script>");
			out.flush();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
