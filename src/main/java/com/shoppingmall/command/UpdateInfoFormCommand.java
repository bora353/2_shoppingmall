package com.shoppingmall.command;

import com.shoppingmall.dao.RegisterDAO;
import com.shoppingmall.vo.UserVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateInfoFormCommand implements Command{

  @Override
  public String exec(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    String id = (String)session.getAttribute("id");
    UserVO user = RegisterDAO.selectUserById(id);
    request.setAttribute("user", user);
    return "/view/updateInfo.jsp";
  }
}
