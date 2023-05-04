package com.shoppingmall.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.dao.QnaDAO;
import com.shoppingmall.vo.QnaVO;


public class CSDeleteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		
		request.setCharacterEncoding("UTF-8");

		
		QnaVO sessionQvo = (QnaVO) session.getAttribute("qvo");
		System.out.println("> session : " + sessionQvo);
		int qNo = sessionQvo.getqNo();
		System.out.println("qNo : " + qNo);
		int pwd = Integer.parseInt(request.getParameter("pwd"));
		System.out.println("pwd : " + pwd);
		System.out.println("sessionQvo.getqPwd() : " + sessionQvo.getqPwd());
		
		
		//암호확인 : DB에 저장된 암호 vs 확인용 암호(파라미터)
		if (!(pwd == (sessionQvo.getqPwd()))) {
			System.out.println(">>암호불일치~~");
			return "controller?type=view&qNo=" + sessionQvo.getqNo();
			
		} 
		
		//암호일치하면 DB 데이터 삭제처리	
		QnaDAO.delete(qNo);
		
		
		return "delete_ok.jsp";
		
	}
		
}
