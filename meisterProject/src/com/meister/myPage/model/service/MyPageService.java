package com.meister.myPage.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
import com.meister.coupon.model.vo.Coupon;
import com.meister.member.model.vo.Member;
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
	
	
	/**
	 * 6. 1:1문의 수정용 서비스
	 * @param c		--> Center테이블 update
	 * @param ci	--> CenterImage테이블 update 또는 insert할 데이터가 담겨있는 객체
	 * @return		--> 처리된 행의 갯수
	 */
	public int updateCenter(Center c, CenterImage ci) {
		
		Connection conn = getConnection();
		
		int result1 = new MyPageDao().updateCenter(conn, c);
		int result2 = 1;
		
		if(ci != null) {	// 새로이 추가된 첨부파일이 있을 경우
		
			if(ci.getFileNo() != 0) {	// 기존에 첨부파일이 있었을 경우 --> update
				result2 = new MyPageDao().updateCenterImage(conn, ci);
			}else {	// 기존에 첨부파일이 없었을 경우 --> insert
				result2 = new MyPageDao().insertCenterImage(conn, ci);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
	}
	
	
	/**
	 * 7. 개인정보 수정 전 비밀번호 확인용 서비스
	 * @param memberId	--> 개인정보 수정을 요청한 loginUser의 아이디
	 * @return			--> loginUser의 비밀번호를 리턴, 입력한 값과 비교할 것임
	 */
	public String updateCheckPwd(String memberId) {
		
		Connection conn = getConnection();
		
		String memberPwd = new MyPageDao().updateCheckPwd(conn, memberId);
		
		close(conn);
		
		return memberPwd;
	}
	
	
	/**
	 * 8. 비밀번호 변경용 서비스
	 * @param m		--> 비밀번호 변경할 회원의 회원번호, 새 비밀번호가 담겨있는 Member객체
	 * @return		--> 처리된 행의 갯수
	 */
	public int updatePwd(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().updatePwd(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 9. 회원 정보 수정용 서비스
	 * @param m		--> 정보 수정할 회원의 회원번호, 수정할 
	 * @return
	 */
	public int updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().updateMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
