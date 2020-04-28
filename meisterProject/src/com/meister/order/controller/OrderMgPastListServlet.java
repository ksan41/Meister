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

import com.meister.member.model.vo.Manager;
import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;
import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Price;

/**
 * Servlet implementation class OrderMgPastListServlet
 */
@WebServlet("/bmOrderPast.orm")
public class OrderMgPastListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderMgPastListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 지점 메뉴바에서 로그인된 해당 지점관리자 정보 가져오기
		HttpSession session = request.getSession();
		Manager loginManager = (Manager)session.getAttribute("loginManager");

		
		//1. 지점번호(bno) 조회해오기(BRANCH테이블에서)
		int bno = new OrderService().selectBranchNo(loginManager);
		
		
		//2. 위에서 가져온 지점번호로 주문정보 조회(ORDERS,DELIVERY 조인해서)
		ArrayList<Orders> orderList = new OrderService().selectMgPastOrderList(bno);
		
		//3. 위의 olist의 주문번호로, PRICE테이블의 정보 가져오기
		ArrayList<Price> priceList = new OrderService().selectPriceList(orderList);
		
		
//		Delivery dInfo = new MyPageService().selectDeliveryInfo();
//		Orders oInfo = new MyPageService().selectOrdersInfo(ono);
//		Payment pInfo = new MyPageService().selectPaymentInfo(ono);
//		
//		Price order = new MyPageService().selectOrderProducts(ono);
		
		
		// jsp 조건처리용 메뉴정보들
		ArrayList<Pizza> pList = new MenuService().selectPizzaList();
		ArrayList<PizzaSize> sizeList = new MenuService().selectPizzaSizeList();
		ArrayList<Side> sList = new MenuService().selectSideList();
		ArrayList<Etc> eList = new MenuService().selectEtcList();
		ArrayList<Dough> dList = new MenuService().selectDoughList();
		
		
		
		// 처리 결과를 통해 사용자가 보게될 뷰 요청
//		request.setAttribute("list", list);
//		request.setAttribute("dInfo", dInfo);	// deliveryInfo
//		request.setAttribute("oInfo", oInfo);	// ordersInfo
//		request.setAttribute("pInfo", pInfo);	// paymentInfo
//		request.setAttribute("order", order);
		request.setAttribute("orderList", orderList);
		request.setAttribute("priceList", priceList);
		request.setAttribute("pList", pList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("sList", sList);
		request.setAttribute("eList", eList);
		request.setAttribute("dList", dList);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/manager/orderMg/orderMgNowList.jsp");
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
