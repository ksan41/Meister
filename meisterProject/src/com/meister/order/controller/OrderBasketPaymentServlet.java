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
import com.meister.order.model.vo.Delivery;

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
		
		// 1. request에 담겨있는 요청시 전달값 뽑아서 변수 또는 객체에 기록하기 (getParameter)
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int loginUser = Integer.parseInt(request.getParameter("loginUser"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));

		session = request.getSession();

		// 3. 서비스 클래스에 메소드 호출(전달값 전달) 및 처리 결과 받기
		int result = new OrderService().insertAddress(d);
		
		// 4. 처리 결과를 가지고 성공인지 실패인지 판단해서 사용자가 보게될 뷰 지정
			if(result > 0) { // insert됨 --> 회원가입성공
				
				session = request.getSession();
				session.setAttribute("d", d);
				RequestDispatcher view = request.getRequestDispatcher("/orderDelivery.or"); // orderDelivery.or 서블릿 요청해라
				view.forward(request, response);
				
			}else { // insert안됨 --> 회원가입실패
				
				request.setAttribute("msg", "배달주소 등록 실패!!");
				RequestDispatcher view = request.getRequestDispatcher("/views/common_user/errorPage.jsp");
				view.forward(request, response);
				
				
			}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
