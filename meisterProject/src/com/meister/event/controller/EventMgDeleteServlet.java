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

/**
 * Servlet implementation class EventMgDeleteServlet
 */
@WebServlet("/evMgDelete.evm")
public class EventMgDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventMgDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new EventService().deleteEvent(bno);
		
		if(result > 0) {// 이벤트 삭제 성공
			
			request.setAttribute("result", result);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/eventMg/eventMgList.jsp");
			view.forward(request, response);
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('Event 삭제 성공!'); location.href='/Meister/evMgList.evm?bno=" + bno + "';</script>");
			out.flush();
			
		}else {// 이벤트 삭제 실패
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('Event 삭제 실패'); location.href='/Meister/evMgList.evm?bno=" + bno + "';</script>");
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
