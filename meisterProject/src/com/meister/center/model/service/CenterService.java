package com.meister.center.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import com.meister.center.model.dao.CenterDao;
import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
import com.meister.center.model.vo.Faq;

import static com.meister.common.JDBCTemplate.*;

public class CenterService {

	
	/** 지수
	 * 1. 1:1문의 작성용 서비스
	 * @param c		--> CENTER 테이블에 insert할 데이터가 담겨있는 객체
	 * @param ci	--> CENTER_IMAGE 테이블에 insert할 데이터가 담겨있는 객체 (단, 첨부파일이 있을경우)
	 * @return		--> 처리된 행의 갯수
	 */
	public int insertInquiry(Center c, CenterImage ci) {

		Connection conn = getConnection();
		
		int result1 = new CenterDao().insertInquiry(conn, c);
		int result2 = 1;
		
		if(ci != null) {
			result2 = new CenterDao().insertInquiryImage(conn, ci);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
	}
	
	
	
	
	
	/** 태경 
	 *  FAQ 리스트 조회
	 * @return --> Center 테이블로 부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Faq> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new CenterDao().selectList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public 
	

	/** 지수
	 * 2. 지점명 조회용 서비스
	 * @return	--> 현재 영업중인 지점명들이 담긴 ArrayList<String>객체
	 */
	public ArrayList<String> selectStores(){
		
		Connection conn = getConnection();
		
		ArrayList<String> storeList = new CenterDao().selectStores(conn);
		
		close(conn);
		
		return storeList;
	}
	
	
	
}