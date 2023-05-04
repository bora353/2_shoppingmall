package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shoppingmall.dao.QnaDAO;
import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.UserVO;

public class CSWriteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		
		//0. 한글처리
		request.setCharacterEncoding("UTF-8");
		

		// 파일 저장 위치
		String path = "C:/Users/ksb96/IdeaProjects/demo2/src/main/webapp/img";
		
		//1. MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(
				request, path, (10 * 1024 * 1024),
				"UTF-8", new DefaultFileRenamePolicy());
		
		//전달받은 데이터 VO 에 저장 후 DB에 입력 처리(DB 연동 작업)
		
		UserVO userList = (UserVO) session.getAttribute("userList");
		
		String content = mr.getParameter("content");
		
		QnaVO qvo = new QnaVO();
		qvo.setqTitle(mr.getParameter("title"));
		qvo.setUserNo(userList.getUserIdx());
		qvo.setqCategory(mr.getParameter("category"));
		qvo.setqWriter(userList.getUserName());
		qvo.setqContent(content.replace("\r\n","<br>"));
		qvo.setqPwd(Integer.parseInt(mr.getParameter("pwd")));
		
		
		//첨부파일 데이터 처리
		if (mr.getFile("filename") == null) { //첨부파일 없으면
			//System.out.println(">> 첨부파일 없음");
			qvo.setqFilename("noimg.png");
			qvo.setqOriname("noimg.png");
		} else {
			//System.out.println(">> 첨부파일 있음~~~~");
			qvo.setqFilename(mr.getFilesystemName("filename"));
			qvo.setqOriname(mr.getOriginalFileName("filename"));
		}
		
		System.out.println("qvo : " + qvo);
		
		//DB에 입력(저장) 처리
		int cnt = QnaDAO.insert(qvo);
		System.out.println("입력 건수 : " + cnt);
		
		return "write_ok.jsp" ;
	}

}
