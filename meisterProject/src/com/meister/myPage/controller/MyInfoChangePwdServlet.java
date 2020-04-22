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
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		String newPwd = request.getParameter("inputPwd1");
		
		Member m = new Member();
		m.setMemberNo(memberNo);
		m.setMemberPwd(newPwd);
		
		int result = new MyPageService().updatePwd(m);
		
		if(result > 0) {	// 비밀번호 변경 성공
			
		}else {		// 비밀번호 변경 실패
			
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
