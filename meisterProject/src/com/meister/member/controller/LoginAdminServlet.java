package com.meister.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.member.model.service.MemberService;
import com.meister.member.model.vo.Manager;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/loginA.me")
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String managerId = request.getParameter("managerId");
		String password = request.getParameter("password");
		
		Manager loginManager = new MemberService().loginManager(managerId,password);
		
		if(loginManager != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginManager",loginManager);
			
			if(loginManager.getManagerType().equals("통합")) { //통합관리자 계정일때 페이지
				RequestDispatcher view = request.getRequestDispatcher("views/manager/branch/branchList.jsp");
				view.forward(request, response);
			}else { //지점관리자 계정일때 페이지
				RequestDispatcher view = request.getRequestDispatcher("views/manager/orderMg/orderMgNowList.jsp");
				view.forward(request, response);
			}
			
		}else {
			
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
