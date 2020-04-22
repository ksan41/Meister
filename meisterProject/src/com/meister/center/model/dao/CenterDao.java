package com.meister.center.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;


public class CenterDao {
	
	private Properties prop = new Properties();
	
	public CenterDao() {
		String filePath = CenterDao.class.getResource("/sql/center/centerQuery.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int insertInquiry(Connection conn, Center c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCenter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getInquiryTitle());
			pstmt.setString(2, c.getInquiryContent());
			pstmt.setInt(3, c.getInquiryType());
			pstmt.setString(4, c.getInquiryStore());
			pstmt.setInt(5, c.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertInquiryImage(Connection conn, CenterImage ci) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCenterImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ci.getOriginName());
			pstmt.setString(2, ci.getChangeName());
			pstmt.setString(3, ci.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public ArrayList<String> selectStores(Connection conn){
		
		ArrayList<String> storeList = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStores");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				storeList.add(rset.getString("BRANCH_NAME"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return storeList;
	}

}
