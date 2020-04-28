package com.meister.branch.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	
	/**산
	 * 통합관리자-지점리스트 조회용 서비스
	 * @return : 조회된 Branch객체가 담긴 ArrayList
	 */
	public ArrayList<Branch> selectBranchList(){
		
		Connection conn = getConnection();
		ArrayList<Branch> bList = new BranchDao().selectBranchList(conn);
		
		close(conn);
		
		return bList;
	}
	
	
	/**산
	 * 통합관리자-지점관리자 조회용 서비스
	 * @return : 조회된 Manager객체가 담긴 ArrayList
	 */
	public ArrayList<Manager> selectManagerList(){
		
		Connection conn = getConnection();
		ArrayList<Manager> mList = new BranchDao().selectManagerList(conn);
		
		close(conn);
		
		return mList;
	}
}
