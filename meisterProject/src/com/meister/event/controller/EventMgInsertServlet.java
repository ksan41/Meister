package com.meister.event.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meister.common.MyFileRenamePolicy;
import com.meister.event.model.service.EventService;
import com.meister.event.model.vo.Event;
import com.oreilly.servlet.MultipartRequest;



/**
 * Servlet implementation class EventMgInsertServlet
 */
@WebServlet("/evMgInsert.evm")
public class EventMgInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventMgInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// faqType, faqQuestion, faqAnswer
		request.setCharacterEncoding("utf-8");
		
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
						
			
			String eventTitle = multiRequest.getParameter("eventTitle");
			Date eventOpenTime = java.sql.Date.valueOf(multiRequest.getParameter("eventOpenTime"));
			Date eventCloseTime = java.sql.Date.valueOf(multiRequest.getParameter("eventCloseTime"));
			String eventImage1 =multiRequest.getFilesystemName("eventImage1");
			String eventImage2 = multiRequest.getFilesystemName("eventImage2");
			String eventStatus = multiRequest.getParameter("eventStatus");
			
			Event ev = new Event();
			ev.setEventTitle(eventTitle);
			ev.setEventOpenTime(eventOpenTime);
			ev.setEventCloseTime(eventCloseTime);
			ev.setEventImage1(eventImage1);
			ev.setEventImage2(eventImage2);
			ev.setEventStatus(eventStatus);
			
			int result = new EventService().insertEvent(ev);
			
			if(result > 0) {
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>alert('EVENT 등록 성공'); location.href='/Meister/evMgList.evm';</script>");
				out.flush();
				
			}else {		// 공지사항 작성 실패!
				File deleteFile = new File(savePath + eventImage1);
				deleteFile.delete();
				deleteFile = new File(savePath + eventImage2);
				deleteFile.delete();
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				out.println("<script>alert('EVENT 등록 실패'); location.href='/Meister/evMgList.evm';</script>");
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
