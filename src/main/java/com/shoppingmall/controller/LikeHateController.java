package com.shoppingmall.controller;

import com.shoppingmall.dao.ReviewDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/review/likehateController")
public class LikeHateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getRequestURI());

		String reviewIdx = request.getParameter("no");
		int reviewIdx2 = Integer.parseInt(request.getParameter("no"));
		String userIdx = request.getParameter("id");

		System.out.println(reviewIdx);
		System.out.println(userIdx);
		
		
		
		
		int result = ReviewDAO.updateLike(reviewIdx, userIdx);
		System.out.println("updatelike result : " + result);

		int likeCount = ReviewDAO.getlikeCount(reviewIdx2);
		System.out.println("likeCount : " + likeCount);

		response.getWriter().print(likeCount);

		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
