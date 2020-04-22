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
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;

/**
 * Servlet implementation class PizzaDetailServlet
 */
@WebServlet("/pizzaDetail.men")
public class PizzaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PizzaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ArrayList<Pizza> list = new MenuService().selectPizzaDetail(pno);
		request.setAttribute("list", list);
		ArrayList<PizzaSize> list2 = new MenuService().selectPizzaSizeDetail(pno);
		request.setAttribute("list2", list2);
		ArrayList<Side> list3 =  new MenuService().selectSideList();
		request.setAttribute("list3", list3);
		ArrayList<Etc> list4 = new MenuService().selectEtcList();
		request.setAttribute("list4", list4);
		ArrayList<Dough> list5 = new MenuService().selectDoughList();
		request.setAttribute("list5", list5);
		
		RequestDispatcher view = request.getRequestDispatcher("views/user/menu/menuPizzaDetail.jsp");
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
