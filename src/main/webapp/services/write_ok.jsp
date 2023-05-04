<%@page import="com.shoppingmall.dao.QnaDAO"%>
<%@page import="com.shoppingmall.vo.QnaVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");

	// 파일 저장 위치
	String path = "c:/MyStudy/temp";
	
	//1. MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 VO 에 저장 후 DB에 입력 처리(DB 연동 작업)
	QnaVO qvo = new QnaVO();
	qvo.setqTitle(mr.getParameter("title"));
	qvo.setqWriter(mr.getParameter("writer"));
	qvo.setqContent(mr.getParameter("content"));
	qvo.setqPwd(Integer.parseInt(mr.getParameter("pwd")));
	
	
	//첨부파일 데이터 처리
	if (mr.getFile("filename") == null) { //첨부파일 없으면
		//System.out.println(">> 첨부파일 없음");
		qvo.setqFilename("");
		qvo.setqOriname("");
	} else {
		//System.out.println(">> 첨부파일 있음~~~~");
		qvo.setqFilename(mr.getFilesystemName("filename"));
		qvo.setqOriname(mr.getOriginalFileName("filename"));
	}
	
	System.out.println("qvo : " + qvo);
	
	//DB에 입력(저장) 처리
	int cnt = QnaDAO.insert(qvo);
	System.out.println("입력 건수 : " + cnt);
*/
	//화면전환(목록페이지로 이동 - 첫페이지로 가기)
	response.sendRedirect("controller?type=service");

%>