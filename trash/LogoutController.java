//package com.shoppingmall.controller;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//public class LogoutController implements MyController{
//    @Override
//    public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getSession().invalidate();
//
//        request.getRequestDispatcher("/view/home.jsp").forward(request,response);
//    }
//}
