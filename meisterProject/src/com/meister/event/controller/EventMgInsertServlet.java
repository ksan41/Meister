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
		
		DateFormat format = new SimpleDateFormat("yy년 mm월 dd일");
		
		String eventTitle = request.getParameter("eventTitle");
		
		String from = "2018-09.06 11:11:11";
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date eventOpenTime = format.format(request.getParameter("eventOpenTime"));
		Date eventOpenTime = (Date) fm.parse(request.getParameter("eventOpenTime"));
//		Date eventCloseTime = request.getParameter("eventCloseTime");
		Date eventCloseTime = (Date) fm.parse(request.getParameter("eventCloseTime"));

		String eventImage1 = request.getParameter("eventImage1");
		String eventImage2 = request.getParameter("eventImage2");
		String eventStatus = request.getParameter("eventStatus");
		
		Event e = new Event();
		e.setEventTitle(eventTitle);
		e.setEventOpenTime(eventOpenTime);
		e.setEventCloseTime(eventCloseTime);
		e.setEventImage1(eventImage1);
		e.setEventImage2(eventImage2);
		e.setEventStatus(eventStatus);
		
		int result = new EventService().insertEvent(e);
		
		if(result > 0) {
			
//			request.getSession().setAttribute("msg", "FAQ 등록 성공");
//			response.sendRedirect("views/manager/centerMg/centerMgFAQ.jsp");
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
