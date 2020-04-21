package com.meister.order.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.order.model.dao.OrderDao;
import com.meister.order.model.vo.Delivery;

public class OrderService {
	
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
	
	public ArrayList<Delivery> ShowOrderDeliveryList(String memberId) {
		Connection conn = getConnection();
		
		ArrayList<Delivery> deliveryList = new OrderDao().ShowOrderDeliveryList(conn, memberId);
		
		close(conn);
		
		return deliveryList;
	}

}
