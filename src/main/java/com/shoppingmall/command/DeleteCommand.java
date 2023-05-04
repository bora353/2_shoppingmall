package com.shoppingmall.command;

import com.shoppingmall.dao.ReviewDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			int reviewIdx = Integer.parseInt((String) req.getParameter("reviewIdx"));
			int result = ReviewDAO.deleteReview(reviewIdx);
			System.out.println("삭제완료 : " + result);
		} catch (Exception e) {
			System.out.println("DeleteCommand 예외처리");
			e.printStackTrace();
		}

		return "/review/deleteOK.jsp";
	}

}
