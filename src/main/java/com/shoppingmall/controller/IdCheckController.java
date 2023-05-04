package com.shoppingmall.controller;


import com.shoppingmall.dao.RegisterDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register/checkId")
public class IdCheckController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String checkId = request.getParameter("checkId");
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();

    if (checkDuplicate(checkId)) {
      out.print("Duplicate");
    } else {
      out.print("Available");
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    doGet(request, response);
  }

  public boolean checkDuplicate(String checkId) {

    System.out.println("checkId = " + checkId);
    String duplicateId = null;
    try {
      duplicateId = RegisterDAO.selectAll().stream().map((user) -> user.getUserId())
          .filter((s) -> s.equals(checkId)).findAny().orElse(null);
    } catch (NullPointerException e) {
      duplicateId = null;
    }

    return duplicateId == null ? false : true;
  }
}
