package com.meister.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;
import com.meister.myPage.model.service.MyPageService;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Payment;
import com.meister.order.model.vo.Price;

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
		
		// 해당 요청을 처리하는 서비스클래스의 메소드 호출 후 처리 결과 받기
		Delivery dInfo = new MyPageService().selectDeliveryInfo(ono);
		Orders oInfo = new MyPageService().selectOrdersInfo(ono);
		Payment pInfo = new MyPageService().selectPaymentInfo(ono);
		
		Price order = new MyPageService().selectOrderProducts(ono);
		
		ArrayList<Pizza> pList = new MenuService().selectPizzaList();
		ArrayList<PizzaSize> sizeList = new MenuService().selectPizzaSizeList();
		
		ArrayList<Side> sList = new MenuService().selectSideList();
		ArrayList<Etc> eList = new MenuService().selectEtcList();
		ArrayList<Dough> dList = new MenuService().selectDoughList();

		
		// 처리 결과를 통해 사용자가 보게될 뷰 요청
		request.setAttribute("dInfo", dInfo);	// deliveryInfo
		request.setAttribute("oInfo", oInfo);	// ordersInfo
		request.setAttribute("pInfo", pInfo);	// paymentInfo
		request.setAttribute("order", order);
		request.setAttribute("pList", pList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("sList", sList);
		request.setAttribute("eList", eList);
		request.setAttribute("dList", dList);
		
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
