package com.meister.branch.model.vo;

import java.sql.Date;

public class Branch {
	private int branchNo;	//지점번호
	private String branchName;	//지점명
	private String openTime;	//영업시작시간
	private String closeTime;	//영업종료시간
	private Date openingDate;	//개점일자
	private String address;		//지점주소
	private String phone;		//지점전화번호
	private String branchImg;	//매장이미지
	private Date registerDate;	//지점등록일
	private Date modifyDate;	//지점정보 수정일
	private int managerNo;		//관리자번호(지점)
	private String latitude;	//위도
	private String longtitude;	//경도
	private String status;		//영업여부('Y','N')
	
	public Branch() {}

	public Branch(int branchNo, String branchName, String openTime, String closeTime, Date openingDate, String address,
			String phone, String branchImg, Date registerDate, Date modifyDate, int managerNo, String latitude,
			String longtitude, String status) {
		super();
		this.branchNo = branchNo;
		this.branchName = branchName;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.openingDate = openingDate;
		this.address = address;
		this.phone = phone;
		this.branchImg = branchImg;
		this.registerDate = registerDate;
		this.modifyDate = modifyDate;
		this.managerNo = managerNo;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.status = status;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBranchImg() {
		return branchImg;
	}

	public void setBranchImg(String branchImg) {
		this.branchImg = branchImg;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Branch [branchNo=" + branchNo + ", branchName=" + branchName + ", openTime=" + openTime + ", closeTime="
				+ closeTime + ", openingDate=" + openingDate + ", address=" + address + ", phone=" + phone
				+ ", branchImg=" + branchImg + ", registerDate=" + registerDate + ", modifyDate=" + modifyDate
				+ ", managerNo=" + managerNo + ", latitude=" + latitude + ", longtitude=" + longtitude + ", status="
				+ status + "]";
	}
	
	
	
}
