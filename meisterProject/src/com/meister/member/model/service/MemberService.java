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
    
    /** 연화->산
     * 통합관리자-회원관리/회원정보 조회용 서비스
     * @return : 조회된 Member객체가 담긴 ArrayList
     */
    public ArrayList<Member> selectMemberList(){
    	
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn); 
	   
		close(conn);
		
		return list;
    }
    
    
    /** 지수
     * 회원 탈퇴용 서비스
     * @param m	: 탈퇴할 회원의 회원 번호와 탈퇴 타입, 탈퇴 사유가 담겨있는 Member객체
     * @return	: 처리된 행의 갯수
     */
    public int deleteMember(Member m) {
    	
    	Connection conn = getConnection();
    	
    	int result = new MemberDao().deleteMember(conn, m);
    	
    	if(result > 0) {
    		commit(conn);
    	}else {
    		rollback(conn);
    	}
    	
    	close(conn);
    	
    	return result;
    }
    
    
    
    /**산
     * 통합관리자- 회원탈퇴용 서비스
     * @param memberNo : 탈퇴처리할 회원번호
     * @return : 처리된 행의 갯수
     */
    public int deleteMgMember(int memberNo) {
    	
    	Connection conn = getConnection();
    	
    	int result = new MemberDao().deleteMgMember(conn,memberNo);
    	
    	if(result>0) {
    		commit(conn);
    	}else {
    		rollback(conn);
    	}
    	
    	close(conn);
    	
    	return result;
    }
    
    
    /**산
     * 통합관리자- 탈퇴회원 리스트 조회용 서비스
     * @return : 조회된 Member객체가 담긴ArrayList
     */
    public ArrayList<Member> selectDropMemList(){
    	
    	
    	Connection conn = getConnection();
    	
    	ArrayList<Member> list = new MemberDao().selectDropMemList(conn);
    	
    	close(conn);
    	
    	return list;
    }
    
    
    /**산
     * 통합관리자- 회원리스트 이름별 검색용 서비스
     * @param name : 조회할 이름(키워드)
     * @return : 조회된 Member객체가 담긴 ArrayList
     */
    public ArrayList<Member> searchName(String name){
    	
    	Connection conn = getConnection();
    	
    	ArrayList<Member> list = new MemberDao().searchName(conn,name);
    	
    	close(conn);
    	return list;
    }
}