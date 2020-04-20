package com.meister.center.model.vo;

public class CenterImage {
	private int fileNo; //이미지파일 번호
	private String originName; //파일 원본명
	private String changeName; //파일 수정명
	private String filePath; //저장폴더 경로
	private int fileLevel; //파일레벨(기본 1)
	private int inqueryNo; //문의번호(참조할 문의글 번호)
	
	public CenterImage() {}

	public CenterImage(int fileNo, String originName, String changeName, String filePath, int fileLevel,
			int inqueryNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.inqueryNo = inqueryNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getInqueryNo() {
		return inqueryNo;
	}

	public void setInqueryNo(int inqueryNo) {
		this.inqueryNo = inqueryNo;
	}

	@Override
	public String toString() {
		return "CenterImage [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", inqueryNo=" + inqueryNo + "]";
	}
	
	
	
}
