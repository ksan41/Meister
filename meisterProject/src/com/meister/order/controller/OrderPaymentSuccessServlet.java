package com.meister.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.vo.Member;
import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Orders;

/**
 * Servlet implementation class OrderPaymentSuccessServlet
 */
@WebServlet("/orderPaySuccess.or")
public class OrderPaymentSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPaymentSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String requirements = request.getParameter("requirements");
		
		Orders newOrder = new Orders();
		newOrder.setMemberNo(memberNo);
		newOrder.setOrderNo(orderNo);
		newOrder.setOrderName(name);
		newOrder.setOrderPhone(phone);
		newOrder.setOrderRequest(requirements);
		
		int result = new OrderService().insertOrders(newOrder);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
