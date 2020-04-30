package com.meister.center.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.service.CenterService;
import com.meister.center.model.vo.Center;

/**
 * Servlet implementation class CenterMgOneAnswerServlet
 */
@WebServlet("/ceMgOneAnswerUpdateForm.cem")
public class CenterMgOneAnswerUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgOneAnswerUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int ino = Integer.parseInt(request.getParameter("ino"));
		String inquiryAnswer = request.getParameter("inquiryAnswer");
		
		Center c = new Center();
		c.setInquiryNo(ino);
		c.setInquiryAnswer(inquiryAnswer);
		
		int result = new CenterService().updateInquiryAnswer(c);
		
		if(result > 0) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('1:1문의 답변 성공'); location.href='/Meister/ceMgOneDetail?ino=" + ino + "';</script>");
			out.flush();
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('1:1문의 답변폼 실패했습니다. 다시해!!!!'); location.href='/Meister/ceMgOneDetail?ino=" + ino + "';</script>");
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
