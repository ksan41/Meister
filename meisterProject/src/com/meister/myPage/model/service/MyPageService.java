package com.meister.myPage.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.coupon.model.vo.Coupon;
import com.meister.myPage.model.dao.MyPageDao;

public class MyPageService {
	
	/**
	 * 1. 쿠폰함 리스트 조회용 서비스
	 * @return	--> MEMBER_COUPON 테이블로부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Coupon> selectCouponList(int memberNo){
		
		Connection conn = getConnection();
		
		ArrayList<Coupon> list = new MyPageDao().selectCouponList(conn, memberNo);
		
		close(conn);
		
		return list;
	}

}
