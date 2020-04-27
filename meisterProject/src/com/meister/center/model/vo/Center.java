package com.meister.center.model.vo;

import java.sql.Date;

public class Center {
	
	private int inquiryNo;			// 문의번호
	private String inquiryTitle;	// 문의제목
	private String inquiryContent;	// 문의내용
	private String inquiryAnswer;	// 문의답변
	private Date registDate;		// 등록일
	private Date modifyDate;		// 수정일
	private int inquiryType;		// 문의유형
	private String inquiryStore;	// 문의매장
	private String inquiryProStatus;// 처리상태
	private int memberNo;			// 회원번호
	private int receiptNo;			// 주문내역번호
	private String memberId;		//회원아이디
	
	
	public Center() {}
	
	
	







	public Center(int inquiryNo, String inquiryTitle, String inquiryContent, String inquiryAnswer, Date registDate,
			Date modifyDate, int inquiryType, String inquiryStore, String inquiryProStatus, int memberNo,
			int receiptNo) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryAnswer = inquiryAnswer;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.inquiryType = inquiryType;
		this.inquiryStore = inquiryStore;
		this.inquiryProStatus = inquiryProStatus;
		this.memberNo = memberNo;
		this.receiptNo = receiptNo;
	}


	public Center(int inquiryNo, String inquiryTitle, Date registDate, String inquiryProStatus) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.registDate = registDate;
		this.inquiryProStatus = inquiryProStatus;
	}
	

	public Center(int inquiryNo, String inquiryTitle, String inquiryContent, String inquiryAnswer, Date registDate,
			Date modifyDate, int inquiryType, String inquiryStore, String inquiryProStatus,
			String memberId,int receiptNo) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryAnswer = inquiryAnswer;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.inquiryType = inquiryType;
		this.inquiryStore = inquiryStore;
		this.inquiryProStatus = inquiryProStatus;
		this.receiptNo = receiptNo;
		this.memberId = memberId;
	}


	public Center(int inquiryNo, String inquiryTitle, String inquiryContent, String inquiryAnswer, Date registDate,
			Date modifyDate, int inquiryType, String inquiryStore, String inquiryProStatus, int memberNo, int receiptNo,
			String memberId) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryAnswer = inquiryAnswer;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.inquiryType = inquiryType;
		this.inquiryStore = inquiryStore;
		this.inquiryProStatus = inquiryProStatus;
		this.memberNo = memberNo;
		this.receiptNo = receiptNo;
		this.memberId = memberId;
	}










	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getInquiryNo() {
		return inquiryNo;
	}


	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}


	public String getInquiryTitle() {
		return inquiryTitle;
	}


	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}


	public String getInquiryContent() {
		return inquiryContent;
	}


	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}


	public String getInquiryAnswer() {
		return inquiryAnswer;
	}


	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}


	public Date getRegistDate() {
		return registDate;
	}


	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getInquiryType() {
		return inquiryType;
	}


	public void setInquiryType(int inquiryType) {
		this.inquiryType = inquiryType;
	}


	public String getInquiryStore() {
		return inquiryStore;
	}


	public void setInquiryStore(String inquiryStore) {
		this.inquiryStore = inquiryStore;
	}


	public String getInquiryProStatus() {
		return inquiryProStatus;
	}


	public void setInquiryProStatus(String inquiryProStatus) {
		this.inquiryProStatus = inquiryProStatus;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getReceiptNo() {
		return receiptNo;
	}


	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}


	@Override
	public String toString() {
		return "Center [inquiryNo=" + inquiryNo + ", inquiryTitle=" + inquiryTitle + ", inquiryContent="
				+ inquiryContent + ", inquiryAnswer=" + inquiryAnswer + ", registDate=" + registDate + ", modifyDate="
				+ modifyDate + ", inquiryType=" + inquiryType + ", inquiryStore=" + inquiryStore + ", inquiryProStatus="
				+ inquiryProStatus + ", memberNo=" + memberNo + ", receiptNo=" + receiptNo + ", memberId=" + memberId
				+ "]";
	}


	
	

}
