package com.meister.coupon.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchCouponListServlet
 */
@WebServlet("/SearchCList.cm")
public class SearchCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCouponListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		// 쿠폰명으로 검색시 사용할 parameter
		String searchName = null;
		searchName = request.getParameter("couponName");
		
		// 쿠폰 기간별 조회시 사용할 parameter
		Date startDate=null;
		Date endDate=null;
		
		if(request.getParameter("startDate")!=null) {//startDate값이 존재한다면 변환
			startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
		}
		if(request.getParameter("endDate")!=null) {
			endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
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
