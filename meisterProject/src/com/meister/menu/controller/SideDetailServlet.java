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
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Side;

/**
 * Servlet implementation class SideDetailServlet
 */
@WebServlet("/sideDetail.men")
public class SideDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SideDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int sno = Integer.parseInt(request.getParameter("sno"));
		
		ArrayList<Side> list = new MenuService().selectSideDetail(sno);
		request.setAttribute("list", list);
		ArrayList<Etc> list2 = new MenuService().selectEtcList();
		request.setAttribute("list2", list2);
		
		RequestDispatcher view = request.getRequestDispatcher("views/user/menu/menuSideDetail.jsp");
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
