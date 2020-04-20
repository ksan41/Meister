package com.meister.notice.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.notice.model.dao.NoticeDao;
import com.meister.notice.model.vo.Notice;

public class NoticeService {
	
	/**
	 * 1. 공지사항 리스트 조회용 서비스
	 * @return list --> Notice 테이블로 부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Notice> selectList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		
		close(conn);
		
		return list;
		
		
		
		
	}

}
