package com.shoppingmall.controller;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.dao.RegisterDAO;
import com.shoppingmall.paging.MainPaging;
import com.shoppingmall.vo.UserVO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.vo.ProductVO;
import javax.servlet.http.HttpSession;

@WebServlet("/main")
public class MainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("/main 호출");
		String currentPage = request.getParameter("currentPage");

		if(currentPage == null)
			currentPage = "1";

		MainPaging paging = new MainPaging(Integer.parseInt(currentPage));

		List<ProductVO> productList = ProductDAO.getPageList(paging.getBegin(), paging.getEnd());
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		UserVO user = RegisterDAO.selectUserById(id);

		request.setAttribute("productList", productList);
		request.setAttribute("user", user);
		request.setAttribute("paging",paging);
		request.getRequestDispatcher("/view/main.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}