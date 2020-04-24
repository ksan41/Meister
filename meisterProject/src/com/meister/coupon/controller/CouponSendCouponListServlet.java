package com.meister.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.coupon.model.service.CouponService;
import com.meister.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponSendCouponListServlet
 */
@WebServlet("/couponSendCpList.cm")
public class CouponSendCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponSendCouponListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String[] memList = request.getParameterValues("checkMem");
		String mArr = "";
		for(int i=0;i<memList.length;i++) {
			mArr += memList[i]+",";
		}
		mArr = mArr.substring(0, mArr.length()-1);
		ArrayList<Coupon> cList = new CouponService().selectCouponList();
		
		//체크된 회원들의 회원번호가 담긴 문자열 "1,2,3...." 쿠폰 발송페이지로 전달
		request.setAttribute("mArr", mArr);
		
		//쿠폰정보 불러오기
		request.setAttribute("cList", cList);
		RequestDispatcher view = request.getRequestDispatcher("views/manager/couponMg/couponMgSendMemberCouponList.jsp");
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
