package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.dao.CartDAO;

public class CartDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		try {
			int cartIdx = Integer.parseInt(req.getParameter("cartIdx"));
			
			System.out.println("cartIdx :"+cartIdx);
			
			int result = CartDAO.cartDelete(cartIdx);
			
			
			
			
			System.out.println("삭제완료 : " + result);
		} catch (Exception e) {
			System.out.println("DeleteCommand 예외처리");
			e.printStackTrace();
		}

		
		
		return "delProduct.jsp";
	}

}
