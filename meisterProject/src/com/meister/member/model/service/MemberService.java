package com.meister.member.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.member.model.dao.MemberDao;
import com.meister.member.model.vo.Manager;
import com.meister.member.model.vo.Member;

/**
 * @author Nacho
 *
 */
/**
 * @author Nacho
 *
 */
public class MemberService {
	
	/** 로그인 폼 
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return loginUser;
		
		
	}
	
	
	   // 회원가입
       public int insertMember(Member m) {
		
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result > 0) {
			
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
       
       /** 권산
        * #관리자 로그인용 서비스
     * @param managerId : 관리자 로그인페이지에서 사용자가 입력한 아이디
     * @param password : 관리자 로그인페이지에서 사용자가 입력한 비밀번호
     * @return : 입력한 아이디,비밀번호로 조회해온 Manager객체
     */
    public Manager loginManager(String managerId,String password) {
    	   
		Connection conn = getConnection();
		
		Manager loginManager = new MemberDao().loginManager(conn,managerId,password); 
	   
		close(conn);
		
		return loginManager;
	}
    
    /** 연화
     * 관리자-회원조회용 서비스
     * @return
     */
    public ArrayList<Member> selectMemberList(){
    	
		Connection conn = getConnection();
		
		Member selectMemberList = new MemberDao().selectMemberList(conn); 
	   
		close(conn);
		
		return selectMemberList;
    }
}