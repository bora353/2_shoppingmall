//package com.shoppingmall.controller;
//
//import com.shoppingmall.service.RegisterService;
//import com.shoppingmall.service.RegisterServiceImpl;
//import com.shoppingmall.vo.UserVO;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//public class LoginController implements MyController {
//  RegisterService registerService;
//
//  public LoginController() {
//    registerService = new RegisterServiceImpl();
//  }
//  @Override
//  public void process(HttpServletRequest request, HttpServletResponse response)
//      throws ServletException, IOException {
//    request.setCharacterEncoding("UTF-8");
//    response.setContentType("text/html; charset=UTF-8");
//
//    String userId = request.getParameter("userId");
//    String password = request.getParameter("password");
//    String rememberId = request.getParameter("rememberId");
//
//    UserVO selectedUser = registerService.getUserById(userId);
//
//    if(password.equals(selectedUser.getPassword())) {
//      HttpSession session = request.getSession();
//      session.setAttribute("id", userId);
//      System.out.println("rememberId = " + rememberId);
//      if(rememberId != null) {
//        addCookie(response, userId);
//      } else {
//        // 1. 쿠키를 삭제
//        removeCookie(response, userId);
//      }
//      response.sendRedirect("/view/home.jsp");
//    } else {
//      request.setAttribute("result", "0");
//      request.getRequestDispatcher("/view/loginForm.jsp").forward(request,response);
//    }
//
//  }
//
//  private static void removeCookie(HttpServletResponse response, String userId) {
//    Cookie cookie = new Cookie("id", userId); // ctrl+shift+o 자동 import
//    cookie.setMaxAge(0); // 쿠키를 삭제
////		       2. 응답에 저장
//    response.addCookie(cookie);
//  }
//
//  private static void addCookie(HttpServletResponse response, String userId) {
//    //     1. 쿠키를 생성
//    Cookie cookie = new Cookie("id", userId); // ctrl+shift+o 자동 import
////		       2. 응답에 저장
//    response.addCookie(cookie);
//  }
//}
