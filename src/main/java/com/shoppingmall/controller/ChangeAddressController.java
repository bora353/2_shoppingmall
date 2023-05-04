package com.shoppingmall.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
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
import org.json.simple.JSONObject;

@WebServlet("/register/addressChange")
public class ChangeAddressController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = null;
    JSONObject jsonObject = new JSONObject();
    JSONPObject json = null;

    try {
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      out = response.getWriter();
      HttpSession session = request.getSession();
      UserVO user = RegisterDAO.selectUserById((String) session.getAttribute("id"));
      String address = request.getParameter("address");
      System.out.println("address = " + address);
      int userIdx = user.getUserIdx();
      Map map = new HashMap();
      map.put("userIdx", userIdx);
      map.put("newAddress", address);
      RegisterDAO.address(map);
      jsonObject.put("result", "success");
      jsonObject.put("address", address);
      out.print(jsonObject.toJSONString());
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("result", "fail");
      out.print(jsonObject.toJSONString());
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    doGet(request, response);
  }
}
