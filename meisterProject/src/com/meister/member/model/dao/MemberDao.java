package com.meister.member.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
	
	/**연화
	 * @param conn
	 * @return
	 */
	public ArrayList<Member> selectMemberList(Connection conn) {
		
		ArrayList<Member> selectMemberList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				selectMemberList.add(new Member(rset.getInt("MEMBER_NO"),
												rset.getString("MEMBER_ID"),
												rset.getString("MEMBER_NAME"),
												rset.getDate("MEMBER_ENROLLDATE"),
												))
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}