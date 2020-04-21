package com.meister.order.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;

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
	

}
