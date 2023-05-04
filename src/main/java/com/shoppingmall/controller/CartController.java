package com.shoppingmall.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.command.CartDeleteCommand;
import com.shoppingmall.command.CartInsertCommand;
import com.shoppingmall.command.CartListCommand;
import com.shoppingmall.command.Command;

@WebServlet("/cart/controller")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> commands = null;

	@Override
	public void init() throws ServletException {
		commands = new HashMap<String, Command>();
		commands.put("cartList", new CartListCommand());
		commands.put("deleteCart", new CartDeleteCommand());
		commands.put("cartInsert", new CartInsertCommand());

		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");
		System.out.println("type : " + type);
		
		Command command = commands.get(type);
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
