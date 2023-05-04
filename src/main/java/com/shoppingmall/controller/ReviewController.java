package com.shoppingmall.controller;

import com.shoppingmall.command.CSWriteOkCommand;
import com.shoppingmall.command.WriteOKCommand;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.command.Command;
import com.shoppingmall.command.DeleteCommand;
import com.shoppingmall.command.ListCommand;
import com.shoppingmall.command.UpdateCommand;
import com.shoppingmall.command.UpdateOKCommand;
import com.shoppingmall.command.ViewCommand;

@WebServlet("/review/controller")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> commands = null;

	@Override
	public void init() throws ServletException {
		commands = new HashMap<String, Command>();
		commands.put("reviewList", new ListCommand());
		commands.put("writeOK", new WriteOKCommand());
		commands.put("view", new ViewCommand());
		commands.put("delete", new DeleteCommand());
		commands.put("update", new UpdateCommand());
		commands.put("updateOK", new UpdateOKCommand());

	
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");
		System.out.println("type : " + type);

		String reviewIdx = request.getParameter("reviewIdx");
		request.getSession().setAttribute("reviewIdx", reviewIdx);
		System.out.println("reviewIdx : " + reviewIdx);

		Command command = commands.get(type);
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
