package com.shoppingmall.controller;

import com.shoppingmall.dao.RegisterDAO;
import com.shoppingmall.vo.UserVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register/passwordChange")
public class ChangePasswordController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    HttpSession session = request.getSession();
    UserVO user = RegisterDAO.selectUserById((String)session.getAttribute("id"));
    String newPassword = request.getParameter("password");
    int userIdx = user.getUserIdx();
    Map map = new HashMap();
    map.put("userIdx", userIdx);
    map.put("newPassword", newPassword);
    RegisterDAO.updatePassword(map);
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.print("Success");
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    doGet(request,response);
  }
}
