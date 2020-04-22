package com.meister.event.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.event.model.dao.EventDao;
import com.meister.event.model.vo.Event;
import com.sun.xml.internal.ws.api.message.Attachment;

public class EventService {
	
	/**태경
	 * #이벤트리스트 조회용 서비스
	 * @return : 조회해온 이벤트객체들이 담긴 ArrayList
	 */
	public ArrayList<Event> selectList(){
		
		Connection conn = getConnection();
		
		ArrayList<Event> list = new EventDao().selectList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	
	/** 태경
	 * 이벤트 상세 페이지
	 * @return
	 */
	public Event selectAtList(int bno) {
		Connection conn = getConnection();
		Event at = new EventDao().selectAtList(conn, bno);
		
		close(conn);
		return at;
		
		
	}
	


}
