package com.meister.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.member.model.service.MemberService;
import com.meister.member.model.vo.Member;

/**
 * Servlet implementation class LoginMemberServlet
 */
@WebServlet("/loginU.me")
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		String userPwd = request.getParameter("userPwd");
		System.out.println(userPwd);
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser",loginUser);
		
		
		
		if(loginUser != null) {
			
			response.sendRedirect(request.getContextPath());
			
			//RequestDispatcher view = request.getRequestDispatcher("/views/common_user/menubar.jsp");
			//view.forward(request, response);
			
			
		} else {
			

          response.setContentType("text/html; charset=UTF-8");
 
          PrintWriter out = response.getWriter();
 
          out.println("<script>alert('로그인에 실패했습니다'); location.href='showLoginPage.me';</script>");
 
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
