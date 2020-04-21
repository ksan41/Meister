package com.meister.myPage.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
import com.meister.coupon.model.vo.Coupon;

public class MyPageDao {
	
	private Properties prop = new Properties();
	
	public MyPageDao() {
		String filePath = MyPageDao.class.getResource("/sql/myPage/myPageQuery.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Coupon> selectCouponList(Connection conn, int memberNo){
		
		ArrayList<Coupon> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCouponList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Coupon(rset.getInt("COUPIN_NO"),
								    rset.getString("COUPON_NAME"),
								    rset.getDate("COUPON_START"),
								    rset.getDate("COUPON_END")));
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
	
	
	public ArrayList<Center> selectCenterList(Connection conn, int memberNo){
		
		ArrayList<Center> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCenterList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Center(rset.getInt("INQUIRY_NO"),
									rset.getString("INQUIRY_TITLE"),
									rset.getDate("REGISTRATION_DATE"),
									rset.getString("INQUIRY_PRO_STATUS")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public Center selectCenter(Connection conn, int cno) {
		
		Center c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCenter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Center();
				c.setInquiryNo(rset.getInt("INQUIRY_NO"));
				c.setInquiryTitle(rset.getString("INQUIRY_TITLE"));
				c.setInquiryContent(rset.getString("INQUIRY_CONTENT"));
				c.setInquiryAnswer(rset.getString("INQUIRY_ANSWER"));
				c.setInquiryType(rset.getInt("INQUIRY_TYPE"));
				c.setInquiryStore(rset.getString("INQUIRY_STORE"));
				c.setMemberNo(rset.getInt("MEMBER_NO"));
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
	
	
	public CenterImage selectCenterImage(Connection conn, int cno) {
		
		CenterImage ci = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCenterImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ci = new CenterImage();
				ci.setFileNo(rset.getInt("FILE_NO"));
				ci.setOriginName(rset.getString("FILE_ORIGIN_NAME"));
				ci.setChangeName(rset.getString("CHANGE_NAME"));
				ci.setFilePath(rset.getString("FILE_PATH"));
				ci.setInqueryNo(rset.getInt("INQUIRY_NO"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ci;
	}

}
