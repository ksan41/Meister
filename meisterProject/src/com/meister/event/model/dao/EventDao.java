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
import com.meister.notice.model.vo.Notice;
import com.sun.xml.internal.ws.api.message.Attachment;

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

	/**
	 * 태경 이벤트리스트 조회용 dao
	 * 
	 * @param conn : EventService에서 생성한 Connection객체
	 * @return : 조회된 Event객체들이 담긴 ArrayList
	 */
	public ArrayList<Event> selectList(Connection conn) {

		ArrayList<Event> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
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
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	/**
	 * @param conn
	 * @param bno
	 * @return
	 */
	public Event selectAtList(Connection conn, int bno) {

		Event at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();

			if (rset.next()) {at = new Event(rset.getInt("EVENT_NO"),
											 rset.getString("EVENT_TITLE"),
											 rset.getDate("EVENT_OPEN_TIME"),
											 rset.getDate("EVENT_CLOSE_TIME"),
											 rset.getString("EVENT_IMAGE1"),
											 rset.getString("EVENT_IMAGE2"),
											 rset.getDate("EVENT_REGISTER_DATE"),
											 rset.getDate("EVENT_MODIFY_DATE"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	public int insertEvent(Connection conn, Event ev) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ev.getEventTitle());
			pstmt.setDate(2, ev.getEventOpenTime());
			pstmt.setDate(3, ev.getEventCloseTime());
			pstmt.setString(4, ev.getEventImage1());
			pstmt.setString(5, ev.getEventImage2());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateEvent(Connection conn, Event e) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setDate(2, e.getEventOpenTime());
			pstmt.setDate(3, e.getEventCloseTime());
			pstmt.setString(4, e.getEventImage1());
			pstmt.setString(5, e.getEventImage2());
			pstmt.setInt(6, e.getEventNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteEvent(Connection conn, int bno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}