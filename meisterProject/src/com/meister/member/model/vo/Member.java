package com.meister.member.model.vo;

import java.sql.Date;

public class Member {

	private int memberNo;			// 회원번호
	private String memberName;		// 이름
	private String memberId;		// 아이디
	private String memberPwd;		// 비밀번호
	private Date memberBirth;		// 생년월일
	private String memberGender;	// 성별
	private String memberPhone;		// 휴대전화
	private String memberEmail;		// 이메일
	private Date memberEnrolldate;	// 가입일
	private Date modifyDate;		// 수정일
	private String memberStatus;	// 가입상태
	private String leaveType;		// 탈퇴타입
	private String leaveReason;		// 탈퇴사유
	private String paymentType;		// 기본결제수단

	public Member() {

	}

	
	public Member(int memberNo, String memberName, String memberId, String memberPwd, Date memberBirth,
			String memberGender, String memberPhone, String memberEmail, Date memberEnrolldate, Date modifyDate,
			String memberStatus, String leaveType, String leaveReason, String paymentType) {

		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberBirth = memberBirth;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberEnrolldate = memberEnrolldate;
		this.modifyDate = modifyDate;
		this.memberStatus = memberStatus;
		this.leaveType = leaveType;
		this.leaveReason = leaveReason;
		this.paymentType = paymentType;
	}

	
	// 회원가입시 사용하는 매개변수 생성자
	public Member(String memberName, String memberId, String memberPwd, Date memberBirth, String memberGender,
			String memberPhone, String memberEmail) {
		super();
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberBirth = memberBirth;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
	}
	
	


	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public Date getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getMemberEnrolldate() {
		return memberEnrolldate;
	}

	public void setMemberEnrolldate(Date memberEnrolldate) {
		this.memberEnrolldate = memberEnrolldate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberName=" + memberName + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", memberBirth=" + memberBirth + ", memberGender=" + memberGender + ", memberPhone="
				+ memberPhone + ", memberEmail=" + memberEmail + ", memberEnrolldate=" + memberEnrolldate
				+ ", modifyDate=" + modifyDate + ", memberStatus=" + memberStatus + ", leaveType=" + leaveType
				+ ", leaveReason=" + leaveReason + ", paymentType=" + paymentType + "]";
	}
}
