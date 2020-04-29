package com.meister.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.member.model.vo.Member;
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
		
		// 지점 메뉴바에서 로그인된 해당 지점관리자 정보 가져오기
		HttpSession session = request.getSession();
		Member loginManager = (Member)session.getAttribute("loginUser");
		
		
		//1. 회원번호
		int mno = loginManager.getMemberNo();
		
		
		//2. 위에서 가져온 회원번호로 주문번호 조회(RECEIPT_NO)
		int rno = new OrderService().selectOrdersRno(mno);
		
		
		//int rno = Integer.parseInt(request.getParameter("rno"));
		//String pay_method = request.getParameter("pay_method");
		//int amount = Integer.parseInt(request.getParameter("amount"));
		
		//3. 결제창에서 총 결제금액 가져오기
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		System.out.println(totalPrice);
		
		Payment pm = new Payment();
		pm.setPaymentPrice(totalPrice);
		//pm.setPaymentType(pay_method);
		pm.setReceiptNo(rno);
		
		int result = new OrderService().paymentInsert(pm);
		
		
		 if(result > 0) {
		  
		 RequestDispatcher view = request.getRequestDispatcher("paymentSuccess.or");
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
