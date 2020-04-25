package com.meister.myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.vo.Member;
import com.meister.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyInfoDropOutFormServlet
 */
@WebServlet("/myInfoDropForm.my")
public class MyInfoDropOutFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoDropOutFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비밀번호 대조 후 일치하면 회원탈퇴 사유 입력 폼으로 이동
		
		//RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageInfoDropOutForm.jsp");
		//view.forward(request, response);

		request.setCharacterEncoding("utf-8");
		
		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String inputPwd = request.getParameter("inputPwd");
		
		String memberPwd = new MyPageService().updateCheckPwd(memberId);
		

		
		if(memberPwd.equals(inputPwd)) {	// 비밀번호 일치
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageInfoDropOutForm.jsp");
			view.forward(request, response);		
			
		}else {	// 비밀번호 불일치
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.'); history.back(-1);</script>");
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
