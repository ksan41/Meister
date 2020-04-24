package com.meister.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.AddCart;

/**
 * Servlet implementation class InsertPizzaServlet
 */
@WebServlet("/insertPizza.men")
public class InsertPizzaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPizzaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		
		String cartPizzaSize = request.getParameter("pizzaSize");
		String cartPizzaNo = request.getParameter("pizzaNo");
		String cartPizzaAmount = request.getParameter("pizzaAmount");
		String cartDough = request.getParameter("dough");
		String cartSideNo = request.getParameter("side");
		String cartSideAmount = request.getParameter("sideAmount");
		String cartEtcNo = request.getParameter("etc");
		String cartEtcAmount = request.getParameter("etcAmount");
		
		cartSideNo = cartSideNo.substring(0, cartSideNo.length()-1);
		cartSideAmount = cartSideAmount.substring(0, cartSideAmount.length()-1);
		cartEtcNo = cartEtcNo.substring(0, cartEtcNo.length()-1);
		cartEtcAmount = cartEtcAmount.substring(0, cartEtcAmount.length()-1);
		
		AddCart a = new AddCart(cartPizzaSize,cartPizzaNo,cartPizzaAmount,cartDough,cartSideNo,cartSideAmount,cartEtcNo,cartEtcAmount);
		
		//System.out.println(cartSideNo);
		
		
		int result = new MenuService().insertAddCart(a);
		
		/*
		 * System.out.println(cartPizzaSize); System.out.println(cartPizzaNo);
		 * System.out.println(cartPizzaAmount); System.out.println(cartDough);
		 * System.out.println(cartSideNo); System.out.println(cartSideAmount);
		 * System.out.println(cartEtcNo); System.out.println(cartEtcAmount);
		 */
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
