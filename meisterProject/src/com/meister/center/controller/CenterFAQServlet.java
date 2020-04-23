package com.meister.center.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.service.CenterService;
import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.Faq;
import com.meister.notice.model.service.NoticeService;

/**
 * Servlet implementation class CenterFAQServlet
 */
@WebServlet("/faqList.ce")
public class CenterFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterFAQServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// FAQ(FAQ 테이블) 리스트 조회 후 응답페이지에 전달 
		ArrayList<Faq> list = new CenterService().selectList();
		
		request.setAttribute("list",list);
		
		
		
		
		
		// FAQ(FAQ테이블) 리스트 조회후  응답페이지
		RequestDispatcher view = request.getRequestDispatcher("");
	    view.forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
