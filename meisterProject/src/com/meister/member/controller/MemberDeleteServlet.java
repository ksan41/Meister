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
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/deleteMember.me")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
        String type = request.getParameter("group");
        String content = request.getParameter("content");
        
        Member m = new Member();
        m.setMemberNo(memberNo);
        m.setLeaveType(type);
        m.setLeaveReason(content);
        
        int result = new MemberService().deleteMember(m);
        
        if(result > 0) {	// 탈퇴 성공 --> alert띄운 후 로그아웃 시키고 메인페이지
        	
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 문의가 삭제되었습니다.'); location.href='myOneList.my';</script>");
			
			//response.sendRedirect("logout.me");
        	
        }else {	// 탈퇴 실패
           	
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 문의가 삭제되었습니다.'); location.href='myOneList.my';</script>");
        	
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
