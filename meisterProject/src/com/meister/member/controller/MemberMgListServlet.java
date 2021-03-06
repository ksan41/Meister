package com.meister.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.service.MemberService;
import com.meister.member.model.vo.Member;
import static com.meister.common.DateTokenizer.*;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String name = null; 
		name= request.getParameter("userName");
		
		String startDate=null;
		String endDate=null;
		startDate = request.getParameter("startDate");
		if(startDate!=null) {//startDate값이 존재한다면 변환
			startDate = stringToDate(startDate);
		}
		endDate = request.getParameter("endDate");
		if(endDate!=null) {
			endDate = stringToDate(endDate);
		}
		
		
		
		if (name!=null) {// 이름으로 검색시
			ArrayList<Member> list = new MemberService().searchName(name);
			
			request.setAttribute("list", list);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/memberMg/memberMgList.jsp");
			view.forward(request, response);
		} else if (startDate != null && endDate != null) { // 기간별 검색시

			ArrayList<Member> list = new MemberService().searchDate(startDate, endDate);
			
			request.setAttribute("list", list);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/memberMg/memberMgList.jsp");
			view.forward(request, response);

		} else {// 기본 전체조회용
			ArrayList<Member> list = new MemberService().selectMemberList();

			request.setAttribute("list", list);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/memberMg/memberMgList.jsp");
			view.forward(request, response);


		}

	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
