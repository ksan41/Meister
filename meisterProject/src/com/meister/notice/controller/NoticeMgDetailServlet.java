package com.meister.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;

/// 통합관리자 고객 공지사항 상세보기
/**
 * Servlet implementation class NoticeMgDetailServlet
 */
@WebServlet("/imNoticeMdetail.nom")
public class NoticeMgDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMgDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		Notice n = new NoticeService().selectNotice(nno);
		
		if(n != null) {	// 조회성공
			
			new NoticeService().increaseCount(nno);

			request.setAttribute("n", n);
			RequestDispatcher view = request.getRequestDispatcher("views/manager/noticeMg/noticeMgDetail.jsp");
			view.forward(request, response);
			
		}else {			// 조회실패
			
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