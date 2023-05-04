package com.shoppingmall.command;

import com.shoppingmall.dao.QnaDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.Qna_ReviewVO;

public class ReviewDeleteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");

		//파라미터 값 확인
		int pwd = Integer.parseInt(request.getParameter("pwd"));
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		System.out.println("> comm_delete_ok.jsp pwd : " + pwd);
		
		// DB에서 댓글 데이터 가져오기
		Qna_ReviewVO rvo = QnaDAO.getCommentOne(rNo);
		System.out.println("> comm_delete_ok.jsp rvo : " + rvo);
		
		// 세션(session)에 있는 데이터 확인
		String cPage = (String) session.getAttribute("cPage");
		//BbsVO bvo = (BbsVO)session.getAttribute("bvo");
		int qNo = ((QnaVO) session.getAttribute("qvo")).getqNo();
		
		//DB에 데이터가 없는 경우
		if (rvo == null) {
			//view.jsp?bbsIdx=1&cPage=4
			//response.sendRedirect("view.jsp?bbsIdx=" + bvo.getBbsIdx() + "&cPage=" + cPage);
			return "controller?type=view&qNo=" + qNo;
		}
		
		//DB에 데이터 있으나 암호 불일치인 경우
		if (!(pwd ==rvo.getrPwd())) {
			
			return "controller?type=view&qNo=" + qNo;
		}
		
		//DB에 데이터가 있으며 암호도 일치하는 경우
		try {
			QnaDAO.deleteComment(rNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "controller?type=view&qNo=" + qNo;
	}

}
