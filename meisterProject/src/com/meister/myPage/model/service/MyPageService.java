package com.meister.myPage.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.center.model.vo.Center;
import com.meister.coupon.model.vo.Coupon;
import com.meister.myPage.model.dao.MyPageDao;

public class MyPageService {
	
	/**
	 * 1. 쿠폰함 리스트 조회용 서비스
	 * @param memberNo	--> 로그인 되어있는 회원의 memberNo
	 * @return	--> MEMBER_COUPON 테이블로부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Coupon> selectCouponList(int memberNo){
		
		Connection conn = getConnection();
		
		ArrayList<Coupon> list = new MyPageDao().selectCouponList(conn, memberNo);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 2. 해당 회원이 작성한 1:1문의 리스트 조회용 서비스
	 * @param memberNo	--> 로그인 되어있는 회원의 memberNo
	 * @return	--> CENTER 테이블로부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Center> selectCenterList(int memberNo){
		
		Connection conn = getConnection();
		
		ArrayList<Center> list = new MyPageDao().selectCenterList(conn, memberNo);
		
		close(conn);
		
		return list;
	}

}
