package com.meister.myPage.model.dao;

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
import com.meister.common.PageInfo;
import com.meister.coupon.model.vo.Coupon;
import com.meister.member.model.vo.Member;
import com.meister.menu.model.vo.Pizza;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Price;

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
				
				list.add(new Coupon(rset.getInt("COUPON_NO"),
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
	
	
	public int deleteCenter(Connection conn, int cno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCenter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int updateCenter(Connection conn, Center c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCenter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getInquiryTitle());
			pstmt.setString(2, c.getInquiryContent());
			pstmt.setInt(3, c.getInquiryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int updateCenterImage(Connection conn, CenterImage ci) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCenterImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ci.getOriginName());
			pstmt.setString(2, ci.getChangeName());
			pstmt.setString(3, ci.getFilePath());
			pstmt.setInt(4, ci.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertCenterImage(Connection conn, CenterImage ci) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCenterImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ci.getOriginName());
			pstmt.setString(2, ci.getChangeName());
			pstmt.setString(3, ci.getFilePath());
			pstmt.setInt(4, ci.getInqueryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public String updateCheckPwd(Connection conn, String memberId) {
		
		String memberPwd = "";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateCheckPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberPwd = rset.getString("MEMBER_PWD");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberPwd;
	}
	
	
	public int updatePwd(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setInt(2, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, m.getMemberBirth());
			pstmt.setString(2, m.getMemberPhone());
			pstmt.setString(3, m.getMemberEmail());
			pstmt.setInt(4, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int getOrderListCount(Connection conn, int memberNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getOrderListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	public ArrayList<Pizza> selectPizzaList(Connection conn) {
		
		ArrayList<Pizza> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPizzaList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Pizza p = new Pizza();
				p.setPizzaNo(rset.getInt("PIZZA_NO"));
				p.setPizzaName(rset.getString("PIZZA_NAME"));
				
				list.add(p);
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
	
	
	public ArrayList<Orders> selectOrdersList(Connection conn, PageInfo pi, int memberNo){
		
		ArrayList<Orders> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrdersList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Orders o = new Orders();
				o.setReceiptNo(rset.getInt("RECEIPT_NO"));
				o.setDeliveryStatus(rset.getString("DELIVERY_STATUS"));
				o.setOrderNo(rset.getInt("ORDER_NO"));
				
				list.add(o);
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
	
	
	public ArrayList<Price> selectPriceList(Connection conn, PageInfo pi, int memberNo) {
		
		ArrayList<Price> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPriceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Price p = new Price();
				p.setOrderNo(rset.getInt("ORDER_NO"));
				p.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				p.setPizzaNo(rset.getString("PIZZA_NO"));
				p.setPizzaCount(rset.getString("PIZZA_COUNT"));
				p.setSideCount(rset.getString("SIDE_COUNT"));
				p.setEtcCount(rset.getString("ETC_COUNT"));
				
				list.add(p);
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
	
	

}
