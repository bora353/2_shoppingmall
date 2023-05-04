package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// 표준
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
