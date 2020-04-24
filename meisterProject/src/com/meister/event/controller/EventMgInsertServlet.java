package com.meister.event.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.event.model.service.EventService;
import com.meister.event.model.vo.Event;



/**
 * Servlet implementation class EventMgInsertServlet
 */
@WebServlet("/evMgInsert.evm")
public class EventMgInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventMgInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// faqType, faqQuestion, faqAnswer
		request.setCharacterEncoding("utf-8");
		
		String eventTitle = request.getParameter("eventTitle");
		Date eventOpenTime = java.sql.Date.valueOf(request.getParameter("eventOpenTime"));
		Date eventCloseTime = java.sql.Date.valueOf(request.getParameter("eventCloseTime"));
		String eventImage1 = request.getParameter("eventImage1");
		String eventImage2 = request.getParameter("eventImage2");
		String eventStatus = request.getParameter("eventStatus");
		
		Event ev = new Event();
		ev.setEventTitle(eventTitle);
		ev.setEventOpenTime(eventOpenTime);
		ev.setEventCloseTime(eventCloseTime);
		ev.setEventImage1(eventImage1);
		ev.setEventImage2(eventImage2);
		ev.setEventStatus(eventStatus);
		
		int result = new EventService().insertEvent(ev);
		
		if(result > 0) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('EVENT 등록 성공'); location.href='/Meister/evMgList.evm';</script>");
			out.flush();
			
		}else {		// 공지사항 작성 실패!
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('FAQ 등록 실패'); location.href='/Meister/evMgList.evm';</script>");
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
