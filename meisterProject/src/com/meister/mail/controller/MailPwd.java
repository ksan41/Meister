package com.meister.mail.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.meister.member.model.service.MemberService;

/**
 * Servlet implementation class MailPwd
 */
@WebServlet("/MailPwd")
public class MailPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//mail 
        String host = "smtp.naver.com"; // 	SMTP 서버명 
        String user = "xorud3290@naver.com";  // 아이디
        String password = "xo94272150!"; // 비밀번호
        
        
        String email = request.getParameter("Email");
        String memberId = request.getParameter("memberId");
        
        System.out.println("아이디 : " + memberId);
        System.out.println(email);
        
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        
        // 인증코드 보내기
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        //email 
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "Meister"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            
            msg.setSubject("인증보내기");
            
            msg.setText("인증하기 :"+temp);
            
            
            Transport.send(msg);
            System.out.println("이메일보내기성공");
            
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        }
        
//        HttpSession saveKey = request.getSession();
//        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
//        
//        request.getRequestDispatcher("index.jsp").forward(request, response);
        
        
//      임시 비밀번호 변경
        String temp1 = temp.toString();
        int result = new MemberService().memberPwdcheck(memberId, temp1);
        
        if(result > 0) { // 성공
			 System.out.println("ok");
		} else { // 실패
			System.out.println("실패");
		}
        
        System.out.println("temp : " + temp);
        System.out.println("temp1 : " + temp1);
        
        response.setContentType("aplication/json; charset=utf-8");
    	
    	Gson gson = new Gson();
    	
    	gson.toJson(AuthenticationKey,response.getWriter()); 	
    	
	
	}

	
		
		
		
		
		
		
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
