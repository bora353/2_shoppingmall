package com.shoppingmall.command;

import com.shoppingmall.dao.QnaDAO;
import com.shoppingmall.dao.RegisterDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.Qna_ReviewVO;
import com.shoppingmall.vo.UserVO;

public class CSViewCommand implements Command{

  @Override
  public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    HttpSession session =request.getSession();

    // 전달받은 파라미터 값(bbsIdx, cPage)
    String qNo = request.getParameter("qNo");
    String cPage = request.getParameter("cPage");
    System.out.println("qNo: " + qNo + ", cPage: " + cPage);

    //1. 게시글 조회수 1 증가(개인별 실습)

    //2. 게시글(bbsIdx) 데이터 조회
    int qNum = Integer.parseInt(qNo);
    QnaVO qvo = QnaDAO.selectOne(qNum);
    System.out.println("> qvo : " + qvo);

    //3. 게시글(bbsIdx)에 연결된 댓글이 있으면 조회
    List<Qna_ReviewVO> list = QnaDAO.getCommList(qNum);
    System.out.println("> Comment list : " + list);


    String name = (String) session.getAttribute("id");
    UserVO user = RegisterDAO.selectUserById(name);

    System.out.println("user : " + user);



    //EL, JSTL 사용을 위한 scope 상에 데이터 저장하기
    session.setAttribute("qvo", qvo); //수정, 삭제작업시에도 사용할 수 있도록
    session.setAttribute("c_list", list);
    session.setAttribute("userList", user);

    //String cPage = request.getParameter("cPage");
    session.setAttribute("cPage", cPage);

    QnaDAO.updateHit(qNum);


    return "view.jsp";
  }



}
