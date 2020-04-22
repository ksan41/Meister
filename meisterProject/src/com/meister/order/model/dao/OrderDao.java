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
			pstmt.setInt(1, d.getDeliveryNo());
			pstmt.setString(2, d.getNewAddress1());
			pstmt.setString(3, d.getNewAddress2());
			pstmt.setString(4, d.getNewPoCode());
			pstmt.setString(5, d.getAddressStatus());
			pstmt.setString(6, d.getDeliveryName());
			pstmt.setInt(7, d.getBranchNo());
			pstmt.setInt(8,  d.getMemberNo());
			pstmt.setString(9, d.getReferenceAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Delivery> ShowOrderDeliveryList(Connection conn, String userId) {
		ArrayList<Delivery> deliveryList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeliveryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			System.out.println("다오 딴에서 userId = " + userId);
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
		System.out.println("다오딴 : " + deliveryList.get(0));
		return deliveryList;
		
	}
}
