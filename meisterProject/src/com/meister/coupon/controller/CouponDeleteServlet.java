package com.meister.coupon.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.coupon.model.service.CouponService;

/**
 * Servlet implementation class CouponDeleteServlet
 */
@WebServlet("/couponDelete.cm")
public class CouponDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String[] couList = request.getParameterValues("checkCoupon");
//		int[] arr = new int[couList.length];
//		
//		for(int i=0;i<couList.length;i++) {
//			arr[i] = Integer.parseInt(couList[i]); 
//		}
		String cArr = "";
		for(int i=0;i<couList.length;i++) {
			cArr += couList[i]+",";
		}
		cArr = cArr.substring(0, cArr.length()-1);
		
		
		
		int result = new CouponService().deleteCoupon(cArr);
		
		if(result>0) {//삭제 성공시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택한 쿠폰이 삭제되었습니다.');location.href='/Meister/couponList.cm';</script>");
			out.flush();
		}else {//삭제실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제실패. 다시 시도해주세요.');location.href='/Meister/couponList.cm';</script>");
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
