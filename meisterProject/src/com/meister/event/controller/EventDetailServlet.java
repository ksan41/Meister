package com.meister.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.event.model.service.EventService;
import com.meister.event.model.vo.Event;
import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;
import com.sun.xml.internal.ws.api.message.Attachment;

/**
 * Servlet implementation class EventDetailServlet
 */
@WebServlet("/eDetail.ev")
public class EventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailServlet() {
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
        	   
        	   RequestDispatcher view = request.getRequestDispatcher("views/user/event/eventDetail.jsp");
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
