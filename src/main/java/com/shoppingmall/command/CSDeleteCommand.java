package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.vo.QnaVO;

public class CSDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		QnaVO vo = (QnaVO) session.getAttribute("qvo");
		System.out.println("qvo : " + vo);
		
		session.setAttribute("qvo", vo);
		
		return "delete.jsp";
	}

}
