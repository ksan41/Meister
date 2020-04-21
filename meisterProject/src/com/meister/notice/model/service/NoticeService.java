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
	
	/**
	 * 2. 공지사항 상세조회용 서비스
	 * @param nno	--> 조회하고자하는 공지사항 글번호
	 * @return		--> 글번호와 일치하는 Notice 객체
	 */
	public Notice selectNotice(int nno) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, nno);
		
		close(conn);
		
		return n;
		
	}
	
	/**
	 * 3. 조회수 증가용 서비스
	 * @param nno	--> 상세조회된 공지사항 글 번호
	 */
	public void increaseCount(int nno) {
		
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
	}
	
	/**
	 * 4. 이전글 서비스
	 * @param nno	--> 조회된 공지사항 글번호
	 * @return		--> 조회된 공지사항 이전글 Notice 객체
	 */
	public Notice prevNotice(int nno) {
		
		Connection conn = getConnection();
		Notice prevN = new NoticeDao().prevNotice(conn, nno);
		close(conn);
		return prevN;
		
	}
	
	/**
	 * 5. 지점 공지사항 리스트 조회용 서비스
	 * @return
	 */
	public ArrayList<Notice> selectBmList(){
		
	}
	
	

}
