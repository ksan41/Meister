package com.meister.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Delivery;

/**
 * Servlet implementation class InsertAddressServlet
 */
@WebServlet("/insertAddress.or")
public class InsertAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. request에 담겨있는 요청시 전달값 뽑아서 변수 또는 객체에 기록하기 (getParameter)
		int deliveryNo = 6;
		String newAddress1 = request.getParameter("newAddress1");
		String newAddress2 = request.getParameter("newAddress2");
		String newPoCode = request.getParameter("newPoCode");
		String addressStatus = "F";
		String deliveryName = request.getParameter("deliveryName");
		int branchNo = 1;
		int memberNo = 1;
		//String referenceAddress = request.getParameter("sample3_extraAddress").substring(request.getParameter("sample3_extraAddress").indexOf(","));
		String referenceAddress = request.getParameter("referenceAddress");

		Delivery d = new Delivery(deliveryNo, newAddress1, newAddress2, newPoCode, addressStatus, deliveryName, branchNo, memberNo, referenceAddress);
		
		// 3. 서비스 클래스에 메소드 호출(전달값 전달) 및 처리 결과 받기
		int result = new OrderService().insertAddress(d);
		
		// 4. 처리 결과를 가지고 성공인지 실패인지 판단해서 사용자가 보게될 뷰 지정
			if(result > 0) { // insert됨 --> 회원가입성공
				
				HttpSession session = request.getSession();
				session.setAttribute("d", d);
				RequestDispatcher view = request.getRequestDispatcher("views/user/orderDelivery.jsp"); // orderDelivery.or 서블릿 요청해라
				view.forward(request, response);
				
			}else { // insert안됨 --> 회원가입실패
				
				request.setAttribute("msg", "배달주소 등록 실패!!");
				RequestDispatcher view = request.getRequestDispatcher("views/common_user/errorPage.jsp");
				view.forward(request, response);
				
				
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
