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
import com.meister.menu.model.vo.PizzaSize;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MenuMgPizzaUpdateServlet
 */
@WebServlet("/pizzaUp.meng")
public class MenuMgPizzaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuMgPizzaUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			int pNo = Integer.parseInt(multiRequest.getParameter("pNo"));
			String pizzaName = multiRequest.getParameter("pName");
			String contents = multiRequest.getParameter("contents");
			String toppings = multiRequest.getParameter("toppings");
			String origins = multiRequest.getParameter("origins");
			
			// 기존에 서버에 업로드된 파일도 삭제
			// 삭제시킬 파일객체 생성
			// 파일경로 + 기존파일명(수정명)
			File deleteImg = new File(savePath + multiRequest.getParameter("originFileName"));
			deleteImg.delete();
			
			
			Pizza insertP = new Pizza();
			insertP.setPizzaNo(pNo);
			insertP.setPizzaName(pizzaName);
			insertP.setPizzaContent(contents);
			insertP.setPizzaTopping(toppings);
			insertP.setPizzaOrigin(origins);
			
			// M사이즈용 객체생성
			PizzaSize insertSizeM = new PizzaSize();
			
			// L사이즈용 객체생성
			PizzaSize insertSizeL = new PizzaSize();
			// 3_2. Attachment 테이블에 insert할 정보
//			ArrayList<Attachment> list = new ArrayList<>();
			
			// 파일 1번부터 비교수행, 첨부된 해당 인덱스에 Attachment객체 생성해서 담기
//			for(int i=1;i<=4;i++) {
//				
//				String name = "file" + i;
//				
//				// 해당 key값의 첨부파일이 있을 경우 
//				if(multiRequest.getOriginalFileName(name) != null) {
//					
//					Attachment at = new Attachment();
//					at.setFilePath(savePath);
//					at.setOriginName(multiRequest.getOriginalFileName(name));
//					at.setChangeName(multiRequest.getFilesystemName(name));
//					
//					list.add(at);
//				}
//			}
//			
			
			int result = new MenuService().insertPizza(insertP);
			
			
			if(result > 0) {//메뉴 수정 성공
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('"+insertP.getPizzaName()+"메뉴 등록 성공했습니다.');location.href='/Meister/menuMgPizzaList.meng';</script>");
				out.flush();
			}else { //메뉴 수정 실패
				
				// 등록실패한 파일 찾아서 삭제
				File deleteFile = new File(savePath + insertP.getPizzaImg());
				deleteFile.delete();
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('메뉴 등록 실패. 다시 시도해주세요.');location.href='/Meister/menuMgPizzaList.meng';</script>");
				out.flush();
				// 에러페이지
				//request.setAttribute("msg", "게시글 등록실패");
				//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
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
