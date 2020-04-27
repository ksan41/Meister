package com.meister.member.model.vo;

import java.sql.Date;

public class Manager {
	private int managerNo;	//관리자번호
	private String managerId;	//관리자아이디
	private String managerPwd;	//비밀번호
	private String managerType;	//관리자타입('통합','지점')
	private String name;	//이름
	private String phone;	//전화번호
	private String email;	//이메일
	private String gender;	//성별
	private Date enrollDate;	//관리자 등록일
	private Date modifyDate;	//관리자 정보 수정일
	private String status;		// 퇴사여부('N','Y')기본값 'Y'
	
	// 새로 생성
	private String loginManager;
	
	public Manager() {}

	public Manager(int managerNo, String managerId, String managerPwd, String managerType, String name, String phone,
			String email, String gender, Date enrollDate, Date modifyDate, String status) {
		super();
		this.managerNo = managerNo;
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.managerType = managerType;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	
	
	

	public Manager(int managerNo, String managerId, String managerPwd, String managerType, String name, String phone,
			String email, String gender, Date enrollDate, Date modifyDate, String status, String loginManager) {
		super();
		this.managerNo = managerNo;
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.managerType = managerType;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.loginManager = loginManager;
	}
	
	
	
	

	public String getLoginManager() {
		return loginManager;
	}

	public void setLoginManager(String loginManager) {
		this.loginManager = loginManager;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getManagerType() {
		return managerType;
	}

	public void setManagerType(String managerType) {
		this.managerType = managerType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Manager [managerNo=" + managerNo + ", managerId=" + managerId + ", managerPwd=" + managerPwd
				+ ", managerType=" + managerType + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", gender=" + gender + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status="
				+ status + "]";
	}
	
	
	
}
