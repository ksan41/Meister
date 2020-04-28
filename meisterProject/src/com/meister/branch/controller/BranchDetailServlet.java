package com.meister.branch.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.branch.model.service.BranchService;
import com.meister.branch.model.vo.Branch;
import com.meister.member.model.vo.Manager;

/**
 * Servlet implementation class BranchDetailServlet
 */
@WebServlet("/branchDetail.br")
public class BranchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Branch b = new BranchService().selectOneBranch(bno);
		Manager m = new BranchService().selectOneManager(bno);
		
		request.setAttribute("b", b);
		request.setAttribute("m", m);
		
		RequestDispatcher view = request.getRequestDispatcher("views/manager/branch/branchDetail.jsp");
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
