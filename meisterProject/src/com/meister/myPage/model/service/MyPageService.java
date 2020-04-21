package com.meister.myPage.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
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
	
	
	/**
	 * 3. 해당 회원이 작성한 1:1문의 상세 조회용 서비스 (게시글 정보)
	 * @param cno	--> 조회하고자 하는 해당 문의글 번호
	 * @return		--> 조회된 해당 문의글이 담겨있는 Center객체
	 */
	public Center selectCenter(int cno) {
		
		Connection conn = getConnection();
		
		Center c = new MyPageDao().selectCenter(conn, cno);
		
		close(conn);
		
		return c;
	}
	
	
	/**
	 * 4. 해당 회원이 작성한 1:1문의 상세 조회용 서비스 (첨부파일 정보)
	 * @param cno	--> 조회하고자 하는 해당 문의글 번호
	 * @return		--> 조회된 해당 문의글의 첨부파일이 담겨있는 CenterImage객체
	 */
	public CenterImage selectCenterImage(int cno) {
		
		Connection conn = getConnection();
		
		CenterImage ci = new MyPageDao().selectCenterImage(conn, cno);
		
		close(conn);
		
		return ci;
	}
	
	
	/**
	 * 5. 1:1문의 삭제용 서비스
	 * @param cno	--> 삭제 요청한 문의글 번호
	 * @return		--> 처리된 행의 갯수
	 */
	public int deleteCenter(int cno) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().deleteCenter(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
