package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductVO;
import com.shoppingmall.vo.UserVO;

public class ProductDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		System.out.println("uvo : " + uvo);
		String password = uvo.getPassword();
		System.out.println("password : " + password);
		//String password = (String)session.getAttribute("pw");
		
		String inPassword = request.getParameter("password");
		
		if(password.equals(inPassword)) {
			int pIdx = ((ProductVO)session.getAttribute("vo")).getpIdx();
			//System.out.println("pIdx : " + pIdx);
			ProductDAO.setDelete(pIdx);
			return "controller?type=productList";
		} else {
			return "productDeleteFail.jsp";
		}
		
	}

}
