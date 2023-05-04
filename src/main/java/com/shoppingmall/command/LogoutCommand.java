package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogoutCommand implements Command {
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.getSession().invalidate();
        
        return "/main";

	}
}
