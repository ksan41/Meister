package com.meister.coupon.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.meister.coupon.model.dao.CouponDao;
import com.meister.coupon.model.vo.Coupon;


public class CouponService {
	
	
	/**산
	 * 통합관리자- 쿠폰리스트 조회용 서비스
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> selectCouponList(){
		
		Connection conn = getConnection();
		ArrayList<Coupon> list = new CouponDao().selectCouponList(conn);
		
		close(conn);
		return list;
		
	}
	
	
	
	/**산
	 * 통합관리자- 쿠폰명 검색 서비스
	 * @param searchName : 검색할 쿠폰명(키워드)
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> searchName(String searchName){
		
		Connection conn = getConnection();
		ArrayList<Coupon> list = new CouponDao().searchName(conn,searchName);
		
		close(conn);
		return list;
		
	}
	
	
	
	/**산
	 * 통합관리자- 쿠폰 기간별 조회 서비스
	 * @param startDate : 조회할 쿠폰기간 시작날짜
	 * @param endDate : 조회할 쿠폰기간 끝날짜
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> searchDate(Date startDate,Date endDate){
		Connection conn = getConnection();
		ArrayList<Coupon> list = new CouponDao().searchDate(conn,startDate,endDate);
		
		close(conn);
		return list;
	}
	
	
	/**산
	 * 통합관리자- 쿠폰 등록 서비스
	 * @param newC : 등록할 쿠폰 정보가 담긴 Coupon객체
	 * @return : 처리된 행의개수
	 */
	public int insertCoupon(Coupon newC) {
		
		Connection conn = getConnection();
		int result = new CouponDao().insertCoupon(conn,newC);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
}
