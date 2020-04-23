package com.meister.coupon.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.coupon.model.service.CouponService;
import com.meister.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponInsertServlet
 */
@WebServlet("/couponInsert.cm")
public class CouponInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String couponName = request.getParameter("couponName");
//		int discount = Integer.parseInt(request.getParameter("discount"));
		int discount = request.getParameter("discount");
		Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
		Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
		
		Coupon newC = new Coupon();
		newC.setCouponName(couponName);
		newC.setCouponDiscount(discount);
		newC.setCouponStart(startDate);
		newC.setCouponEnd(endDate);
		
		
		int result = new CouponService().insertCoupon(newC);
		
		if(result>0) { //insert성공
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+couponName+" 성공적으로 등록되었습니다.');location.href='/Meister/couponList.cm';</script>");
			out.flush();
			
		}else {//insert실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('쿠폰등록에 실패했습니다. 다시 시도해주세요. ');location.href='/Meister/couponList.cm';</script>");
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
