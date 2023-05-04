package com.shoppingmall.command;

import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.UserVO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ModifyCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		QnaVO vo = (QnaVO) session.getAttribute("qvo");
		UserVO uvo = (UserVO)session.getAttribute("userList");
		
		System.out.println("qvo : " + vo);
		
		session.setAttribute("qvo", vo);
		session.setAttribute("uvo", uvo);
		
		return "modify.jsp";
	}

}
