package com.meister.coupon.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.meister.coupon.model.service.CouponService;
import com.meister.coupon.model.vo.Coupon;

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
		String nameSearch = null;
		nameSearch = request.getParameter("nameSearch");
		
		// 쿠폰 기간별 조회시 사용할 parameter
		Date searchStart=null;
		Date searchEnd=null;
		
		if(request.getParameter("searchStart")!=null) {//startDate값이 존재한다면 변환
			searchStart = java.sql.Date.valueOf(request.getParameter("searchStart"));
		}
		if(request.getParameter("searchEnd")!=null) {
			searchEnd = java.sql.Date.valueOf(request.getParameter("searchEnd"));
		}
		
		
		if(nameSearch!=null) { //이름검색할 경우
			response.setContentType("application/json; charset=utf-8");
			ArrayList<Coupon> list = new CouponService().searchName(nameSearch);
//			Gson gson = new Gson();
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list, response.getWriter());
		}else if(searchStart!=null && searchEnd!=null) { //날짜검색할 경우
			response.setContentType("application/json; charset=utf-8");
			ArrayList<Coupon> list = new CouponService().searchDate(searchStart,searchEnd);
			//Gson gson = new Gson();
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list, response.getWriter());
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
