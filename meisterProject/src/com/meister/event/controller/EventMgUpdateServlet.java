package com.meister.event.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meister.center.model.vo.CenterImage;
import com.meister.common.MyFileRenamePolicy;
import com.meister.event.model.service.EventService;
import com.meister.event.model.vo.Event;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EventMgUpdateServlet
 */
@WebServlet("/evMgUpdate.evm")
public class EventMgUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventMgUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		//multipart/formdata로 넘어왔는지 조건확인
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 파일의 용량제한
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 전달된 파일을 저장할 폴더 경로(thumbnail_upfiles)
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\siteImgs\\eventImg\\";
			
			// 2. 전달된 파일들의 파일명 수정작업 및 폴더에 업로드
			//     multiRequest로 변환할 request,저장경로,지정사이즈,인코딩값,이름변경클래스생성
			MultipartRequest multiRequest = new MultipartRequest(
					request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy()
			);
			
			// 3. DB에 insert할 데이터들 뽑아서 vo객체에 담기
			
			int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			
			String eventTitle = multiRequest.getParameter("eventTitle");
			Date eventOpenTime = java.sql.Date.valueOf(multiRequest.getParameter("eventOpenTime"));
			Date eventCloseTime = java.sql.Date.valueOf(multiRequest.getParameter("eventCloseTime"));
			String eventImage1 = multiRequest.getFilesystemName("eventImage1");
			String eventImage2 = multiRequest.getFilesystemName("eventImage2");
			String eventStatus = multiRequest.getParameter("eventStatus");
			
			Event e = new Event();
			e.setEventNo(bno);
			e.setEventTitle(eventTitle);
			e.setEventOpenTime(eventOpenTime);
			e.setEventCloseTime(eventCloseTime);
			e.setEventImage1(eventImage1);
			e.setEventImage2(eventImage2);
			e.setEventStatus(eventStatus);
			
			
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
					ci.setInqueryNo(bno);
				}
			}
			
			
			int result = new EventService().updateEvent(e);
			
			if(result > 0) {
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>alert('이벤트 수정 성공'); location.href='/Meister/evMgList.evm?bno=" + bno + "';</script>");
				out.flush();
				
			}else {
				
//				File deleteFile1 = new File(savePath + eventImage1);
//				deleteFile1.delete();
//				
//				File deleteFile2 = new File(savePath + eventImage2);
//				deleteFile2.delete();
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이벤트 수정 실패'); location.href='/Meister/evMgList.evm?bno=" + bno + "';</script>");
				out.flush();
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
