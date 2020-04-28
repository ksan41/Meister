package com.meister.event.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.center.model.dao.CenterDao;
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

	/**태경
	 * 이벤트 상세 페이지
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
	
	/**연화
	 * 이벤트 수정용 서비스
	 * @param e		--> 수정하고자하는 글 번호, 수정할 제목, 수정할 내용이 담겨있는 Event객체
	 * @return		--> 처리된 행의 개수
	 */
	public int updateEvent(Event e) {
		
		Connection conn = getConnection();
		int result = new EventDao().updateEvent(conn, e);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**연화
	 * faq 삭제용 서비스
	 * @param faqNo		--> 삭제요청한 faq 글 번호
	 * @return			--> 처리된 행의 개수
	 */
	public int deleteEvent(int bno) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().deleteEvent(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
