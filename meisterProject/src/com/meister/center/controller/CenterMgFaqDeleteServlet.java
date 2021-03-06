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

/**
 * Servlet implementation class CenterMgFaqDeleteServlet
 */
@WebServlet("/ceMgFaqDelete.cem")
public class CenterMgFaqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgFaqDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		
		int result = new CenterService().deleteFaq(faqNo);
		
		if(result > 0) {// 삭제 성공
			
			request.setAttribute("result", result);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/centerMg/centerMgOneOnOneDetail.jsp");
			view.forward(request, response);
			
			///////////////////////////////////////////////////////////////////////////
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('FAQ 삭제 성공!'); location.href='/Meister/ceMgFaqList.cem?faqNo=" + faqNo + "';</script>");
			out.flush();
			
		}else {// FAQ 삭제 실패
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('FAQ 삭제 실패'); location.href='/Meister/ceMgFaqList.cem?faqNo=" + faqNo + "';</script>");
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
