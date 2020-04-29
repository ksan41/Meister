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
import com.meister.order.model.vo.Delivery;

@WebServlet("/orderDelivery.or")
public class OrderDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HttpSession session = null;
		
    public OrderDeliveryServlet() {
        super();
    }

	/**
	 * @author 곽진아
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/showLoginPage.me");
		}else {
			String userId = loginUser.getMemberId();
			System.out.println("orderDeliveryServlet 딴에서 userId = " + userId);
			
			ArrayList<Delivery> deliveryList = new OrderService().ShowOrderDeliveryList(userId);
			
			session = request.getSession();
			session.setAttribute("deliveryList", deliveryList);
			RequestDispatcher view = request.getRequestDispatcher("/views/user/order/orderDelivery.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
