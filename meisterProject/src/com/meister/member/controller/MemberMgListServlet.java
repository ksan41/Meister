package com.meister.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.service.MemberService;
import com.meister.member.model.vo.Member;


/**
 * Servlet implementation class MemberMgListServlet
 */
@WebServlet("/memberList.memg")
public class MemberMgListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMgListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> list = new MemberService().selectMemberList();
		
		request.setAttribute("list", list);
		
		if(list.isEmpty()) { //조회된 회원정보가 없을 경우
			request.setAttribute("msg", "조회된 결과가 없습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/manager/memberMg/memberMgList.jsp");
			view.forward(request, response);
		}else { // 조회된 회원정보가 있을 경우
			RequestDispatcher view = request.getRequestDispatcher("views/manager/memberMg/memberMgList.jsp");
			view.forward(request, response);			
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
