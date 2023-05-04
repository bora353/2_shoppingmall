package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		//파라미터 값 확인
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		System.out.println("> delete.jsp rNo : " + rNo);
		
		//EL 사용을 위해 scope에 저장
		session.setAttribute("rNo", rNo);
		
		return "reviewDelete.jsp";
	}

}
