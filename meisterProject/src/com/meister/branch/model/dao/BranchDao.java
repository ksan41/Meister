package com.meister.branch.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.branch.model.vo.Branch;
import com.meister.member.model.vo.Manager;

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
	
	
	
	/**산
	 * 통합관리자- 지점리스트 조회용 dao
	 * @param conn : BranchService에서 생성된 Connection객체
	 * @return : 조회된 Branch객체가 담긴 ArrayList
	 */
	public ArrayList<Branch> selectBranchList(Connection conn){
		
		ArrayList<Branch> bList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBranchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Branch b = new Branch();
				b.setBranchNo(rset.getInt("BRANCH_NO"));
				b.setBranchName(rset.getString("BRANCH_NAME"));
				b.setOpenTime(rset.getString("OPEN_TIME"));
				b.setCloseTime(rset.getString("CLOSE_TIME"));
				b.setOpeningDate(rset.getDate("OPENING_DATE"));
				b.setAddress(rset.getString("BRANCH_ADDRESS"));
				b.setPhone(rset.getString("BRANCH_PHONE"));
				b.setBranchImg(rset.getString("BRANCH_IMAGE"));
				b.setManagerNo(rset.getInt("MANAGER_NO"));
				b.setLatitude(rset.getString("LATITUDE"));
				b.setLongtitude(rset.getString("LONGITUDE"));
				
				bList.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return bList;
	}
	
	
	
	/**산
	 * 통합관리자 - 지점관리자 조회용 dao
	 * @param conn : BranchService에서 생성된 Connection객체
	 * @return : 조회된 Manager객체가 담긴 ArrayList
	 */
	public ArrayList<Manager> selectManagerList(Connection conn){
		
		ArrayList<Manager> mList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectManagerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Manager m = new Manager();
				
				m.setManagerNo(rset.getInt("MANAGER_NO"));
				m.setManagerId(rset.getString("MANAGER_ID"));
				m.setName(rset.getString("MANAGER_NAME"));
				m.setPhone(rset.getString("MANAGER_PHONE"));
				
				mList.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return mList;
	}
}
