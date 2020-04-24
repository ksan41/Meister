package com.meister.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.member.model.vo.Member;
import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Price;

/**
 * Servlet implementation class OrderBasketServlet
 */
@WebServlet("/basket.or")
public class OrderBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HttpSession session = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getMemberNo();
		System.out.println("orderBasket 딴에서 userNo = " + userNo);
		
		// 3. 해당 요청을 처리하는 서비스클래스의 메소드 호출 후 처리 결과 받기
		ArrayList<Price> basketList = new OrderService().ShowBasketList(userNo);
		//System.out.println("서블릿딴 : " +deliveryList.get(0));
		
		// 4. 처리 결과를 통해 사용자가 보게될 뷰 요청
		session = request.getSession();
		session.setAttribute("basketList", basketList);
		RequestDispatcher view = request.getRequestDispatcher("/views/user/order/orderBasketMenu.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
