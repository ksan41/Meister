package com.meister.event.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.event.model.vo.Event;
import com.meister.member.model.dao.MemberDao;

public class EventDao {
	
	
	private Properties prop = new Properties();
	
	
	public EventDao() {
		
    String filePath = MemberDao.class.getResource("/sql/event/eventQuery.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
		
		
	
	
	/**태경
	 * 이벤트리스트 조회용 dao
	 * @param conn : EventService에서 생성한 Connection객체
	 * @return : 조회된 Event객체들이 담긴 ArrayList
	 */
	 
	    public ArrayList<Event> selectList(Connection conn){
		
		
		
		ArrayList<Event> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Event e = new Event(rset.getInt("EVENT_NO"),
						            rset.getString("EVENT_TITLE"),
						            rset.getDate("EVENT_OPEN_TIME"),
						            rset.getDate("EVENT_CLOSE_TIME"),
						            rset.getString("EVENT_IMAGE1"),
						            rset.getString("EVENT_IMAGE2"),
						            rset.getDate("EVENT_REGISTER_DATE"),
						            rset.getDate("EVENT_MODIFY_DATE"),
						            rset.getString("EVENT_STATUS"));	
				list.add(e);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
		
		
		
		
		
		
		
	}
}
