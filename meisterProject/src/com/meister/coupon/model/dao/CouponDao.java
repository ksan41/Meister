package com.meister.coupon.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.coupon.model.vo.Coupon;
import static com.meister.common.JDBCTemplate.*;

public class CouponDao {
	
	private Properties prop = new Properties();
	
	public CouponDao() {
		
		String filePath = CouponDao.class.getResource("/sql/coupon/couponQuery.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**산
	 * 통합관리자- 쿠폰리스트 조회용 서비스
	 * @param conn : CouponService에서 생성한 Connection객체
	 * @return : 조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> selectCouponList(Connection conn){
		
		ArrayList<Coupon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCouponList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Coupon c = new Coupon(
						rset.getInt("COUPON_NO"),
						rset.getString("COUPON_NAME"),
						rset.getInt("COUPON_DISCOUNT"),
						rset.getDate("COUPON_START"),
						rset.getDate("COUPON_END"),
						rset.getDate("COUPON_REGISTER_DATE"),
						rset.getDate("COUPON_MODIFY_DATE"),
						rset.getString("COUPON_STATUS")
						);
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	
	/**산
	 * 통합관리자- 쿠폰명 검색 dao
	 * @param conn : CouponService에서 생성한 Connection객체
	 * @param name : 검색할 쿠폰명(키워드)
	 * @return :조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> searchName(Connection conn,String name){
		
		ArrayList<Coupon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Coupon c = new Coupon(
						rset.getInt("COUPON_NO"),
						rset.getString("COUPON_NAME"),
						rset.getInt("COUPON_DISCOUNT"),
						rset.getDate("COUPON_START"),
						rset.getDate("COUPON_END"),
						rset.getDate("COUPON_REGISTER_DATE"),
						rset.getDate("COUPON_MODIFY_DATE"),
						rset.getString("COUPON_STATUS")
						);
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	/**산
	 * 통합관리자- 쿠폰 기간별 조회 dao
	 * @param conn : CouponService에서 생성한 Connection객체
	 * @param startDate : 조회할 쿠폰기간 시작날짜
	 * @param endDate : 조회할 쿠폰기간 끝날짜
	 * @return :조회된 Coupon객체가 담긴 ArrayList
	 */
	public ArrayList<Coupon> searchDate(Connection conn,String startDate,String endDate){
		ArrayList<Coupon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Coupon c = new Coupon(
						rset.getInt("COUPON_NO"),
						rset.getString("COUPON_NAME"),
						rset.getInt("COUPON_DISCOUNT"),
						rset.getDate("COUPON_START"),
						rset.getDate("COUPON_END"),
						rset.getDate("COUPON_REGISTER_DATE"),
						rset.getDate("COUPON_MODIFY_DATE"),
						rset.getString("COUPON_STATUS")
						);
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	/** 산
	 * 통합관리자- 쿠폰 등록 dao
	 * @param conn : CouponService에서 생성한 Connection객체
	 * @param newC : 등록할 쿠폰 정보가 담긴 Coupon객체
	 * @return : 처리된 행의개수
	 */
	public int insertCoupon(Connection conn, Coupon newC) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newC.getCouponName());
			pstmt.setInt(2, newC.getCouponDiscount());
			pstmt.setDate(3, newC.getCouponStart());
			pstmt.setDate(4, newC.getCouponEnd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}
}
