package com.meister.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;			// 공지사항번호(PK)
	private String noticeTitle;		// 글제목
	private String noticeContent;	// 글내용
	private Date createDate;		// 작성일
	private Date modifiyDate;		// 수정일
	private int noticeType;			// 1 -> 고객 , 2 -> 지점
	private int count;				// 조회수
	private String noticeStatus;	// 상태값(공개여부)
	
	
	public Notice() {
		
	}
	
	
	

	/**
	 * 1. 공지사항 리스트용
	 * @param noticeNo
	 * @param noticeTitle
	 * @param createDate
	 * @param count
	 */
	public Notice(int noticeNo, String noticeTitle, Date createDate, int count) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
		this.count = count;
	}




	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, Date modifiyDate,
			int noticeType, int count, String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.modifiyDate = modifiyDate;
		this.noticeType = noticeType;
		this.count = count;
		this.noticeStatus = noticeStatus;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getModifiyDate() {
		return modifiyDate;
	}


	public void setModifiyDate(Date modifiyDate) {
		this.modifiyDate = modifiyDate;
	}


	public int getNoticeType() {
		return noticeType;
	}


	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getNoticeStatus() {
		return noticeStatus;
	}


	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", createDate=" + createDate + ", modifiyDate=" + modifiyDate + ", noticeType=" + noticeType
				+ ", count=" + count + ", noticeStatus=" + noticeStatus + "]";
	}
	
	
	
	
	
}


