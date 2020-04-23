package com.meister.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeMgUpdateServlet
 */
@WebServlet("/imNoticeMupdate.nom")
public class NoticeMgUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMgUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청시 한글이 전달될 경우를 대비해서
		request.setCharacterEncoding("utf-8");
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeNo(nno);
		n.setNoticeTitle(title);
		n.setNoticeContent(content);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			
			// 상세보기 요청
			response.sendRedirect("imNoticeMdetail.nom?nno=" + nno);
			
		}else {
//			// errorPage.jsp 로 포워딩
//			request.setAttribute("msg", "실패");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('고객 공지사항 수정이 실패했습니다. 다시 수정해!!!!'); location.href='/Meister/imNoticeMdetail.nom?nno="+nno+"';</script>");
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