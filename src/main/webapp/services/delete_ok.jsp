<%@page import="com.shoppingmall.dao.QnaDAO"%>
<%@page import="com.shoppingmall.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 암호와 게시글번호 사용해서 암호일치하면 DB에서 게시글 삭제 --%>

<%
    //페이지 전환
    response.sendRedirect("controller?type=service&cPage=" + session.getAttribute("cPage"));
/*
	request.setCharacterEncoding("UTF-8");

	
	QnaVO sessionQvo = (QnaVO) session.getAttribute("qvo");
	System.out.println("> session : " + sessionQvo);
	int qNo = sessionQvo.getqNo();
	System.out.println("qNo : " + qNo);
	int pwd = Integer.parseInt(request.getParameter("pwd"));
	System.out.println("pwd : " + pwd);
	System.out.println("sessionQvo.getqPwd() : " + sessionQvo.getqPwd());
	
	
	//암호확인 : DB에 저장된 암호 vs 확인용 암호(파라미터)
	if (!(pwd == (sessionQvo.getqPwd()))) {
		System.out.println(">>암호불일치~~");
		response.sendRedirect("controller?type=delete");
		return;
	}
	
	//암호일치하면 DB 데이터 삭제처리
	try {
		//QnaDAO.delete(qNo);
		
		//페이지 전환
		//response.sendRedirect("controller?type=service&cPage=" + session.getAttribute("cPage"));
	} catch (Exception e) {
		//e.printStackTrace();
		//response.sendRedirect("controller?type=view&qNo=" + qNo
				//+ "&cPage=" + session.getAttribute("cPage"));
	}
*/
%>
