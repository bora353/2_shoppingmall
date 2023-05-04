package com.shoppingmall.controller;

import com.shoppingmall.command.CSDeleteCommand;
import com.shoppingmall.command.CSDeleteOkCommand;
import com.shoppingmall.command.CSViewCommand;
import com.shoppingmall.command.CSWriteCommand;
import com.shoppingmall.command.CSWriteOkCommand;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.command.Command;
import com.shoppingmall.command.DeleteCommand;
import com.shoppingmall.command.DeleteOkCommand;
import com.shoppingmall.command.ModifyCommand;
import com.shoppingmall.command.ModifyOkCommand;
import com.shoppingmall.command.ReviewDeleteCommand;
import com.shoppingmall.command.ReviewDeleteOkCommand;
import com.shoppingmall.command.ReviewWriteCommand;
import com.shoppingmall.command.ServiceCommand;
import com.shoppingmall.command.WriteCommand;




@WebServlet("/services/controller")
public class ServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, Command> commands = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		//commands에 Map 객체 생성해서 저장하고
		//commands에 요청작업명-요청처리객체 저장
		//예) commands.put("list", new ListCommand());
		commands = new HashMap<String, Command>();
		commands.put("service", new ServiceCommand());
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행-----------");
		String type = request.getParameter("type");
		System.out.println(":: type : " + type);

		Command command = null;
		
		if ("service".equals(type)) {
			//ListCommand command = new ListCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new ServiceCommand();
		} 
		if ("write".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new CSWriteCommand();
		}
		
		if ("writeOk".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new CSWriteOkCommand();
		}
		
		if ("view".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new CSViewCommand();
		}
		if ("delete".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new CSDeleteCommand();
		}
		if ("deleteOk".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new CSDeleteOkCommand();
		}
		
		if ("modify".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new ModifyCommand();
		}
		
		if ("modifyOk".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new ModifyOkCommand();
		}
		
		if ("reviewDelete".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new ReviewDeleteCommand();
		}
		
		if ("reviewDeleteOk".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new ReviewDeleteOkCommand();
		}
		
		if ("reviewWrite".equals(type)) {
			//DeptCommand command = new DeptCommand();
			//String path = command.exec(request, response);	
			//request.getRequestDispatcher(path).forward(request, response);
			command = new ReviewWriteCommand();
		}
		
		String path = command.exec(request, response);	
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행-----------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}

