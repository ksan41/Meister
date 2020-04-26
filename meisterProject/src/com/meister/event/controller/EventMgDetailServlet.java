package com.meister.event.controller;

import java.io.IOException;

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

		int eno = Integer.parseInt(request.getParameter("eno"));
        Event ev = new EventService().selectAtList(eno);
        
        Event at = new EventService().selectAtList(eno);
        
        if(ev != null) {
     	   
     	   request.setAttribute("ev", ev);
     	   request.setAttribute("list1", at);
     	   
     	   RequestDispatcher view = request.getRequestDispatcher("views/user/event/eventMgDetail.jsp");
     	   view.forward(request, response);
     	   
        } else {
     	   
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
