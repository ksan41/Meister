package com.meister.menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;

/**
 * Servlet implementation class MenuMgPizzaListServlet
 */
@WebServlet("/menuMgPizzaList.meng")
public class MenuMgPizzaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuMgPizzaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Pizza> pList = new MenuService().selectPizzaList(); //피자 리스트
		ArrayList<PizzaSize> psList = new MenuService().selectPizzaSizeList();//피자사이즈 리스트
		
		request.setAttribute("pList", pList);
		request.setAttribute("psList", psList);
		request.getRequestDispatcher("views/manager/menuMg/menuMgPizzaList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
