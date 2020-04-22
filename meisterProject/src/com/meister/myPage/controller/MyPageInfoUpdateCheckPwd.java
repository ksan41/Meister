

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meister.member.model.vo.Member;
import com.meister.myPage.model.service.MyPageService;

/**
 * Servlet implementation class myPageInfoUpdateCheckPwd
 */
@WebServlet("/myInfoUpdateCheckPwd.my")
public class myPageInfoUpdateCheckPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageInfoUpdateCheckPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String inputPwd = request.getParameter("inputPwd");
		
		String memberPwd = new MyPageService().updateCheckPwd(memberId);
		
		if(memberPwd.equals(inputPwd)) {	// 비밀번호 일치
			
			RequestDispatcher view = request.getRequestDispatcher("views/user/myPage/myPageInfoUpdateForm.jsp");
			view.forward(request, response);			
			
		}else {	// 비밀번호 불일치
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.'); location.href='myInfoUpdateCheck.my';</script>");
			out.flush();

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
