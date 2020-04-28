package com.meister.notice.model.dao;

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

import com.meister.common.PageInfo;
import com.meister.member.model.vo.Member;
import com.meister.notice.model.vo.Notice;

public class NoticeDao {
	
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String filePath = NoticeDao.class.getResource("/sql/notice/noticeQuery.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
		
	public ArrayList<Notice> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getDate("NOTICE_CREATE_DATE"),
									rset.getInt("NOTICE_COUNT")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Notice selectNotice(Connection conn, int nno) {
		
		Notice n = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("NOTICE_NO"),
								rset.getString("NOTICE_TITLE"),
								rset.getString("NOTICE_CONTENT"),
								rset.getDate("NOTICE_CREATE_DATE"),
								rset.getInt("NOTICE_COUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
		
	}
	
	public int increaseCount(Connection conn, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Notice prevNotice(Connection conn, int nno){
		
		Notice prevN = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("previousNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				prevN = new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return prevN;
	}
	
	public ArrayList<Notice> selectBmList(Connection conn){
		
		ArrayList<Notice> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBmList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
			
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getDate("NOTICE_CREATE_DATE"),
									rset.getDate("NOTICE_MODIFY_DATE"),
									rset.getInt("NOTICE_COUNT")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	public ArrayList<Notice> selectMgList(Connection conn){
		
		ArrayList<Notice> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMgList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
			
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getDate("NOTICE_CREATE_DATE"),
									rset.getDate("NOTICE_MODIFY_DATE"),
									rset.getInt("NOTICE_COUNT")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}
	
	public int insertNotice(Connection conn, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMnotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	public int insertBnotice(Connection conn, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBnotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public int deleteNotice(Connection conn, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int getListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
		
	}
	
	
	public ArrayList<Notice> searchTitle(Connection conn, String keyword, PageInfo pi){
		
		ArrayList<Notice> list = new ArrayList<>();
    	PreparedStatement pstmt = null;
    	ResultSet rset = null;
    	
    	String sql = prop.getProperty("searchNoticeTitle");
    	
    	try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setCreateDate(rset.getDate("NOTICE_CREATE_DATE"));
				n.setCount(rset.getInt("NOTICE_COUNT"));
				
				list.add(n);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
    	return list;
		
		
	}
	
	public ArrayList<Notice> searchContent(Connection conn, String keyword, PageInfo pi){
		
		ArrayList<Notice> list = new ArrayList<>();
    	PreparedStatement pstmt = null;
    	ResultSet rset = null;
    	
    	String sql = prop.getProperty("searchNoticeContent");
    	
    	try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setCreateDate(rset.getDate("NOTICE_CREATE_DATE"));
				n.setCount(rset.getInt("NOTICE_COUNT"));
				
				list.add(n);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
    	return list;
		
		
	}
	
	public ArrayList<Notice> searchTitleContent(Connection conn, String keyword, PageInfo pi){
		
		ArrayList<Notice> list = new ArrayList<>();
    	PreparedStatement pstmt = null;
    	ResultSet rset = null;
    	
    	String sql = prop.getProperty("searchTitleContent");
    	
    	try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setCreateDate(rset.getDate("NOTICE_CREATE_DATE"));
				n.setCount(rset.getInt("NOTICE_COUNT"));
				
				list.add(n);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
    	return list;
		
	}
	
	public int getSearchListCount(Connection conn, String keyword) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		String sql = prop.getProperty("getSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	
	
	
	

}
