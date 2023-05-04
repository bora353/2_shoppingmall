package com.shoppingmall.command;

import com.shoppingmall.vo.ProductVO;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.dao.CartDAO;

public class CartInsertCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
// 세션에서 데이터 가져오기!!! (아래 임의로 넣음 몰라서)


		int userIdx = (int)req.getSession().getAttribute("userIdx");
		System.out.println("userIdx = " + userIdx);
		ProductVO productVO = (ProductVO) req.getSession().getAttribute("vo");
		System.out.println("productVO = " + productVO);
		int pIdx = productVO.getpIdx();
		System.out.println("pIdx = " + pIdx);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pIdx", pIdx);
		map.put("userIdx", userIdx);
		
		int result = CartDAO.insertCart(map);
		System.out.println("장바구니 담기 : " + result);
		
		return "insertOK.jsp";
	}

}
