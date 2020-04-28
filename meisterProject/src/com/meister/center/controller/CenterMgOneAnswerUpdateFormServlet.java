package com.meister.center.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.service.CenterService;
import com.meister.center.model.vo.Center;
import com.meister.notice.model.service.NoticeService;
import com.meister.notice.model.vo.Notice;

/**
 * Servlet implementation class CenterMgOneAnswerServlet
 */
@WebServlet("/ceMgOneAnswerUpdateForm.cem")
public class CenterMgOneAnswerUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterMgOneAnswerUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ino = Integer.parseInt(request.getParameter("ino"));	// "42"
		
		Center c = new CenterService().selectNotice(ino);
		
		if(c != null) {
			
			request.setAttribute("c", c);
			request.getRequestDispatcher("views/manager/noticeMg/noticeMgUpdateForm.jsp").forward(request, response);
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('고객 공지사항 수정폼이 실패했습니다. 다시해!!!!'); location.href='/Meister/imNoticeMdetail.nom?nno="+nno+"';</script>");
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
