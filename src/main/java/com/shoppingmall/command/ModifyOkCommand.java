package com.shoppingmall.command;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.shoppingmall.dao.QnaDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.vo.QnaVO;

public class ModifyOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");

		// 파일 저장 위치
		String path = "C:/Users/ksb96/IdeaProjects/demo2/src/main/webapp/img";

		//1. MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(
				request, path, (10 * 1024 * 1024),
				"UTF-8", new DefaultFileRenamePolicy());
		
		//전달받은 데이터 VO 에 저장 후 DB에 수정 처리(DB 연동 작업)
		QnaVO sessionqvo = (QnaVO)session.getAttribute("qvo");
		
		String content = mr.getParameter("content");
		
		QnaVO qvo = new QnaVO();
		//int bbsIdx = ((BbsVO)session.getAttribute("bvo")).getBbsIdx();
		qvo.setqNo(sessionqvo.getqNo());
		qvo.setqTitle(mr.getParameter("title"));
		qvo.setqWriter(mr.getParameter("writer"));
		qvo.setqContent(content.replace("\r\n","<br>"));
		qvo.setqCategory(mr.getParameter("category"));
		qvo.setqPwd(Integer.parseInt(mr.getParameter("pwd"))); //확인용 암호
		System.out.println("sessionqvo.getqFilename() = " + sessionqvo.getqFilename());

		
		// 암호 일치여부 확인 --------------------------
		if (! (sessionqvo.getqPwd() == qvo.getqPwd())) {
			System.out.println("sessionqvo.getqPwd() : " + sessionqvo.getqPwd());
			System.out.println("qvo.getqPwd() : " + qvo.getqPwd());
			System.out.println("> 암호불일치");
			request.setAttribute("qvo", qvo);
			request.setAttribute("pass_check", "fail");
			return "modify.jsp";
		}
		System.out.println("> 암호일치");
		
		//첨부파일 데이터 처리
		if (mr.getFile("filename") == null) { //첨부파일 없으면
			qvo.setqFilename(sessionqvo.getqFilename()); //원래 파일명 유지
			qvo.setqOriname(sessionqvo.getqOriname());
		} else {
			qvo.setqFilename(mr.getFilesystemName("filename"));
			qvo.setqOriname(mr.getOriginalFileName("filename"));
		}
		System.out.println("> modify_ok.jsp qvo : " + qvo);	
		
		//DB 데이터 수정작업(DAO에 bvo 전달해서 UPDATE)
		try {
			QnaDAO.update(qvo);
			
			//파일 변경 되었으면 이전 파일 삭제처리(개별 실습) 
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		
		
		return "modify_ok.jsp";
	}

}
