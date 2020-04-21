package com.meister.event.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.meister.event.model.vo.Event;

public class EventDao {
	
	/**태경
	 * 이벤트리스트 조회용 dao
	 * @param conn : EventService에서 생성한 Connection객체
	 * @return : 조회된 Event객체들이 담긴 ArrayList
	 */
	public ArrayList<Event> selectList(Connection conn){
		
		ArrayList<Event> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		
	}
}
