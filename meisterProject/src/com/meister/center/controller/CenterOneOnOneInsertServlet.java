package com.meister.center.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meister.center.model.service.CenterService;
import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CenterOneOnOneInsertServlet
 */
@WebServlet("/cOneInsert.ce")
public class CenterOneOnOneInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterOneOnOneInsertServlet() {
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
		
			// 3. DB에 저장할 데이터들 뽑아서 vo에 담기
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int type = Integer.parseInt(multiRequest.getParameter("inquiryType"));
			String store = multiRequest.getParameter("store");
			
			Center c = new Center();
			c.setInquiryTitle(title);
			c.setInquiryContent(content);
			c.setInquiryType(type);
			c.setInquiryStore(store);
			
			CenterImage ci = null;
			
			// 첨부파일이 넘어왔을 경우 ci 객체 생성
			if(multiRequest.getOriginalFileName("upfile") != null) {
				ci = new CenterImage();
				
				// 원본명
				ci.setOriginName(multiRequest.getOriginalFileName("upfile"));
				// 수정명
				ci.setChangeName(multiRequest.getFilesystemName("upfile"));
				
				ci.setFilePath(savePath);
			}
			
			// 4. 문의 작성용 서비스 요청(c, ci)
			int result = new CenterService().insertInquiry(c, ci);
			
			if(result > 0) {	// 성공
				response.setContentType("text/html; charset=utf-8");
				
				PrintWriter out = response.getWriter();
				out.println("<script>alert('문의가 등록되었습니다. 마이페이지로 이동합니다.'); location.href='myOneList.my';</script>");
				//out.flush();
				//response.sendRedirect("myOneList.my");
				
			}else {		// 실패
				
				// 서버에 업로드된 파일 찾아서 삭제
				if(ci != null) {
					// 삭제할 File객체 생성
					File deleteFile = new File(savePath + ci.getChangeName());
					deleteFile.delete();
				}
				
				response.setContentType("text/html; charset=utf-8");
				
				PrintWriter out = response.getWriter();
				out.println("<script>alert('문의 등록에 실패했습니다. 다시 시도해주세요.');</script>");
				//request.setAttribute("msg", "문의 등록에 실패했습니다. 다시 시도해주세요.");
				
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
