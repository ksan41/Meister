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

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/nDetail.no")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
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
			RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeDetail.jsp");
			view.forward(request, response);
			
		}else {			// 조회실패
			
		}
		
		
		Notice prevN = new NoticeService().prevNotice(nno);
		
		if(prevN != null) {	// 이전글 있을때
			request.setAttribute("prevN", prevN);
			RequestDispatcher view = request.getRequestDispatcher("views/user/notice/noticeDetail.jsp");
			view.forward(request, response);
		}else {				// 이전글 없을때
			
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
