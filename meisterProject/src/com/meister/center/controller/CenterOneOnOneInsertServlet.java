package com.meister.center.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
