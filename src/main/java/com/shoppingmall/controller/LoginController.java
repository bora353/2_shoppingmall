package com.shoppingmall.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.command.Command;
import com.shoppingmall.command.LoginCheckCommand;
import com.shoppingmall.command.LoginFormCommand;
import com.shoppingmall.command.LogoutCommand;

@WebServlet("/login/controller")
public class LoginController extends HttpServlet {

  private Map<String, Command> commands = null;

  @Override
  public void init() throws ServletException {
    commands = new HashMap<String, Command>();
    commands.put("loginForm", new LoginFormCommand());
    commands.put("loginCheck", new LoginCheckCommand());
    commands.put("logOut", new LogoutCommand());
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String type = request.getParameter("type");
    System.out.println("type : " + type);

    Command command = commands.get(type);
    System.out.println("command : " + command);
    String path = command.exec(request, response);
		if (path.equals("/main")) {
			response.sendRedirect("/main");
		} else {
			request.getRequestDispatcher(path).forward(request, response);
		}
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    doGet(request, response);
  }

}
