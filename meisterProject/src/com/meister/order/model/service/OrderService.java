package com.meister.order.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.order.model.dao.OrderDao;
import com.meister.order.model.vo.Delivery;

public class OrderService {
	
	/**
	 * @author 곽진아
	 * @param b Delivery vo 객체
	 */
	public int insertAddress(Delivery b) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().insertAddress(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 */
	public ArrayList<Delivery> ShowOrderDeliveryList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Delivery> deliveryList = new OrderDao().ShowOrderDeliveryList(conn, userId);
		
		close(conn);
		//System.out.println("서비스딴 : " + deliveryList.get(0));
		return deliveryList;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 */
	public String getMemberNo(String userId) {
		Connection conn = getConnection();
		userId = new OrderDao().getMemberNo(conn, userId);
		close(conn);
		return userId;
	}
	
	public int deleteAddress(int index) {
		Connection conn = getConnection();
		int result = new OrderDao().deleteAddress(conn, index);
		close(conn);
		return result; 
	}

}
