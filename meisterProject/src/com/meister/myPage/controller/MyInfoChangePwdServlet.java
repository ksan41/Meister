package com.meister.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.vo.Member;
import com.meister.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyInfoChangePwdServlet
 */
@WebServlet("/myInfoChangePwd.my")
public class MyInfoChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String memberPwd = request.getParameter("memberPwd");
		String inputPwd1 = request.getParameter("inputPwd1");
		String inputPwd2 = request.getParameter("inputPwd2");
		
		String realPwd = new MyPageService().updateCheckPwd(memberId);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
