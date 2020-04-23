package com.meister.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.common.PageInfo;
import com.meister.member.model.vo.Member;
import com.meister.menu.model.vo.Pizza;
import com.meister.myPage.model.service.MyPageService;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Price;

/**
 * Servlet implementation class MyOrderListServlet
 */
@WebServlet("/myOrderList.my")
public class MyOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문내역 조회하고 성공시 myPageOrder로 ArrayList 전달, 화면 출력
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		ArrayList<Pizza> pizzaList = new MyPageService().selectPizzaList();
		ArrayList<Orders> ordersList = new MyPageService().selectOrdersList(memberNo);
		ArrayList<Price> priceList = new MyPageService().selectPriceList(memberNo);
		
		request.setAttribute("pizzaList", pizzaList);
		request.setAttribute("ordersList", ordersList);
		request.setAttribute("priceList", priceList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageOrder.jsp");
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
