package com.meister.branch.model.service;

import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.meister.branch.model.dao.BranchDao;
import com.meister.branch.model.vo.Branch;
import com.meister.member.model.vo.Manager;

public class BranchService {

	
	/**산
	 * 통합관리자-지점등록용 서비스 
	 * @param br : 등록할 지점정보가 담긴 Branch객체
	 * @param m : 등록할 지점관리자 정보가 담긴 Manager객체
	 * @return : 처리된 행의 개수
	 */
	public int insertBranch(Branch br, Manager m) {
		
		Connection conn = getConnection();
		
		//매니저 등록요청
		int resultM = new BranchDao().insertManager(conn,m);
		
		//지점 등록요청
		int resultB = new BranchDao().insertBranch(conn,br);
		
		if(resultM>0 && resultB>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return resultM*resultB;
	}
}
