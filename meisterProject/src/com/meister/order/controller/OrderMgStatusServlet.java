package com.meister.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Orders;

/**
 * Servlet implementation class OrderMgStatusServlet
 */
@WebServlet("/bmOrderStatus.orm")
public class OrderMgStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderMgStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int ono = Integer.parseInt(request.getParameter("ono"));
		
		Orders o = new Orders();
		o.setReceiptNo(ono);
		
		int result = new OrderService().updateOrderStatus(o);
		
		if(result > 0) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('접수성공'); location.href='/Meister/bmOrderNow.orm?ono=" + ono + "';</script>");
			out.flush();
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('접수실패'); location.href='/Meister/bmOrderNow.orm?ono=" + ono + "';</script>");
			out.flush();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
