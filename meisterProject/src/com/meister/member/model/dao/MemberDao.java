package com.meister.member.model.dao;


import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.getConnection;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.member.model.vo.Manager;
import com.meister.member.model.vo.Member;

public class MemberDao {
	
private Properties prop = new Properties();
	
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/sql/member/memberQuery.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		
	    Member loginUser = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
					loginUser = new Member(rset.getInt("MEMBER_NO"),
							
							    rset.getString("MEMBER_NAME"),
				                rset.getString("MEMBER_ID"),
				                rset.getString("MEMBER_PWD"),
				                rset.getDate("MEMBER_BIRTH"),
				                rset.getString("MEMBER_GENDER"),
				                rset.getString("MEMBER_PHONE"),
				                rset.getString("MEMBER_EMAIL"),
				                rset.getDate("MEMBER_ENROLLDATE"),
				                rset.getDate("MODIFY_DATE"),
				                rset.getString("MEMBER_STATUS"),
				                rset.getString("LEAVE_TYPE"),
				                rset.getString("LEAVE_REASON"),

			                    rset.getString("PAYMENT_TYPE"));

			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally  {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
		
	}
	
		
		// 회원가입
        public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3, m.getMemberPwd());
			// 생일?? 
			pstmt.setDate(4, m.getMemberBirth());
			
			pstmt.setString(5, m.getMemberGender());
			pstmt.setString(6, m.getMemberPhone());
			pstmt.setString(7, m.getMemberEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
        
        
	/**권산
	 * #관리자 로그인용 dao
	 * @param conn : MemberService에서 생성한 Connection객체
	 * @param managerId : 사용자가 관리자로그인페이지에서 입력한 id
	 * @param password : 사용자가 관리자로그인페이지에서 입력한 비밀번호
	 * @return 조회된 관리자객체(Manager)
	 */
	public Manager loginManager(Connection conn, String managerId, String password) {
		
		Manager loginManager = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginManager");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerId);
			pstmt.setString(2, password);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginManager = new Manager(rset.getInt("MANAGER_NO"),
										   rset.getString("MANAGER_ID"),rset.getString("MANAGER_PWD"),
										   rset.getString("MANAGER_TYPE"),rset.getString("MANAGER_NAME"),
										   rset.getString("MANAGER_PHONE"),rset.getString("MANAGER_EMAIL"),rset.getString("MANAGER_GENDER"),
										   rset.getDate("MANAGER_ENROLLDATE"),rset.getDate("MODIFY_DATE"),
										   rset.getString("MANAGER_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginManager;
	}
	
	/**연화->산
	 * 통합관리자-회원관리/회원정보 조회용 dao
	 * @param conn : MemberService에서 생성된 Connection 객체
	 * @return : 조회된 Member객체들이 담긴 ArrayList
	 */
	public ArrayList<Member> selectMemberList(Connection conn) {
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberEnrolldate(rset.getDate("MEMBER_ENROLLDATE"));
				m.setMemberCouponCnt(rset.getInt("coupon_cnt"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	/** 지수
	 * 회원탈퇴용 dao
	 * @param conn		: MemberService에서 생성된 Connection 객체
	 * @param m			: 탈퇴할 회원의 회원 번호와 탈퇴 타입, 탈퇴 사유가 담겨있는 Member객체
	 * @return			: 처리된 행의 갯수
	 */
	public int deleteMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getLeaveType());
			pstmt.setString(2, m.getLeaveReason());
			pstmt.setInt(3, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**산
	 * 통합관리자-회원 탈퇴처리용 dao
	 * @param conn : MemberService에서 생성된 Connection 객체
	 * @param memberNo : 탈퇴처리할 회원번호
	 * @return : 처리된 행의갯수
	 */
	public int deleteMgMember(Connection conn,int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mgDeleteMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**산
	 * 통합관리자-탈퇴회원 리스트 조회용 서비스
	 * @param conn : MemberService에서 생성된 Connection 객체
	 * @return : 조회된 Member객체가 담긴ArrayList
	 */
	public ArrayList<Member> selectDropMemList(Connection conn){
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mgSelectDropList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setLeaveType(rset.getString("LEAVE_TYPE"));
				m.setLeaveReason(rset.getString("LEAVE_REASON"));
				
				list.add(m);
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
     * 통합관리자- 회원리스트 이름별 검색용 서비스
     * @param conn : MemberService에서 생성된 Connection 객체
     * @param name : 조회할 이름(키워드)
     * @return : 조회된 Member객체가 담긴 ArrayList
     */
    public ArrayList<Member> searchName(Connection conn,String name){
    	
    	ArrayList<Member> list = new ArrayList<>();
    	PreparedStatement pstmt = null;
    	ResultSet rset = null;
    	
    	String sql = prop.getProperty("searchMemName");
    	
    	try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberEnrolldate(rset.getDate("MEMBER_ENROLLDATE"));
				m.setMemberCouponCnt(rset.getInt("coupon_cnt"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
    	
    	return list;
    }
    
    //회원 재조회용
	public Member selectMember(Connection conn, int memberNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
						    rset.getString("MEMBER_NAME"),
			                rset.getString("MEMBER_ID"),
			                rset.getString("MEMBER_PWD"),
			                rset.getDate("MEMBER_BIRTH"),
			                rset.getString("MEMBER_GENDER"),
			                rset.getString("MEMBER_PHONE"),
			                rset.getString("MEMBER_EMAIL"),
			                rset.getDate("MEMBER_ENROLLDATE"),
			                rset.getDate("MODIFY_DATE"),
			                rset.getString("MEMBER_STATUS"),
			                rset.getString("LEAVE_TYPE"),
			                rset.getString("LEAVE_REASON"),
		                    rset.getString("PAYMENT_TYPE"));

		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	
	/**산
	 * 통합관리자 - 회원리스트 가입기간별 조회dao
	 * @param conn : service에서 생성된 Connection객체
	 * @param startDate : 조회할 가입일 시작날짜
	 * @param endDate : 조회할 가입일 끝 날짜
	 * @return : 조회된 Member객체가 담긴 ArrayList
	 */
	public ArrayList<Member> searchDate(Connection conn,String startDate,String endDate){
		
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMemDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberEnrolldate(rset.getDate("MEMBER_ENROLLDATE"));
				m.setMemberCouponCnt(rset.getInt("coupon_cnt"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	}
	
	
	/** 아이디 중복체크 
	 * @param conn
	 * @param userId
	 * @return
	 */
	public int idCheck(Connection conn, String userId) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
				System.out.println(userId);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return count;
		
	}
	
	
	/** 아이디 찾기
	 * @param conn
	 * @param name2
	 * @param email
	 * @return
	 */
	public  Member selectid(Connection conn, String name2, String email)  {
		 
	    Member selectid = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("idfind");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name2);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
//				selectid = new Member(rset.getString("MEMBER_ID"));
				selectid = new Member();
				selectid.setMemberId(rset.getString("MEMBER_ID"));
				selectid.setMemberEnrolldate(rset.getDate("MEMBER_ENROLLDATE"));
				selectid.setMemberName(rset.getString("MEMBER_NAME"));
					
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally  {
			close(rset);
			close(pstmt);
		}
		
		return selectid;
		
	}
	
	
	
	
	/** 비밀번호 찾기
	 * @param conn
	 * @param memberId
	 * @param email
	 * @return
	 */
	public  Member selectpwd(Connection conn, String memberId, String email)  {
		 
	    Member selectpwd = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("pwdfind");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
//				selectid = new Member(rset.getString("MEMBER_ID"));
				selectpwd = new Member();
				selectpwd.setMemberId(rset.getString("MEMBER_ID"));
				selectpwd.setMemberPwd(rset.getString("MEMBER_PWD"));
				selectpwd.setMemberEnrolldate(rset.getDate("MEMBER_ENROLLDATE"));
				selectpwd.setMemberName(rset.getString("MEMBER_NAME"));
				
					
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally  {
			close(rset);
			close(pstmt);
		}
		
		return selectpwd;
		
	}
	
	
	
	
	
}

