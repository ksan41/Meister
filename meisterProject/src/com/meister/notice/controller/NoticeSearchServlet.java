package com.meister.notice.controller;

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
import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/nSearch.no")
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 공지사항 제목 검색시 사용할 parameter
		String noticeTitleSearch = null;
		noticeTitleSearch = request.getParameter("noticeTitleSearch");
		
		// 공지사항 내용 검색시 사용할 parameter
		String noticeContentSearch = null;
		noticeContentSearch = request.getParameter("noticeContentSearch");
		
		if(noticeTitleSearch != null) {	// 제목 검색할 경우
			ArrayList<Notice> list1 = new NoticeService().searchTitle(noticeTitleSearch);
			request.setAttribute("list1", list1);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
			view.forward(request, response);
			
		}else if(noticeContentSearch != null) { // 내용 검색할 경우	
			ArrayList<Notice> list2 = new NoticeService().searchContent(noticeTitleSearch);
			request.setAttribute("list2", list2);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
			view.forward(request, response);
			
		}else if(noticeContentSearch != null || noticeTitleSearch != null ) { // 제목  + 내용 검색할 경우	
			ArrayList<Notice> list1 = new NoticeService().searchTitle(noticeTitleSearch);
			request.setAttribute("list1", list1);
			ArrayList<Notice> list2 = new NoticeService().searchContent(noticeTitleSearch);
			request.setAttribute("list2", list2);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
			view.forward(request, response);
			
			
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
