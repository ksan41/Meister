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

import com.meister.coupon.model.vo.Coupon;
import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;
import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Cart;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Price;

/**
 * Servlet implementation class OrderBasketPaymentServlet
 */
@WebServlet("/basketPayment.or")
public class OrderBasketPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
    public OrderBasketPaymentServlet() {
        super();
    }

	/**
	 * @author 곽진아
	 * 장바구니에서 "주문하기" 클릭시 결제하기 페이지로 값 넘겨주는 기능
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextPath = request.getContextPath();
		HttpSession session = request.getSession();
		
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int loginUser = Integer.parseInt(request.getParameter("loginUser"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		//loginUser.System.out.println("basket 있니 >  ? , 그냥 basket 객체 : " + session.getAttribute("basket"));
		
		Cart cart = new Cart(orderNo, loginUser, totalPrice);
		Price basket = (Price)session.getAttribute("basket");
		
		int result = new OrderService().insertBasketPayment(cart);
		request.setAttribute("cart", cart);
		request.setAttribute("basket", basket);
		
		Delivery dInfo = new OrderService().selectDeliveryInfo(orderNo);
		request.setAttribute("dInfo", dInfo);
		

		ArrayList<Pizza> pList = new MenuService().selectPizzaList();
		ArrayList<PizzaSize> sizeList = new MenuService().selectPizzaSizeList();
		
		ArrayList<Side> sList = null;
		ArrayList<Etc> eList = null;
		ArrayList<Dough> dList = new MenuService().selectDoughList();
		
		if(!new MenuService().selectSideList().isEmpty()) {
			sList = new MenuService().selectSideList();
		}
		if(!new MenuService().selectEtcList().isEmpty()) {
			eList = new MenuService().selectEtcList();
		}
		
		request.setAttribute("pList", pList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("sList", sList);
		request.setAttribute("eList", eList);
		request.setAttribute("dList", dList);
		
		
		ArrayList<Coupon> cInfo = new OrderService().selectCouponInfo(loginUser);
		request.setAttribute("cInfo", cInfo);
		
		
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("views/user/order/orderPaymentForm.jsp");
			view.forward(request, response);
		}else { // 에러페이지로 넘기기
			RequestDispatcher view = request.getRequestDispatcher("<%=contextPath%>");
			view.forward(request, response);
		}
		
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
