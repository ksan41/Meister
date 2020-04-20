package com.meister.myPage.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.coupon.model.vo.Coupon;
import com.meister.myPage.model.service.MyPageService;
import com.meister.member.model.vo.Member;

/**
 * Servlet implementation class MyCouponListServlet
 */
@WebServlet("/myCouponList.my")
public class MyCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCouponListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		// 해당 회원이 보유중인 쿠폰(MEMBER_COUPON 테이블) 리스트 조회 후 응답페이지에 전달
		ArrayList<Coupon> list = new MyPageService().selectCouponList(memberNo);
		
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageCoupon.jsp");
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
