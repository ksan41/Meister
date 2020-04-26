package com.meister.order.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Price;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	/**
	 * @author 곽진아
	 */
	public OrderDao() {
		String filePath = OrderDao.class.getResource("/sql/order/orderQuery.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 곽진아
	 * @param d : Delivery vo 객체
	 * @return result : 성공여부 값
	 */
	public int insertAddress(Connection conn, Delivery d) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getNewAddress1());
			pstmt.setString(2, d.getNewAddress2());
			pstmt.setString(3, d.getNewPoCode());
			pstmt.setString(4, d.getDeliveryName());
			pstmt.setInt(5, d.getBranchNo());
			pstmt.setInt(6,  d.getMemberNo());
			pstmt.setString(7, d.getReferenceAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 * @return
	 */
	public ArrayList<Delivery> ShowOrderDeliveryList(Connection conn, String userId) {
		ArrayList<Delivery> deliveryList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeliveryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				deliveryList.add(new Delivery(rset.getInt("MEMBER_NO"),
												rset.getString("DELIVERY_NAME"),
												rset.getString("MEM_ADDRESS1"),
												rset.getString("MEM_ADDRESS2"),
												rset.getString("BRANCH_NAME"),
												rset.getString("BRANCH_PHONE")));
				System.out.println("지점1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println("다오딴 : " + deliveryList.get(0));
		return deliveryList;
	}
	
	public Price ShowBasketList(Connection conn, int userNo){
		Price basket = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBasketList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				basket = new Price(rset.getInt("ORDER_NO"),
												rset.getString("PIZZA_SIZE"),
												rset.getString("PIZZA_NO"),
												rset.getString("PIZZA_COUNT"),
												rset.getString("DOUGH_NO"),
												rset.getString("SIDE_NO"),
												rset.getString("SIDE_COUNT"),
												rset.getString("ETC_NO"),
												rset.getString("ETC_COUNT"),
												rset.getInt("CART_NO"));
				System.out.println("지점1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println("다오딴 : " + deliveryList.get(0));
		return basket;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 * @return
	 */
	public String getMemberNo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String memberNo = "";
		
		String sql = prop.getProperty("selectMemberNo");
		System.out.println("지점 5 에서 userId : " + userId);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getString("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberNo;
	}
	
	/*public int deleteAddress(Connection conn, int index) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getNewAddress1());
			pstmt.setString(2, d.getNewAddress2());
			pstmt.setString(3, d.getNewPoCode());
			pstmt.setString(4, d.getDeliveryName());
			pstmt.setInt(5, d.getBranchNo());
			pstmt.setInt(6,  d.getMemberNo());
			pstmt.setString(7, d.getReferenceAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	///////////////////지수/////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
///////////////////지수/////////////////////////



/////////////////////진아//////////////////////////////////
































































































































































///////////////////진아//////////////////////////////////





/////////////////태경/////////////////////////////////////////




















































































































































////////////////////////////태경//////////////////////////////////////////////////////////////
}
