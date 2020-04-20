package com.meister.member.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.service.MemberService;
import com.meister.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/memberInsert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String dateIn = request.getParameter("dateIn");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		/*System.out.println("name : " + name);
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		System.out.println("dateIn : " + dateIn);
		System.out.println("gender : " + gender);
		System.out.println("phone : " + phone);
		System.out.println("email : " + email);
		*/
		
		
		java.sql.Date d = java.sql.Date.valueOf(dateIn);
		
	
		Member m = new Member(name,userId,userPwd,d,gender,phone,email);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) { // 회원가입 성공
			
			// response.sendRedirect =views/user/member/memberEnrollSuccess.jsp
			
			
			 System.out.println("ok");
			 RequestDispatcher view = request.getRequestDispatcher("views/user/member/memberEnrollSuccess.jsp");
			 view.forward(request, response);
			 
			
			 
			
		} else { // 회원가입 실패
			
			// 알럴트
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
