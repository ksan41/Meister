package com.meister.center.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;

/**
 * Servlet implementation class CenterMgOneAnswerServlet
 */
@WebServlet("/ceMgOneAnswer.cem")
public class CenterMgOneAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgOneAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ino = Integer.parseInt(request.getParameter("ino"));
		
		Notice n = new NoticeService().selectNotice(ino);
		
		if(n != null) {
			
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/manager/centerMg/centerMgOneOnOneAnswerForm.jsp").forward(request, response);
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('1:1문의 답변 폼이 실패했습니다. 다시해!!!!'); location.href='/Meister/ceMgOneDetail.cem?ino=" + ino + "';</script>");
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
