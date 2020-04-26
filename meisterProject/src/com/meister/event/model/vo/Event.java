package com.meister.event.model.vo;

import java.sql.Date;

public class Event {
	
	private int eventNo; 				// 이벤트 번호
	private String eventTitle; 			// 제목
	private Date eventOpenTime; 		// 시작일
	private Date eventCloseTime; 		// 종료일
	private String eventImage1;			// 썸네일 이미지
	private String eventImage2;		// 상세 이미지
	private Date eventRegisterDate;	// 등록일
	private Date eventModifyDate;		// 수정일 
	private String eventStatus;		// 노출여부
	
	public Event() {
		
	}

	public Event(int eventNo, String eventTitle, Date eventOpenTime, Date eventCloseTime, String eventImage1,
			String eventImage2, Date eventRegisterDate, Date eventModifyDate, String eventStatus) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventOpenTime = eventOpenTime;
		this.eventCloseTime = eventCloseTime;
		this.eventImage1 = eventImage1;
		this.eventImage2 = eventImage2;
		this.eventRegisterDate = eventRegisterDate;
		this.eventModifyDate = eventModifyDate;
		this.eventStatus = eventStatus;
	}
	
	

	public Event(int eventNo, String eventTitle, Date eventOpenTime, Date eventCloseTime, String eventImage1,
			String eventImage2, Date eventRegisterDate, Date eventModifyDate) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventOpenTime = eventOpenTime;
		this.eventCloseTime = eventCloseTime;
		this.eventImage1 = eventImage1;
		this.eventImage2 = eventImage2;
		this.eventRegisterDate = eventRegisterDate;
		this.eventModifyDate = eventModifyDate;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Date getEventOpenTime() {
		return eventOpenTime;
	}

	public void setEventOpenTime(Date eventOpenTime) {
		this.eventOpenTime = eventOpenTime;
	}

	public Date getEventCloseTime() {
		return eventCloseTime;
	}

	public void setEventCloseTime(Date eventCloseTime) {
		this.eventCloseTime = eventCloseTime;
	}

	public String getEventImage1() {
		return eventImage1;
	}

	public void setEventImage1(String eventImage1) {
		this.eventImage1 = eventImage1;
	}

	public String getEventImage2() {
		return eventImage2;
	}

	public void setEventImage2(String eventImage2) {
		this.eventImage2 = eventImage2;
	}

	public Date getEventRegisterDate() {
		return eventRegisterDate;
	}

	public void setEventRegisterDate(Date eventRegisterDate) {
		this.eventRegisterDate = eventRegisterDate;
	}

	public Date getEventModifyDate() {
		return eventModifyDate;
	}

	public void setEventModifyDate(Date eventModifyDate) {
		this.eventModifyDate = eventModifyDate;
	}

	public String getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventOpenTime=" + eventOpenTime
				+ ", eventCloseTime=" + eventCloseTime + ", eventImage1=" + eventImage1 + ", eventImage2=" + eventImage2
				+ ", eventRegisterDate=" + eventRegisterDate + ", eventModifyDate=" + eventModifyDate + ", eventStatus="
				+ eventStatus + "]";
	}
	
	

}