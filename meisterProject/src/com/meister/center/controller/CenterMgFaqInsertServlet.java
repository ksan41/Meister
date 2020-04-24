package com.meister.center.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.service.CenterService;
import com.meister.center.model.vo.Faq;
import com.meister.notice.model.service.NoticeService;

/**
 * Servlet implementation class CenterMgFaqInsertServlet
 */
@WebServlet("/ceMgFaqInsert.cem")
public class CenterMgFaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgFaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// title, content
		request.setCharacterEncoding("utf-8");
		
		String faqQuestion = request.getParameter("faqQuestion");
		String faqAnswer = request.getParameter("faqAnswer");
		
		Faq f = new Faq();
		f.setFaqQuestion(faqQuestion);
		f.setFaqAnswer(faqAnswer);
		
		int result = new CenterService().insertFaq(f);
		
		if(result > 0) {
			
			request.getSession().setAttribute("msg", "FAQ 등록 성공");
			response.sendRedirect("ceMgFaqList.cem");
			
		}else {		// 공지사항 작성 실패!
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('FAQ 등록 실패'); location.href='views/manager/centerMg/centerMgFAQ.jsp';</script>");
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
