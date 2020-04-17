package com.meister.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) { // rename메소드 실행되면서 원본파일 매개변수에 전달됨
		
		// 원본명  "aaa.jpg"
		String originName = originFile.getName(); 
		
		// 수정명 : 파일업로드한시간(년월일시분초) + 10000~99999(5자리랜덤값) + 확장자
		
		//  원본명		--> 수정명
		// aaa.jpg		--> 2019120113231112345.jpg
		
		
		// 1. 파일업로드한시간 알아내기 (String currentTime)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date()); // 20191201132311
		
		// 2. 5자리 랜덤값 (int ranNum)
		int ranNum = (int)(Math.random() * 90000 + 10000); // 12345
		
		// 3. 확장자 (String ext)
		//    ex) .jpg  .png (. 포함해서)
		
		// >> 원본명에 .이 위치해있는 인덱스 알아내기
		int dot = originName.lastIndexOf("."); // 3
		
		String ext = originName.substring(dot); // .jpg
		
		// 이제 각각 추출한 값들 다 조합해서 수정명 
		String fileName = currentTime + ranNum + ext;
		
		// 전달받은 원본파일(originFile)을 수정된파일명으로 File 객체로 생성해서 리턴
		File renameFile = new File(originFile.getParent(), fileName);
		return renameFile;
	}
	
}
