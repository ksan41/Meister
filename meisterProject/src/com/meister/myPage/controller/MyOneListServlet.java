package com.meister.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.vo.Center;
import com.meister.myPage.model.service.MyPageService;
import com.meister.myPage.model.vo.Member;

/**
 * Servlet implementation class MyOneListServlet
 */
@WebServlet("/myOneList.my")
public class MyOneListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOneListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		// 해당 회원이 작성한 1:1문의(CENTER 테이블) 리스트 조회 후 응답페이지에 전달
		ArrayList<Center> list = new MyPageService().selectCenterList(memberNo);
		
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageOneOnOneList.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
