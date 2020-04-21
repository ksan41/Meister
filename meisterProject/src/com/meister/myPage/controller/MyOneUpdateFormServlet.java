package com.meister.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
import com.meister.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyOneUpdateFormServlet
 */
@WebServlet("/myOneUpdateForm.my")
public class MyOneUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOneUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Center c = new MyPageService().selectCenter(cno);
		CenterImage ci = new MyPageService().selectCenterImage(cno);
		
		if(c != null) {
			
			request.setAttribute("c", c);
			request.setAttribute("ci", ci);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageOneOnOneUpdateForm.jsp");
			view.forward(request, response);
			
		}else {
			// 에러페이지 포워딩
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
