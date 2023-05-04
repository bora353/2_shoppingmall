package com.shoppingmall.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.dao.CartDAO;
import com.shoppingmall.vo.CartVO;


public class CartListCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		

		int userIdx = (int)req.getSession().getAttribute("userIdx");

		
		List<CartVO> cart_list = CartDAO.getCartAll(userIdx);
		
		System.out.println("command의 "+cart_list);
		
		req.setAttribute("cart_list", cart_list);
		
		int cartCount = CartDAO.cartCount(userIdx);
		req.setAttribute("cartCount", cartCount);
		
		return "cartList.jsp";
	}

}
