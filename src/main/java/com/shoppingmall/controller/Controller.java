package com.shoppingmall.controller;

import com.shoppingmall.command.DeleteCommand;
import com.shoppingmall.command.ListCommand;
import com.shoppingmall.command.UpdateCommand;
import com.shoppingmall.command.UpdateOKCommand;
import com.shoppingmall.command.ViewCommand;
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
import com.shoppingmall.command.ProductAddCommand;
import com.shoppingmall.command.ProductDeleteCommand;
import com.shoppingmall.command.ProductListCommand;
import com.shoppingmall.command.ProductSaveCommand;
import com.shoppingmall.command.ProductViewCommand;
import com.shoppingmall.command.ProductViewMainCommand;
import com.shoppingmall.command.ProductEditCommand;
import com.shoppingmall.command.ProductEditDeCommand;
import com.shoppingmall.command.ProductUpdateCommand;

@WebServlet("/product/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Command> commands = null;
	
	@Override
	public void init() throws ServletException {
		commands = new HashMap<String, Command>();
		commands.put("productList", new ProductListCommand()); //제품리스트(판매자)
		commands.put("productView", new ProductViewCommand()); //상세보기(판매자)
		commands.put("productViewMain", new ProductViewMainCommand()); //상세보기(메인)
		commands.put("productAdd", new ProductAddCommand()); //제품등록 페이지 이동
		commands.put("productSave", new ProductSaveCommand()); //제품등록
		commands.put("productEdit", new ProductEditCommand()); //제품수정 페이지 이동
		commands.put("productUpdate", new ProductUpdateCommand()); //제품수정
		commands.put("productEditDe", new ProductEditDeCommand()); //제품삭제 페이지 이동
		commands.put("productDelete", new ProductDeleteCommand()); //제품삭제
		commands.put("reviewList", new ListCommand());
		commands.put("writeOK", new WriteOKCommand());
		commands.put("view", new ViewCommand());
		commands.put("delete", new DeleteCommand());
		commands.put("update", new UpdateCommand());
		commands.put("updateOK", new UpdateOKCommand());
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		//System.out.println("type: " + type);
		System.out.println("type = " + type);
		Command command = commands.get(type);
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
