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


@WebServlet("/basket.or")
public class OrderBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     	
    public OrderBasketServlet() {
        super();
    }
    
    /**
     * @author 곽진아
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getMemberNo();
		int index = Integer.parseInt(request.getParameter("index"));
		
		Price basket = new OrderService().ShowBasketList(userNo);
		if(basket != null) {
			request.setAttribute("basket", basket);
			System.out.println("저기요");
		}
		ArrayList<Pizza> pList = new MenuService().selectPizzaList();
		ArrayList<PizzaSize> sizeList = new MenuService().selectPizzaSizeList();
		
		ArrayList<Side> sList = new MenuService().selectSideList();
		ArrayList<Etc> eList = new MenuService().selectEtcList();
		ArrayList<Dough> dList = new MenuService().selectDoughList();

		ArrayList<Delivery> deliveryList = new OrderService().ShowOrderDeliveryList(loginUser.getMemberId());
		Delivery checkedDelivery = deliveryList.get(index);
		/*System.out.println( "loginUser = " + loginUser
							+ "\n deliveryList = " + deliveryList 
							+"\n checkedDelivery = " + checkedDelivery
							+ "\n basket = " + basket 
							+ "\n pList = " + pList 
							+ " \n eList = "+  eList 
							+ " \n sizeList = " + sizeList 
							+ " \n dList = " + dList 
							+ " \n userNo = " + userNo);*/
		
		session.setAttribute("dInfo", checkedDelivery);
		request.setAttribute("pList", pList);
		request.setAttribute("sList", sList);
		request.setAttribute("eList", eList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("dList", dList);
		request.setAttribute("checkedDelivery", checkedDelivery);
		request.setAttribute("userNo", userNo);

		RequestDispatcher view = request.getRequestDispatcher("/views/user/order/orderBasketMenu.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
