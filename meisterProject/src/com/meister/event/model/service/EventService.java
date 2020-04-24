package com.meister.event.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.event.model.dao.EventDao;
import com.meister.event.model.vo.Event;
import com.meister.notice.model.dao.NoticeDao;
import com.meister.notice.model.vo.Notice;
import com.sun.xml.internal.ws.api.message.Attachment;

public class EventService {

	/**
	 * 태경 #이벤트리스트 조회용 서비스
	 * 
	 * @return : 조회해온 이벤트객체들이 담긴 ArrayList
	 */
	public ArrayList<Event> selectList() {

		Connection conn = getConnection();

		ArrayList<Event> list = new EventDao().selectList(conn);

		close(conn);

		return list;
	}

	/**
	 * 태경 이벤트 상세 페이지
	 * 
	 * @return
	 */
	public Event selectAtList(int bno) {
		Connection conn = getConnection();
		Event at = new EventDao().selectAtList(conn, bno);

		close(conn);
		return at;

	}
	
	/**연화
	 * 이벤트 작성용 서비스
	 * @param ev		--> 제목, 내용이 담겨있는 Event객체
	 * @return		--> 처리된 행의 개수
	 */
	public int insertEvent(Event ev) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().insertEvent(conn, ev);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
