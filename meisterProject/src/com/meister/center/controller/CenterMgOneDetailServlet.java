package com.meister.center.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.service.CenterService;
import com.meister.center.model.vo.Center;
import com.meister.notice.model.service.NoticeService;

/**
 * Servlet implementation class CenterMgOneDetailServlet
 */
@WebServlet("/ceMgOneDetail.cem")
public class CenterMgOneDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgOneDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Center c = new CenterService().selectOne(cno);
		
		if(c != null) {	// 조회성공
			
			request.setAttribute("c", c);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/centerMg/centerMgOneOnOneDetail.jsp");
			view.forward(request, response);
//			
//			///////////////////////////////////////////////////////////////////////////
//			response.setContentType("text/html; charset=UTF-8");
//			
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('1:1 성공'); location.href='views/manager/centerMg/centerMgOneOnOneDetail.jsp';</script>");
//			out.flush();
			
		}else {			// 조회실패
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('1:1 실패'); location.href='views/manager/centerMg/centerMgOneOnOneList.jsp';</script>");
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
