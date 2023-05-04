package com.shoppingmall.command;

import com.shoppingmall.dao.RegisterDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.vo.UserVO;

public class LoginCheckCommand implements Command {

  public String exec(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String userId = request.getParameter("userId");
    System.out.println("userId : " + userId);
    String password = request.getParameter("password");
    String rememberId = request.getParameter("rememberId");

    UserVO selectedUser = RegisterDAO.selectUserById(userId);
    System.out.println("selectedUser = " + selectedUser);
    if (selectedUser == null ||!password.equals(selectedUser.getPassword())) {
      request.setAttribute("result", "0");
      return "/view/loginForm.jsp";
    } else {
      HttpSession session = request.getSession();
      session.setAttribute("user", selectedUser);
      session.getAttribute("id");
      session.setAttribute("id", userId);
      session.setAttribute("userIdx", selectedUser.getUserIdx());
      System.out.println("rememberId = " + rememberId);

      if (rememberId != null) {
        addCookie(response, userId);
      } else {
        // 1. 쿠키를 삭제
        removeCookie(response, userId);
      }
      return "/main";
    }
  }

  private static void removeCookie(HttpServletResponse response, String userId) {
    Cookie cookie = new Cookie("id", userId); // ctrl+shift+o 자동 import
    cookie.setMaxAge(0); // 쿠키를 삭제
//				       2. 응답에 저장
    response.addCookie(cookie);
  }

  private static void addCookie(HttpServletResponse response, String userId) {
    // 1. 쿠키를 생성
    Cookie cookie = new Cookie("id", userId); // ctrl+shift+o 자동 import
//				       2. 응답에 저장
    response.addCookie(cookie);
  }

}
