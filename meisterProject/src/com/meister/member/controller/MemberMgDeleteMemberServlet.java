package com.meister.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.service.MemberService;
import com.meister.member.model.vo.Member;

/**
 * Servlet implementation class MemberMgDeleteMemberServlet
 */
@WebServlet("/deleteMember.memg")
public class MemberMgDeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMgDeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memNo"));
		
		int result = new MemberService().deleteMgMember(memberNo);
		
		if(result>0) {//회원탈퇴처리 성공시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 회원을 탈퇴처리 했습니다.');location.href='/Meister/memberList.memg';</script>");
			out.flush();
		}else { //회원탈퇴처리 실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원탈퇴처리 실패. 다시 시도해주세요.');location.href='/Meister/memberList.memg';</script>");
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
