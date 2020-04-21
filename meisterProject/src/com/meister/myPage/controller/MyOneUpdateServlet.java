package com.meister.myPage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
import com.meister.member.model.vo.Member;
import com.meister.myPage.model.service.MyPageService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class MyOneUpdateServlet
 */
@WebServlet("/myOneUpdate.my")
public class MyOneUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOneUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1. 전송된 파일을 위해 처리할 작업
			int maxSize = 10 * 1024 * 1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\center_upfiles\\";
			
			// 2. 전달된 파일명 수정 및 업로드 작업
			MultipartRequest multiRequest 
				= new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
			// 3. DB에 실행할 전달값 뽑는 과정
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			int cno = Integer.parseInt(multiRequest.getParameter("cno"));
			
			Center c = new Center();
			c.setInquiryTitle(title);
			c.setInquiryContent(content);
			c.setMemberNo(memberNo);
			c.setInquiryNo(cno);
			
			CenterImage ci = null;
			// 새로이 추가된 첨부파일이 있을 경우
			if(multiRequest.getOriginalFileName("upfile") != null) {
				ci = new CenterImage();
				ci.setOriginName(multiRequest.getOriginalFileName("upfile"));	// 새로 추가된 파일의 원본명
				ci.setChangeName(multiRequest.getFilesystemName("upfile"));	// 새로 추가된 파일의 수정명
				ci.setFilePath(savePath);
				
				// 기존의 첨부파일이 있었을 경우 --> 기존의 첨부파일 정보 찾아서 update
				if(multiRequest.getParameter("originFileNo") != null) {
					ci.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존에 서버에 업로드된 파일도 삭제
					File deleteFile = new File(savePath + multiRequest.getParameter("originFileName"));
					deleteFile.delete();
					
				}else {	// 기존의 첨부파일이 없었을 경우 --> 새로이 CenterImage 테이블에 insert
					ci.setInqueryNo(cno);
				}
			}
			
			int result = new MyPageService().updateCenter(c, ci);
			
			if(result > 0) {	// 수정성공했을 경우 상세보기 페이지 요청!
				response.sendRedirect("/myOneDetail.my?cno=" + cno);
			}else {
				// 에러페이지 포워딩
				
			}
		}		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
