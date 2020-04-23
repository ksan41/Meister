package com.meister.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.notice.model.service.NoticeService;

// 지점공지사항 삭제용 서블릿
/**
 * Servlet implementation class NoticeMgBmDeleteServlet
 */
@WebServlet("/imNoticeBdelete.nom")
public class NoticeMgBmDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMgBmDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		int result = new NoticeService().deleteBnotice(nno);
		
		if(result > 0) {// 공지사항 삭제 성공
			
			request.getSession().setAttribute("msg", "공지사항 삭제 성공!");
			response.sendRedirect("imNoticeBlist.nom");
			
		}else {//공지사항 삭제 실패
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('공지사항 등록이 실패했습니다. 다시 등록해주세요 T^T'); location.href='/Meister/imNoticeBdetail.nom?nno="+nno+"';</script>");
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
