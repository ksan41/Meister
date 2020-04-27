package com.meister.menu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
		request.setCharacterEncoding("utf-8");
		
		
		
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
			
			int pNo = Integer.parseInt(multiRequest.getParameter("pNo"));
			String pizzaName = multiRequest.getParameter("pName");
			String contents = multiRequest.getParameter("contents");
			String toppings = multiRequest.getParameter("toppings");
			String origins = multiRequest.getParameter("origins");
			
			
			int priceL = Integer.parseInt(multiRequest.getParameter("priceL"));
			int priceM = Integer.parseInt(multiRequest.getParameter("priceM"));
			int psNo = Integer.parseInt(multiRequest.getParameter("psNo"));
			
			// 기존에 서버에 업로드된 파일도 삭제
			// 삭제시킬 파일객체 생성
			// 파일경로 + 기존파일명(수정명)
			File deleteImg = new File(savePath + multiRequest.getParameter("menuImg"));
			deleteImg.delete();
			
			Pizza updateP = new Pizza();
			updateP.setPizzaNo(pNo);
			updateP.setPizzaName(pizzaName);
			updateP.setPizzaContent(contents);
			updateP.setPizzaTopping(toppings);
			updateP.setPizzaOrigin(origins);
			updateP.setPizzaImg(multiRequest.getFilesystemName("menuImg"));
			
			// M사이즈용 객체생성
			PizzaSize updateSizeM = new PizzaSize();
			updateSizeM.setPizzaNo(pNo);
			updateSizeM.setPizzaSize("M");
			updateSizeM.setPizzaPrice(priceM);
			updateSizeM.setSizeNo(psNo);
			
			// L사이즈용 객체생성
			PizzaSize updateSizeL = new PizzaSize();
			updateSizeL.setPizzaNo(pNo);
			updateSizeL.setPizzaSize("L");
			updateSizeL.setPizzaPrice(priceL);
			updateSizeL.setSizeNo(psNo);
			
			ArrayList<PizzaSize> psList = new ArrayList<>();
			psList.add(updateSizeM);
			psList.add(updateSizeL);
			
			// 피자객체,사이즈객체(M),사이즈객체(L)로 서비스요청
			int result = new MenuService().updatePizza(updateP,psList);
			
			response.setCharacterEncoding("utf-8");
			
			if(result > 0) {//메뉴 수정 성공
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('"+updateP.getPizzaName()+"메뉴 수정 성공했습니다.');location.href='/Meister/menuMgPizzaList.meng';</script>");
				out.flush();
			}else { //메뉴 수정 실패
				
				// 등록실패한 파일 찾아서 삭제
				File deleteFile = new File(savePath + updateP.getPizzaImg());
				deleteFile.delete();
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('메뉴 수정 실패. 다시 시도해주세요.');location.href='/Meister/menuMgPizzaList.meng';</script>");
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
