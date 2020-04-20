package com.meister.member.model.service;

import com.meister.member.model.dao.MemberDao;
import com.meister.member.model.vo.Member;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;

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
	

}
