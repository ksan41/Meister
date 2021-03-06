package com.meister.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.common.PageInfo;
import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nList.no")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//검색 카테고리
		String searchType = request.getParameter("searchType");
		//검색어
		String keyword = request.getParameter("keyword");
	
		
		// ---------- 페이징 처리 -----------------
		int listCount;		// 총 게시글 갯수
		int currentPage;	// 현재 체이지(즉, 요청한 페이지)
		int startPage;		// 현재 페이지 하단에 보여지는 페이징바의 시작수
		int endPage;		// 현재 페이지 하단에 보여지는 페이징바의 끝수
		int maxPage;		// 전체 페이지에서의 가장 마지막 페이지
		
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit;		// 한페이지에 보여질 게시글 최대 갯수
		
		if(keyword != null) {
			
			//* listCount : 총 게시글 갯수
			listCount = new NoticeService().getSearchListCount(keyword);
		}else {
			
			//* listCount : 총 게시글 갯수
			listCount = new NoticeService().getListCount();
		}
		
		
		//* currentPage : 현재 페이지(즉, 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 (10개 지정)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글 최대 갯수 (10개 지정)
		boardLimit = 10;
		
		// * maxPage : 총 페이지 수(마지막 페이지)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : 현재 페이지에 보여질 페이징바의 시작 수
		startPage = ((currentPage -1) / pageLimit ) * pageLimit + 1;
		
		// * endPage : 한 페이지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
		
		// 단, maxPage가 고작 13까지 밖에 안되면?
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		//PageInfo pi2 = new PageInfo(listCount2, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		//System.out.println(pi);
		// ---------- 페이징 처리 ----------------- 


		
		System.out.println(searchType);
		System.out.println(keyword);
		
		
		if(searchType != null) {
			if(searchType.equals("title")) {	// 제목 검색할 경우
				ArrayList<Notice> list = new NoticeService().searchTitle(keyword, pi);
				request.setAttribute("keyword", keyword);
				request.setAttribute("category", searchType);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
				view.forward(request, response);
				
			}else if(searchType.equals("content")) { // 내용 검색할 경우	
				ArrayList<Notice> list = new NoticeService().searchContent(keyword, pi);
				request.setAttribute("keyword", keyword);
				request.setAttribute("category", searchType);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
				view.forward(request, response);
				
			}else if(searchType.equals("titlecontent")) { // 제목  + 내용 검색할 경우	
				ArrayList<Notice> list = new NoticeService().searchTitleContent(keyword, pi);
				request.setAttribute("keyword", keyword);
				request.setAttribute("category", searchType);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
				view.forward(request, response);
				
				
			}
			
			
			
		}else{
			
			ArrayList<Notice> list = new NoticeService().selectList(pi);
			//request.setAttribute("keyword", keyword);
			//request.setAttribute("category", searchType);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeList.jsp");
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
