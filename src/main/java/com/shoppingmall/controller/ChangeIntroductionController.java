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

@WebServlet("/register/introductionChange")
public class ChangeIntroductionController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    JSONObject jsonObject = new JSONObject();
    JSONPObject json = null;

    try {
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      HttpSession session = request.getSession();
      UserVO user = RegisterDAO.selectUserById((String) session.getAttribute("id"));
      String introduction = request.getParameter("introduction");
      int userIdx = user.getUserIdx();
      Map map = new HashMap();
      map.put("userIdx", userIdx);
      map.put("newIntroduction", introduction);
      RegisterDAO.updateIntroduction(map);
      jsonObject.put("result", "success");
      jsonObject.put("introduction", introduction);
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
