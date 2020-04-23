package com.meister.member.controller;

import java.io.IOException;





import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findId.me")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * <? php include ""; if($_POST["name"] == "" || $_POST["email"] == ""){ echo
		 * '<script> alert("항목을 입력하세요"); history.back(); </script>'; }else{
		 * 
		 * $username = $_POST['name']; $email = $_POST['email'].'@'.$_POST['emadress'];
		 * 
		 * 
		 * $sql =
		 * mq("select * from member where name = '{$username}' && email = '{$email}'");
		 * $result = $sql->fetch_array();
		 * 
		 * if($result["name"] == $username){ echo
		 * "<script>alert('회원님의 ID는 ".$result['id']."입니다.'); history.back();</script>";
		 * }else{ echo "<script>alert('없는 계정입니다.'); history.back();</script>"; } } ?>
		 * 
		 */
		
		
		
		 
		
	
		
		
		
		
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
