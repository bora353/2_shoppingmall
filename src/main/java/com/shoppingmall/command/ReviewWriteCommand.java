package com.shoppingmall.command;

import com.shoppingmall.dao.QnaDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.Qna_ReviewVO;

public class ReviewWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		QnaVO sessionQvo = (QnaVO) session.getAttribute("qvo");
		System.out.println("sessionQvo : " + sessionQvo);
		
		//전달받은 데이터 VO 에 저장 후 DB에 수정 처리(DB 연동 작업)
		List<Qna_ReviewVO> sessionRvo = QnaDAO.getCommList(sessionQvo.getqNo());
		System.out.println("sessionRvo : " + sessionRvo);
		
		int qNo = sessionQvo.getqNo();
		
		Qna_ReviewVO rvo = new Qna_ReviewVO();
		//int bbsIdx = ((BbsVO)session.getAttribute("bvo")).getBbsIdx();
		rvo.setqNo(sessionQvo.getqNo());
		rvo.setrWriter(request.getParameter("writer"));
		rvo.setrPwd(Integer.parseInt(request.getParameter("pwd")));
		rvo.setrContent(request.getParameter("content"));
		
		System.out.println("rvo : " + rvo);
		
		QnaDAO.insertComment(rvo);
		
		return "controller?type=view&qNo="  + qNo;
	}

}
