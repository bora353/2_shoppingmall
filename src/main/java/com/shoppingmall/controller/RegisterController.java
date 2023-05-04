package com.shoppingmall.controller;

import com.shoppingmall.command.JoinCommand;
import com.shoppingmall.command.LoginCheckCommand;
import com.shoppingmall.command.LoginFormCommand;
import com.shoppingmall.command.LogoutCommand;
import com.shoppingmall.command.RegisterFormCommand;
import com.shoppingmall.command.UpdateInfoFormCommand;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import
    javax.servlet.http.HttpServletResponse;

import com.shoppingmall.command.Command;

@WebServlet("/register/controller")
public class RegisterController extends HttpServlet {

  private Map<String, Command> commands = null;

  @Override
  public void init() throws ServletException {
    commands = new HashMap<String, Command>();

    commands.put("registerForm", new RegisterFormCommand());
    commands.put("join", new JoinCommand());
    commands.put("updateInfoForm", new UpdateInfoFormCommand());
  }


  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    System.out.println("RegisterController.doGet");
    String type = request.getParameter("type");
    System.out.println("type : " + type);

    Command command = commands.get(type);
    String path = command.exec(request, response);
    if (path.equals("/main")) {
      response.sendRedirect("/main");
    } else {
      request.getRequestDispatcher(path).forward(request, response);
    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse
      response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    doGet(request, response);
  }

}
