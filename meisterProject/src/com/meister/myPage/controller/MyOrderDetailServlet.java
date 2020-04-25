package com.meister.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.myPage.model.service.MyPageService;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Payment;

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
		
		Delivery dInfo = new MyPageService().selectDeliveryInfo(ono);
		Orders oInfo = new MyPageService().selectOrdersInfo(ono);
		Payment pInfo = new MyPageService().selectPaymentInfo(ono);

			
		request.setAttribute("dInfo", dInfo);	// deliveryInfo
		request.setAttribute("oInfo", oInfo);	// ordersInfo
		
		RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageOrderDetail.jsp");
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
