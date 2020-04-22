package com.meister.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.meister.member.model.vo.Member;
import com.meister.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyInfoUpdateServlet
 */
@WebServlet("/myInfoUpdate.my")
public class MyInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String email = request.getParameter("email");
		
		java.sql.Date b = java.sql.Date.valueOf(birth);
		
		Member m = new Member();
		m.setMemberNo(memberNo);
		m.setMemberBirth(b);
		m.setMemberPhone(phone);
		m.setMemberEmail(email);
		
		int result = new MyPageService().updateMember(m);
		
		/*
		if(result > 0) { // 회원정보수정 성공시
			
			// 갱신된 회원 정보 조회 --> 세션에 담겨있는 기존의 loginUser을 갱신해줘야됨
			Member updateUser = new MemberService().selectMember(userId);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateUser);
			session.setAttribute("msg", "성공적으로 회원정보를 수정했습니다.");
			response.sendRedirect("myPage.me"); // myPage.me url로 요청
			
		}else { // 회원정보수정 실패시
			request.setAttribute("msg", "회원정보수정 실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);			
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
