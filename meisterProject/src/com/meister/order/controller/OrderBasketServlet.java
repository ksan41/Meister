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
import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;
import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Price;

/**
 * Servlet implementation class OrderBasketServlet
 */
@WebServlet("/basket.or")
public class OrderBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     	HttpSession session = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		String addressArea = (String)session.getAttribute("addressArea");
		session.setAttribute("addressArea", addressArea);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getMemberNo();
		int index = Integer.parseInt(request.getParameter("index"));
		//System.out.println("orderBasket 딴에서 userNo = " + userNo);
		
		// 3. 해당 요청을 처리하는 서비스클래스의 메소드 호출 후 처리 결과 받기
		Price basket = new OrderService().ShowBasketList(userNo);
		
		ArrayList<Pizza> pList = new MenuService().selectPizzaList();
		ArrayList<PizzaSize> sizeList = new MenuService().selectPizzaSizeList();
		
		ArrayList<Side> sList = new MenuService().selectSideList();
		ArrayList<Etc> eList = new MenuService().selectEtcList();
		ArrayList<Dough> dList = new MenuService().selectDoughList();
		
		ArrayList<Delivery> deliveryList = new OrderService().ShowOrderDeliveryList(loginUser.getMemberId());
		Delivery checkedDelivery = deliveryList.get(index);
		
		// 4. 처리 결과를 통해 사용자가 보게될 뷰 요청
		request.setAttribute("basket", basket);
		request.setAttribute("pList", pList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("sList", sList);
		request.setAttribute("eList", eList);
		request.setAttribute("dList", dList);
		request.setAttribute("checkedDelivery", checkedDelivery);
		
		System.out.println(basket);
		RequestDispatcher view = request.getRequestDispatcher("/views/user/order/orderBasketMenu.jsp");
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
