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
		
		
		// FAQ(FAQ 테이블) 리스트 조회 후 응답페이지에 전달(피자)
		ArrayList<Faq> list = new CenterService().selectList();
		
		request.setAttribute("list",list);
		
		System.out.println(list);
		
		
		
		
		// FAQ(FAQ 테이블) 리스트 조회 후 응답페이지에 전달 (주문확인)
        ArrayList<Faq> rlist = new CenterService().selectrlist();
		
		request.setAttribute("rlist",rlist);
		
		System.out.println(rlist);
		
		
		// FAQ(FAQ 테이블) 리스트 조회 후 응답페이지에 전달 (포장주문)
        ArrayList<Faq> plist = new CenterService().selectpList();
		
		request.setAttribute("plist",plist);
		
		System.out.println(plist);
		
		
	
		
		
		// FAQ(FAQ 테이블) 리스트 조회 후 응답페이지에 전달 (홈페이지 관련)
        ArrayList<Faq> hlist = new CenterService().selecthList();
		
		request.setAttribute("hlist",hlist);
		
		System.out.println(hlist);
		
	
		
		
		
		// FAQ(FAQ테이블) 리스트 조회후  응답페이지
		RequestDispatcher view = request.getRequestDispatcher("views/user/center/centerFAQ1.jsp");
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