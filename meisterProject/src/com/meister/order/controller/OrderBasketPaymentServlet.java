package com.meister.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Cart;

/**
 * Servlet implementation class OrderBasketPaymentServlet
 */
@WebServlet("/basketPayment.or")
public class OrderBasketPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HttpSession session = null;
	
    public OrderBasketPaymentServlet() {
        super();
    }

	/**
	 * @author 곽진아
	 * 장바구니에서 "주문하기" 클릭시 결제하기 페이지로 값 넘겨주는 기능
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int loginUser = Integer.parseInt(request.getParameter("loginUser"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));

		session = request.getSession();

		Cart cart = new Cart(orderNo, loginUser, totalPrice);
		
		int result = new OrderService().insertBasketPayment(cart);
		request.setAttribute("cart", cart);
		
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("<%=contextPath%>/views/user/order/orderPaymentForm.jsp");
			view.forward(request, response);
		}else { // 에러페이지로 넘기기
			RequestDispatcher view = request.getRequestDispatcher("<%=contextPath%>");
			view.forward(request, response);
		}
		
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
