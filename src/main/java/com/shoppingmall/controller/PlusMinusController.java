package com.shoppingmall.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.shoppingmall.command.Command;
import com.shoppingmall.dao.CartDAO;
import com.shoppingmall.dao.ReviewDAO;
import com.shoppingmall.vo.CartVO;

@WebServlet("/cart/plusMinusController")
public class PlusMinusController extends HttpServlet {
	private static final long serialVersionUID = 5L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getRequestURI());
		
//플러스일때!!!!!!!!!!!

		
		//1. 파라미터 값 확인(추출)
		int pIdx = Integer.parseInt(request.getParameter("pIdx"));
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		int cartIdx = Integer.parseInt(request.getParameter("cartIdx"));
		
		System.out.println("pIdx :" + pIdx);
		System.out.println("userIdx :" + userIdx);
		System.out.println("cartIdx :" + cartIdx);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pIdx", pIdx);
		map.put("userIdx", userIdx);
				
		
		
		String type = request.getParameter("type");
		System.out.println("type : " + type);
		
		
		if(type.equals("plus")) {
			int result = CartDAO.updatePlusCart(map);
			System.out.println("update plus 완료 : "+ result);
		} else {
			int result = CartDAO.updateMinusCart(map);
			System.out.println("update minus 완료 : "+ result);
		}
		
		
		
		CartVO cartVO = CartDAO.getCartOne(cartIdx);
		System.out.println("cartVO :" + cartVO);
		cartVO.getTotalPrice();
		System.out.println("cartVO :" + cartVO);

		
		/*
		 * ArrayList<Integer> ajaxList = new ArrayList<Integer>();
		 * ajaxList.add(cartVO.getQuant()); ajaxList.add(cartVO.getTotalPrice());
		 * ajaxList.add(cartVO.getCartTotal()); System.out.println(ajaxList);
		 * 
		 * response.getWriter().print(ajaxList);
		 */
		
		
		request.getRequestDispatcher("plusminus.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
