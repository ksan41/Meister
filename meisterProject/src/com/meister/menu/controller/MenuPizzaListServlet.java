package com.meister.menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;

/**
 * Servlet implementation class MenuPizzaListServlet
 */
@WebServlet("/pizzaList.men")
public class MenuPizzaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuPizzaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<Pizza> list1 = new MenuService().selectPizzaList();
		
		request.setAttribute("list1", list1);
		
//		RequestDispatcher view1 = request.getRequestDispatcher("views/user/menu/menuPizzaList.jsp");
//		view1.forward(request, response);
		
		ArrayList<PizzaSize> list2 = new MenuService().selectPizzaSizeList();
		
		request.setAttribute("list2", list2);
		
		RequestDispatcher view2 = request.getRequestDispatcher("views/user/menu/menuPizzaList.jsp");
		view2.forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
