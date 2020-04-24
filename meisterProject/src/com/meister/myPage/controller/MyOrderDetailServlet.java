package com.meister.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.vo.Member;
import com.meister.myPage.model.service.MyPageService;
import com.meister.order.model.vo.Orders;

/**
 * Servlet implementation class MyOrderDetailServlet
 */
@WebServlet("/myOrderDetail.my")
public class MyOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ono = Integer.parseInt(request.getParameter("ono"));
		//int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		//Orders ordersList = new MyPageService().selectOrdersDetail(ono);
		
		
		/*
		if(c != null) { // 문의조회 성공
			
			request.setAttribute("c", c);
			request.setAttribute("ci", ci);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageOneOnOneDetail.jsp");
			view.forward(request, response);
			
		}else { // 문의조회 실패
			
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('문의 조회에 실패했습니다. 다시 시도해주세요.'); location.href='myOneList.my';</script>");
			out.flush();
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
