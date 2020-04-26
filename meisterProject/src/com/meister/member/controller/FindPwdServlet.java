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
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/findPwd.me")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
 
		
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		String email = request.getParameter("email");
		System.out.println(email);
		
		Member selectpwd= new MemberService().selectpwd(memberId, email);
		
		
		
		if(selectpwd != null) {
		request.setAttribute("selectpwd", selectpwd);
		//response.sendRedirect(request.getContextPath() + "/showFindIdResult.me");
		System.out.println("성공");
		//System.out.println(request.getContextPath());
		RequestDispatcher view = request.getRequestDispatcher("views/user/member/findldSuccess.jsp");
		view.forward(request, response);
		
		} else {
			response.sendRedirect(request.getContextPath() + "/showFindPwdCheck.me");
			System.out.println("실패");
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
