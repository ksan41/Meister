package com.meister.branch.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.meister.branch.model.vo.Branch;
import com.meister.member.model.vo.Manager;
import static com.meister.common.JDBCTemplate.*;

public class BranchDao {
	private Properties prop = new Properties();

	public BranchDao() {
		String filePath = BranchDao.class.getResource("/sql/branch/branchQuery.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**산
	 * 통합관리자- 관리자 등록용 dao
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertManager(Connection conn,Manager m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertManager");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getManagerId());
			pstmt.setString(2, m.getManagerType());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**산
	 * 통합관리자- 지점 등록용 dao
	 * @param conn
	 * @param br
	 * @return
	 */
	public int insertBranch(Connection conn,Branch br) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBranch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, br.getBranchName());
			pstmt.setString(2, br.getOpenTime());
			pstmt.setString(3, br.getCloseTime());
			pstmt.setDate(4, br.getOpeningDate());
			pstmt.setString(5, br.getAddress());
			pstmt.setString(6, br.getPhone());
			pstmt.setString(7, br.getBranchImg());
			pstmt.setString(8, br.getLatitude());
			pstmt.setString(9, br.getLongtitude());
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
