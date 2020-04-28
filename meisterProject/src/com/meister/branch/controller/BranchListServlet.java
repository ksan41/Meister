package com.meister.branch.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.branch.model.service.BranchService;
import com.meister.branch.model.vo.Branch;
import com.meister.member.model.vo.Manager;

/**
 * Servlet implementation class BranchListServlet
 */
@WebServlet("/branchList.br")
public class BranchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Branch> bList = new BranchService().selectBranchList();
		ArrayList<Manager> mList = new BranchService().selectManagerList();
		
		HttpSession session = request.getSession();
		
		response.setCharacterEncoding("utf-8");
		
		session.setAttribute("bList", bList);
		session.setAttribute("mList", mList);
		RequestDispatcher view = request.getRequestDispatcher("views/manager/branch/branchList.jsp");
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
