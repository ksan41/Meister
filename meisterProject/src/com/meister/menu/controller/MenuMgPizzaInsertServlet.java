package com.meister.menu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meister.common.MyFileRenamePolicy;
import com.meister.menu.model.service.MenuService;
import com.meister.menu.model.vo.Pizza;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MenuMgPizzaInsertServlet
 */
@WebServlet("/pizzaInsert.meng")
public class MenuMgPizzaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuMgPizzaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 값이 enc타입(multi-part/formdata)로 넘어왔는지 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 파일의 용량제한
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 전달된 파일을 저장할 폴더 경로(thumbnail_upfiles)
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\siteImgs\\menuImg\\pizza\\";
			
			// 2. 전달된 파일들의 파일명 수정작업 및 폴더에 업로드
			//     multiRequest로 변환할 request,저장경로,지정사이즈,인코딩값,이름변경클래스생성
			MultipartRequest multiRequest = new MultipartRequest(
					request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy()
					);
			
			// 3. DB에 insert할 데이터들 뽑아서 vo객체에 담기
			
			// 3_1. Board 객체
			String pType = multiRequest.getParameter("pizzaType");
			String pName = multiRequest.getParameter("pizzaName");
			String contents = multiRequest.getParameter("contents");
			String toppings = multiRequest.getParameter("toppings");
			String origins = multiRequest.getParameter("origins");
			String pImg = multiRequest.getFilesystemName("menuImg");
			
			int priceM = Integer.parseInt(multiRequest.getParameter("priceM"));
			int priceL = Integer.parseInt(multiRequest.getParameter("priceL"));
			
			
			Pizza p = new Pizza();
			p.setPizzaName(pName);
			p.setPizzaType(pType);
			p.setPizzaImg(pImg);
			p.setPizzaContent(contents);
			p.setPizzaTopping(toppings);
			p.setPizzaOrigin(origins);
			
			
			int result = new MenuService().insertMenuPizza(p,priceM,priceL);
			
			
			if(result > 0) { // 사진게시판 등록 성공
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('메뉴 등록에 성공했습니다.');location.href='/Meister/menuMgPizzaList.meng';</script>");
				out.flush();
				
			}else { // 사진게시판 등록 실패
					
				File deleteFile = new File(savePath + pImg);
				deleteFile.delete();
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('메뉴 등록에 실패했습니다.');location.href='/Meister/menuMgPizzaList.meng';</script>");
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
