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

import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Delivery;

/**
 * Servlet implementation class OrderDeliveryServlet
 */
@WebServlet("/orderDelivery.or")
public class OrderDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeliveryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 곽진아
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		// 3. 해당 요청을 처리하는 서비스클래스의 메소드 호출 후 처리 결과 받기
		ArrayList<Delivery> deliveryList = new OrderService().ShowOrderDeliveryList(memberId);
		
		// 4. 처리 결과를 통해 사용자가 보게될 뷰 요청
		
		if(!deliveryList.isEmpty()) {
			HttpSession session = request.getSession();
			session.setAttribute("deliveryList", deliveryList);
			RequestDispatcher view = request.getRequestDispatcher("<%=contextPath%>/views/user/order/orderDelivery.jsp");
			view.forward(request, response);
			
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/user/order/orderDelivery.jsp");
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
