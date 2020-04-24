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

/**
 * Servlet implementation class CenterMgFaqUpdateServlet
 */
@WebServlet("/ceMgFaqUpdate.cem")
public class CenterMgFaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgFaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 요청시 한글이 전달될 경우를 대비해서
		request.setCharacterEncoding("utf-8");
		
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		String faqType = request.getParameter("faqType");
		String faqQuestion = request.getParameter("faqQuestion");
		String faqAnswer = request.getParameter("faqAnswer");
		
		Faq f = new Faq();
		f.setFaqNo(faqNo);
		f.setFaqType(faqType);
		f.setFaqQuestion(faqQuestion);
		f.setFaqAnswer(faqAnswer);
		
		int result = new CenterService().updateFaq(f);
		
		if(result > 0) {
			
			// 상세보기 요청
			response.sendRedirect("ceMgFaqList.cem?faqNo=" + faqNo);
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('FAQ 수정이 실패했습니다. 다시 수정해!!!!'); location.href='/Meister/ceMgFaqList.cem?faqNo=" + faqNo + "';</script>");
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
