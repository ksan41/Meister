package com.meister.center.model.dao;

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
import com.meister.center.model.vo.Faq;
import com.meister.notice.model.vo.Notice;

import static com.meister.common.JDBCTemplate.*;


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

	public ArrayList<String> selectStores(Connection conn) {

		ArrayList<String> storeList = new ArrayList<>();

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectStores");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			while (rset.next()) {
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

	
	
	public ArrayList<Faq> selectList(Connection conn) {

		ArrayList<Faq> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {

			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while (rset.next()) {

				list.add(new Faq(rset.getInt("FAQ_NO"), rset.getString("FAQ_TYPE"), rset.getString("FAQ_QUESTION"),
						rset.getString("FAQ_ANSWER")));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;

	}
	
	
	
	public int insertFaq(Connection conn, Faq f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqType());
			pstmt.setString(2, f.getFaqQuestion());
			pstmt.setString(3, f.getFaqAnswer());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateFaq(Connection conn, Faq f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqType());
			pstmt.setString(2, f.getFaqQuestion());
			pstmt.setString(3, f.getFaqAnswer());
			pstmt.setInt(4, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int deleteFaq(Connection conn, int faqNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Center> selectOneList(Connection conn){
		
		ArrayList<Center> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
			
				list.add(new Center(rset.getInt("INQUIRY_NO"),
									rset.getString("INQUIRY_TITLE"),
									rset.getString("INQUIRY_CONTENT"),
									rset.getString("INQUIRY_ANSWER"),
									rset.getDate("REGISTRATION_DATE"),
									rset.getDate("MODIFY_DATE"),
									rset.getInt("INQUIRY_TYPE"),
									rset.getString("INQUIRY_STORE"),
									rset.getString("INQUIRY_PRO_STATUS"),
									rset.getString("MEMBER_ID"),
									rset.getInt("RECEIPT_NO")));
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
	
	public Center selectOne(Connection conn, int cno) {
		
		Center c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Center(rset.getInt("INQUIRY_NO"),
							   rset.getString("INQUIRY_TITLE"),
							   rset.getString("INQUIRY_CONTENT"),
							   rset.getString("INQUIRY_ANSWER"),
							   rset.getDate("REGISTRATION_DATE"),
							   rset.getDate("MODIFY_DATE"),
							   rset.getInt("INQUIRY_TYPE"),
							   rset.getString("INQUIRY_STORE"),
							   rset.getString("INQUIRY_PRO_STATUS"),
							   rset.getInt("RECEIPT_NO"),
							   rset.getString("MEMBER_ID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}

	
	public int updateInquiryAnswer(Connection conn, Center c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInquiryAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getInquiryAnswer());
			pstmt.setInt(2, c.getInquiryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}