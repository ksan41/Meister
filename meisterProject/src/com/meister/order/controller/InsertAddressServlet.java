package com.meister.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meister.member.model.vo.Member;
import com.meister.order.model.service.OrderService;
import com.meister.order.model.vo.Delivery;

@WebServlet("/insertAddress.or")
public class InsertAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HttpSession session = null;
	
    public InsertAddressServlet() {
        super();
    }
 
	/**
	 * @author 곽진아
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String newAddress1 = request.getParameter("newAddress1");
		String newAddress2 = request.getParameter("newAddress2");
		String newPoCode = request.getParameter("newPoCode");
		String deliveryName = request.getParameter("deliveryName");
		int branchNo = (int)(Math.random() * 10 + 101); // 지점 랜덤으로 입력되게 설정

		
		session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getMemberId();
		
		System.out.println("insertAddressServlet 딴에서 userId = " + userId);
		
		int memberNo = Integer.parseInt(new OrderService().getMemberNo(userId));
		String referenceAddress = request.getParameter("referenceAddress");
		Delivery d = new Delivery(newAddress1, newAddress2, newPoCode, deliveryName, branchNo, memberNo, referenceAddress);
		
		int result = new OrderService().insertAddress(d);
		
			if(result > 0) {
				
				session = request.getSession();
				session.setAttribute("d", d);
				RequestDispatcher view = request.getRequestDispatcher("/orderDelivery.or");
				view.forward(request, response);
				
			}else {
				
				request.setAttribute("msg", "배달주소 등록 실패!!");
				RequestDispatcher view = request.getRequestDispatcher("/views/common_user/errorPage.jsp");
				view.forward(request, response);
				
				
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
