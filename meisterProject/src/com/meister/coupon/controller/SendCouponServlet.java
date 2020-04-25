package com.meister.coupon.controller;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.coupon.model.service.CouponService;

/**
 * Servlet implementation class SendCouponServlet
 */
@WebServlet("/sendCoupon.cm")
public class SendCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//회원번호 담긴 문자열 ->
		String mArr = request.getParameter("userNo");
		StringTokenizer st = new StringTokenizer(mArr,",");
		String[] mList = new String[st.countTokens()];
		int cnt=0;
		
		while(st.hasMoreTokens()) {
			mList[cnt++] = st.nextToken();
		}
		
		// 쿠폰번호 담긴 배열
		String[] cList = request.getParameterValues("checkCou");
		
		int result = new CouponService().sendCoupon(mList,cList);
		
		if(result>0) {
			
		}else {
			
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
