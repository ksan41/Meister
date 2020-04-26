package com.meister.order.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.order.model.dao.OrderDao;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Price;

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
	 * @param userNo 회원번호
	 */
	public Price ShowBasketList(int userNo){
		Connection conn = getConnection();
		
		Price basket = new OrderDao().ShowBasketList(conn, userNo);
		
		close(conn);
		//System.out.println("서비스딴 : " + deliveryList.get(0));
		return basket;
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
	
	/*public int deleteAddress(int index) {
		Connection conn = getConnection();
		int result = new OrderDao().deleteAddress(conn, index);
		close(conn);
		return result; 
	}*/
	
	
	
	
	///////////////////지수/////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
///////////////////지수/////////////////////////
	
	
	
	/////////////////////진아//////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
///////////////////진아//////////////////////////////////
	
	
	
	
	
	/////////////////태경/////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////태경//////////////////////////////////////////////////////////////
}
