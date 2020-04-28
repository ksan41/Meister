package com.meister.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Payment;

/**
 * Servlet implementation class OrderPaymentInsert
 */
@WebServlet("/orderPayInsert.or")
public class OrderPaymentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPaymentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		//String pay_method = request.getParameter("pay_method");
		//int amount = Integer.parseInt(request.getParameter("amount"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		Payment pm = new Payment();
		pm.setPaymentPrice(totalPrice);
		//pm.setPaymentType(pay_method);
		pm.setReceiptNo(rno);
		
		int result = new OrderService().paymentInsert(pm);
		
		if(result > 0) {
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/order/orderPaymentSuccess.jsp");
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
