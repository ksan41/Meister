package com.meister.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int deliveryNo = Integer.parseInt(request.getParameter("deliveryNo"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String requirements = request.getParameter("requirements");
		
		Orders newOrder = new Orders();
		newOrder.setOrderName(name);
		newOrder.setOrderPhone(phone);
		newOrder.setOrderRequest(requirements);
		newOrder.setDeliveryNo(deliveryNo);
		newOrder.setMemberNo(memberNo);
		newOrder.setCartNo(cartNo);
		newOrder.setOrderNo(orderNo);
		newOrder.setTotalPrice(totalPrice);
		
		int result = new OrderService().insertOrders(newOrder);
		
		if(result > 0) { // 새 Orders insert성공
			
			request.setAttribute("totalPrice", totalPrice);
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/order/orderPayment.jsp");
			view.forward(request, response);
			
		}else { // 새 Orders insert실패
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			out.println("<script>alert('결제에 실패했습니다. 다시 시도해주세요.'); history.back(-1);</script>");
			out.flush();
			
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
