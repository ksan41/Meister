package com.meister.coupon.controller;

import static com.meister.common.DateTokenizer.stringToDate;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.coupon.model.service.CouponService;
import com.meister.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponMgListServlet
 */
@WebServlet("/couponList.cm")
public class CouponMgListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponMgListServlet() {
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
		
		
		if(searchName!=null) {
			ArrayList<Coupon> list = new CouponService().searchName(searchName);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/manager/couponMg/couponMgCouponList.jsp").forward(request, response);
			
		}else if(startDate!=null && endDate!=null) {
			ArrayList<Coupon> list = new CouponService().searchDate(startDate,endDate);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/manager/couponMg/couponMgCouponList.jsp").forward(request, response);
			
		}else {
			ArrayList<Coupon> list = new CouponService().selectCouponList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/manager/couponMg/couponMgCouponList.jsp").forward(request, response);
			
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
