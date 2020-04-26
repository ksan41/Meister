package com.meister.event.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.event.model.service.EventService;
import com.meister.event.model.vo.Event;

/**
 * Servlet implementation class EventMgUpdateServlet
 */
@WebServlet("/evMgUpdate.evm")
public class EventMgUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventMgUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 요청시 한글이 전달될 경우를 대비해서
		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String eventTitle = request.getParameter("eventTitle");
		Date eventOpenTime = java.sql.Date.valueOf(request.getParameter("eventOpenTime"));
		Date eventCloseTime = java.sql.Date.valueOf(request.getParameter("eventCloseTime"));
		String eventImage1 = request.getParameter("eventImage1");
		String eventImage2 = request.getParameter("eventImage2");
		String eventStatus = request.getParameter("eventStatus");
		
		Event e = new Event();
		e.setEventNo(bno);
		e.setEventTitle(eventTitle);
		e.setEventOpenTime(eventOpenTime);
		e.setEventCloseTime(eventCloseTime);
		e.setEventImage1(eventImage1);
		e.setEventImage2(eventImage2);
		e.setEventStatus(eventStatus);
		
		int result = new EventService().updateEvent(e);
		
		if(result > 0) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('이벤트 수정 성공'); location.href='/Meister/evMgList.evm?bno=" + bno + "';</script>");
			out.flush();
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('이벤트 수정 실패'); location.href='/Meister/evMgList.evm?bno=" + bno + "';</script>");
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
